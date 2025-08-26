################################################################################

# This XDC is used only for OOC mode of synthesis, implementation
# This constraints file contains default clock frequencies to be used during
# out-of-context flows such as OOC Synthesis and Hierarchical Designs.
# This constraints file is not used in normal top-down synthesis (default flow
# of Vivado)
################################################################################
create_clock -name CLK_A_OUT_N -period 4.167 [get_ports CLK_A_OUT_N]
create_clock -name CLK_A_OUT_P -period 4.167 [get_ports CLK_A_OUT_P]
create_clock -name CLK_B_OUT_N -period 4.167 [get_ports CLK_B_OUT_N]
create_clock -name CLK_B_OUT_P -period 4.167 [get_ports CLK_B_OUT_P]
create_clock -name PLL_clk_p -period 10 [get_ports PLL_clk_p]

################################################################################