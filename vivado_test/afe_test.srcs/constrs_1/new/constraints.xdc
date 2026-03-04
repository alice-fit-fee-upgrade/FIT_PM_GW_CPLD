set_property IOSTANDARD LVCMOS18    [get_ports ADC_CLK]
set_property PACKAGE_PIN AF24       [get_ports ADC_CLK]
set_false_path -to                  [get_ports ADC_CLK]
set_property IOSTANDARD LVCMOS18    [get_ports {ADC_RESET[0]}]
set_property PACKAGE_PIN AF25       [get_ports {ADC_RESET[0]}]
set_false_path -to                  [get_ports {ADC_RESET[0]}]
set_property IOSTANDARD LVCMOS18    [get_ports ADC_MOSI]
set_property PACKAGE_PIN AC17       [get_ports ADC_MOSI]
set_false_path -to                  [get_ports ADC_MOSI]
set_property IOSTANDARD LVCMOS18    [get_ports {ADC_EN2[0]}]
set_property PACKAGE_PIN AF23       [get_ports {ADC_EN2[0]}]
set_false_path -to                  [get_ports {ADC_EN2[0]}]
set_property IOSTANDARD LVCMOS18    [get_ports {ADC_EN1[0]}]
set_property PACKAGE_PIN AF20       [get_ports {ADC_EN1[0]}]
set_false_path -to                  [get_ports {ADC_EN1[0]}]

set_property IOSTANDARD LVDS        [get_ports PLL*]
set_property DIFF_TERM_ADV TERM_100 [get_ports PLL_clk_p]
set_property PACKAGE_PIN AD20       [get_ports PLL_clk_p]

set_property IOSTANDARD LVCMOS18    [get_ports OSC1]
set_property PACKAGE_PIN AC19       [get_ports OSC1]

set_property IOSTANDARD LVCMOS33    [get_ports UART_DBG_*]
set_property PACKAGE_PIN J9         [get_ports UART_DBG_rxd]
set_false_path -from                [get_ports UART_DBG_rxd]
set_property PACKAGE_PIN K9         [get_ports UART_DBG_txd]
set_false_path -to                  [get_ports UART_DBG_txd]


## Timing constraints for ADC A interface ##
create_clock -name adc_b_clk -period 4.000 [get_ports ADC_B_CLK_P]
create_clock -name adc_b_clk_launch -period 4.00 -waveform {3 5}

set_input_delay -clock adc_b_clk_launch -max 0.4 [get_ports ADC_BB_*]
set_input_delay -clock adc_b_clk_launch -min 0.67 [get_ports ADC_BB_*]
set_input_delay -clock adc_b_clk_launch -max 0.4 [get_ports ADC_BA_*]
set_input_delay -clock adc_b_clk_launch -min 0.67 [get_ports ADC_BA_*]
###########################################

set_property IOSTANDARD LVDS [get_ports ADC_B_CLK_*]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_B_CLK_*]
set_property PACKAGE_PIN AB21 [get_ports ADC_B_CLK_P]

set_property IOSTANDARD LVDS [get_ports ADC_BA_*]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_BA_P*]
set_property PACKAGE_PIN AD23 [get_ports {ADC_BA_P[0]}]
set_property PACKAGE_PIN AE22 [get_ports {ADC_BA_P[1]}]
set_property PACKAGE_PIN AD21 [get_ports {ADC_BA_P[2]}]
set_property PACKAGE_PIN AF18 [get_ports {ADC_BA_P[3]}]
set_property PACKAGE_PIN AE17 [get_ports {ADC_BA_P[4]}]
set_property PACKAGE_PIN AC18 [get_ports {ADC_BA_P[5]}]
set_property PACKAGE_PIN AD16 [get_ports {ADC_BA_P[6]}]

set_property IOSTANDARD LVDS [get_ports ADC_BB_*]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_BB_P*]
set_property PACKAGE_PIN AD24 [get_ports {ADC_BB_P[0]}]
set_property PACKAGE_PIN AA22 [get_ports {ADC_BB_P[1]}]
set_property PACKAGE_PIN Y20  [get_ports {ADC_BB_P[2]}]
set_property PACKAGE_PIN AA19 [get_ports {ADC_BB_P[3]}]
set_property PACKAGE_PIN AA20 [get_ports {ADC_BB_P[4]}]
set_property PACKAGE_PIN AB24 [get_ports {ADC_BB_P[5]}]
set_property PACKAGE_PIN AC22 [get_ports {ADC_BB_P[6]}]


## Bank 66
## Timing constraints for ADC A interface ##
create_clock -name adc_a_clk -period 4.000 [get_ports ADC_A_CLK_P]
create_clock -name adc_a_clk_launch -period 4.00 -waveform {3 5}

set_input_delay -clock adc_a_clk_launch -max 0.4 [get_ports ADC_AB_*]
set_input_delay -clock adc_a_clk_launch -min 0.67 [get_ports ADC_AB_*]
set_input_delay -clock adc_a_clk_launch -max 0.4 [get_ports ADC_AA_*]
set_input_delay -clock adc_a_clk_launch -min 0.67 [get_ports ADC_AA_*]
###########################################

set_property IOSTANDARD LVDS [get_ports ADC_A_CLK_*]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_A_CLK_*]
set_property PACKAGE_PIN K22 [get_ports ADC_A_CLK_P]

set_property IOSTANDARD LVDS [get_ports ADC_AA_*]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_AA_P*]
set_property PACKAGE_PIN H21 [get_ports {ADC_AA_P[0]}]
set_property PACKAGE_PIN K21 [get_ports {ADC_AA_P[1]}]
set_property PACKAGE_PIN G24 [get_ports {ADC_AA_P[2]}]
set_property PACKAGE_PIN F24 [get_ports {ADC_AA_P[3]}]
set_property PACKAGE_PIN H23 [get_ports {ADC_AA_P[4]}]
set_property PACKAGE_PIN H26 [get_ports {ADC_AA_P[5]}]
set_property PACKAGE_PIN J23 [get_ports {ADC_AA_P[6]}]

set_property IOSTANDARD LVDS [get_ports ADC_AB_*]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_AB_P*]
set_property PACKAGE_PIN L20 [get_ports {ADC_AB_P[0]}]
set_property PACKAGE_PIN K25 [get_ports {ADC_AB_P[1]}]
set_property PACKAGE_PIN M25 [get_ports {ADC_AB_P[2]}]
set_property PACKAGE_PIN M19 [get_ports {ADC_AB_P[3]}]
set_property PACKAGE_PIN L24 [get_ports {ADC_AB_P[4]}]
set_property PACKAGE_PIN L22 [get_ports {ADC_AB_P[5]}]
set_property PACKAGE_PIN J25 [get_ports {ADC_AB_P[6]}]


