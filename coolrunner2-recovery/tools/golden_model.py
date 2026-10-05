"""Independent logical evaluator of decoded product terms and macrocell modes.

Not a timing model. Inputs are physical pad values; state is MC Q values.
All transitions evaluate RHS from the old state. Async set/reset are supported.
"""
import json
from pathlib import Path

class Model:
    def __init__(self, path):
        self.ir=json.loads(Path(path).read_text())
        self.fbs=self.ir['function_blocks']
        self.mcs={m['resource']: (f,m) for f in self.fbs for m in f['macrocells']}
        self.initial={r:int(m['configuration']['REG_INIT']) for r,(f,m) in self.mcs.items() if m['registered']}

    def context(self, state, pads):
        cache={}; active=set()
        def source(s):
            if s=='VCC': return 1
            if s=='GND': return 0
            if s in cache:return cache[s]
            if s in active: raise ValueError('Combinational cycle: '+s)
            active.add(s)
            kind,r=s.split('_',1); fb,mc=self.mcs[r]; c=mc['configuration']
            mux=c.get('IOB_ZIA_MUX') if kind=='IOB' else c['MC_ZIA_MUX']
            if kind=='IOB':
                v=state.get(r,0) if mux=='REG' else pads.get(mc['pin'],0)
            elif mux=='REG': v=state[r]
            elif mux=='XOR': v=xor(fb,mc)
            else: raise ValueError('Reference to disabled MC '+r)
            active.remove(s); cache[s]=v; return v
        def pt(fb,t):
            v=1
            for lit in fb['and_terms'][t]:
                n=int(lit.lstrip('!')); b=source(fb['zia'][n]); v &= b^int(lit.startswith('!'))
            return v
        def xor(fb,mc):
            i=mc['index']-1
            s=int(any(pt(fb,int(t)) for t in fb['or_terms'][i]))
            mode=mc['configuration']['XOR_MUX']
            return s ^ ({'GND':lambda:0,'VCC':lambda:1,'PT':lambda:pt(fb,10+3*i),'PT_INV':lambda:1^pt(fb,10+3*i)}[mode]())
        return source,pt,xor

    def step(self,state,pads,clock='FCLK2',falling=False):
        source,pt,xor=self.context(state,pads); new=state.copy()
        for r in state:
            fb,mc=self.mcs[r]; c=mc['configuration']; i=mc['index']-1
            def sr(name):
                sel=c[name]
                if sel=='GND':return 0
                if sel=='PT':return pt(fb,8+3*i)
                if sel in ('CT5','CT6'):return pt(fb,int(sel[2:]))
                raise ValueError('Unsupported global set/reset')
            if sr('RST_MUX'):new[r]=0;continue
            if sr('SET_MUX'):new[r]=1;continue
            if c['CLK_MUX']!=clock or bool(int(c['CLK_INV']))!=falling:continue
            if c['REG_MODE']=='DFFCE' and not pt(fb,10+3*i):continue
            if c.get('REG_D_MUX','XOR')=='IBUF':d=pads.get(mc['pin'],0)
            else:d=xor(fb,mc)
            if c['REG_MODE']=='TFF':d^=state[r]
            elif c['REG_MODE'] not in ('DFF','DFFCE'):raise ValueError('Latch/DDR requires separate handling')
            new[r]=d
        return new

    def outputs(self,state,pads):
        _,pt,xor=self.context(state,pads); out={}
        for r,(fb,mc) in self.mcs.items():
            if not mc['output_enabled']:continue
            c=mc['configuration']
            if c['OE_MUX']=='IS_GND':
                out[mc['pin']]=0;continue
            if c['OE_MUX']!='VCC':raise ValueError('Nontrivial OE needs explicit modeling')
            out[mc['pin']]=state[r] if c['MC_IOB_MUX']=='REG' else xor(fb,mc)
        return out
