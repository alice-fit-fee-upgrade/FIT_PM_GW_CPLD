SRC_DIR = src
TB_DIR = tb

VHDL_SRC_CNT2 = $(SRC_DIR)/cnt2.vhd
TB_SRC_CNT2 = $(TB_DIR)/cnt2_tb.vhd
SIM_TOP_CNT2 = cnt2_tb

VHDL_SRC_MUX_LATCH = $(SRC_DIR)/mux_latch.vhd $(SRC_DIR)/cnt2.vhd
TB_SRC_MUX_LATCH = $(TB_DIR)/mux_latch_tb.vhd
SIM_TOP_MUX_LATCH = mux_latch_tb

VHDL_SRC_ADC_CHANNEL = $(SRC_DIR)/adc_channel_mux.vhd $(SRC_DIR)/adc_channel_shift_reg.vhd $(SRC_DIR)/adc_channel_pipeline.vhd $(SRC_DIR)/adc_channel_avg.vhd $(SRC_DIR)/adc_channel_top.vhd
TB_SRC_ADC_CHANNEL = $(TB_DIR)/adc_channel_avg_tb.vhd
SIM_TOP_ADC_CHANNEL = adc_channel_avg_tb

WAVE_FILE = wave.ghw

GHDL = ghdl
GTK_WAVE = gtkwave

FLAGS = --std=08 -fsynopsys 

######## COMMANDS ########
cnt2_tb: clean run_cnt2 view

mux_latch_tb: clean run_mux_latch view

adc_channel_avg_tb: clean run_adc_channel view

all: run_cnt2 view
##########################

compile_cnt2:
	$(GHDL) -a $(FLAGS) $(VHDL_SRC_CNT2)
	$(GHDL) -a $(FLAGS) $(TB_SRC_CNT2)
	$(GHDL) -e $(FLAGS) $(SIM_TOP_CNT2)

run_cnt2: compile_cnt2
	$(GHDL) -r $(FLAGS) $(SIM_TOP_CNT2) --wave=$(WAVE_FILE)

compile_mux_latch:
	$(GHDL) -a $(FLAGS) $(VHDL_SRC_MUX_LATCH)
	$(GHDL) -a $(FLAGS) $(TB_SRC_MUX_LATCH)
	$(GHDL) -e $(FLAGS) $(SIM_TOP_MUX_LATCH)

run_mux_latch: compile_mux_latch
	$(GHDL) -r $(FLAGS) $(SIM_TOP_MUX_LATCH) --wave=$(WAVE_FILE)

compile_adc_channel:
	$(GHDL) -a $(FLAGS) $(VHDL_SRC_ADC_CHANNEL)
	$(GHDL) -a $(FLAGS) $(TB_SRC_ADC_CHANNEL)
	$(GHDL) -e $(FLAGS) $(SIM_TOP_ADC_CHANNEL)

run_adc_channel: compile_adc_channel
	$(GHDL) -r $(FLAGS) $(SIM_TOP_ADC_CHANNEL) --wave=$(WAVE_FILE)

view:
	$(GTK_WAVE) $(WAVE_FILE)

clean:
	rm -f *.o *.cf $(WAVE_FILE) *.exe

.PHONY: all compile run view clean