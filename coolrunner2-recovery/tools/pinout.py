#!/usr/bin/env python3
import json
from pathlib import Path
R=Path(__file__).resolve().parent.parent
x=json.loads((R/'decoded/previous-input/original.json').read_text())
ports={27:('ADC_CLK','CLK80','ADC clock fanout, ADC clock distribution'),63:('CFD_OUT','STR','CFD comparator, sheet 12'),64:('Gate_STR1_o','ENA','Gate/strobe circuit, sheet 12'),81:('Gate_STR1_i','CLK40','Gate/strobe circuit, sheet 12'),53:('INTA_G_DRV','CLK20_P','Integrator A gate driver'),54:('INTB_G_DRV','CLK20_N','Integrator B gate driver'),82:('STR1_','DV','FPGA data-valid input'),60:('EV_IN_','EV','event-chain input'),16:('EV_OUT_','EV_out','event-chain output')}
for i,p in enumerate([35,34,33,32,30,29,28,23,24,22,19,18]):ports[p]=(f'ADCA_D{i}',f'ADC0<{i}>','ADC A digital data')
for i,p in enumerate([52,50,49,46,44,43,42,41,40,39,37,36]):ports[p]=(f'ADCB_D{i}',f'ADC1<{i}>','ADC B digital data')
for i,p in enumerate([99,97,96,95,94,93,92,91,90,89,87,86,85]):ports[p]=(f'DI{i}_',f'DOUT<{i}>','FPGA ADC data bus')
ios={m['pin']:m for f in x['function_blocks'] for m in f['macrocells'] if m['pin']}
lines=['# Pinout FIT PM12','', 'Źródło: dołączony PDF, arkusz 10/34 (DD18), wizualnie sprawdzony. Nazwy HDL dopasowano do równań golden JED; brak historycznego UCF. Kierunki Gate_STR1 wynikają także z obwodu na arkuszu 12.','', '| Pin | Zasób | Sieć | HDL | Kierunek JED | Otoczenie | Funkcja specjalna |','|---:|---|---|---|---|---|---|']
rows=[];ucf=['# FIT PM12 sheet 10; HDL mapping verified against golden equations.', '# Gate_STR1_o=P64 is ENA input; Gate_STR1_i=P81 is CLK40 output.', '# Schematic legacy annotation CLK40 out beside P64 contradicts golden JED.']
specialnets={45:'CPLD_TDI',83:'CPLD_TDO',48:'CPLD_TCK',47:'CPLD_TMS'}
for p in range(1,101):
    res=x['physical_pins'][str(p)];m=ios.get(p);net,port,dest=ports.get(p,(specialnets.get(p,'NC' if m else res),'—','JTAG chain' if p in specialnets else 'unconnected' if m else 'power/ground'))
    direction=('output' if m['output_enabled'] else 'input' if p in ports else 'NC') if m else ('output' if p==83 else 'input' if p in specialnets else 'power')
    if p in (20,38,51,5): net='P3V3'
    elif p in (26,57,88,98):net='P1V8'
    elif res=='GND':net='GND'
    sp=','.join(m['special']) if m else res
    hardware_direction=direction
    if p==63:dest='DD1 pin7 LVPECL→LVTTL receiver output, sheet 12'
    if p==64:dest='DD1 pin6 Gate receiver output, sheet 12'
    if p==81:dest='DA2/R1/R9 gate shaping input, sheet 12'
    rows.append(dict(pin=p,resource=res,net=net,hdl=port,direction=direction,hardware_direction_inferred=hardware_direction,destination=dest,special=sp))
    lines.append(f'| {p} | {res} | {net} | {port} | {direction} | {dest} | {sp} |')
    if p in ports:ucf.append(f'NET "{port}" LOC = "P{p}";')
lines+=['','## Sprzeczności i ograniczenia','','- Arkusz 10 opisuje pin 64 jako CLK40 out; golden konfiguruje go jako wejście ENA. Pin 81 jest wyjściem CNT(0). Te ustalenia zgadzają się z kierunkiem buforów arkusza 12.','- Etykieta ENA in przy ADCB_D10 jest luźną adnotacją, a nie połączeniem elektrycznym. ENA jest pinem 64, co potwierdza T input FB6/MC1.','- ADCA_D10_/ADCA_D11_ i ADCB_D11_ mają lokalne etykiety z podkreśleniem, lecz porty arkusza bez niego. Zachowano nazwy portów; nie interpretowano podkreślenia jako inwersji.','- Speed grade i VQ100 w JED są metadanymi, nie odczytem identyfikatora/speed bin fizycznego krzemu. Schemat deklaruje XC2C128-7VQG100C.','- Wartości LOW/HIGH konfiguracji banków nie są pomiarem napięcia zasilania. Schemat wskazuje bank 1 (ISE bank 0) 3.3 V i bank 2 (ISE bank 1) 1.8 V. Rzeczywiste buildy ISE potwierdziły identyczność konfiguracji banków. Recovered UCF ustala piny i 18 wyjść SLEW=SLOW; baseline UCF ustala tylko piny.']
(R/'reports/previous-input/pinout.md').write_text('\n'.join(lines)+'\n')
(R/'decoded/pinout.json').write_text(json.dumps(rows,indent=2)+'\n')
(R/'recovered/previous-input/amplcpld.ucf').write_text('\n'.join(ucf)+ '\n' + '\n'.join(f'NET "{p["hdl"]}" SLEW = SLOW;' for p in rows if p['hdl']!='—' and p['direction']=='output')+'\n')
(R/'known_hdl/baseline.ucf').write_text('\n'.join(ucf)+'\n')
