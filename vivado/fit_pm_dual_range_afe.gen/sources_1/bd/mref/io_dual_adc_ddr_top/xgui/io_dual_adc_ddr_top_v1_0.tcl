# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ADC_DATA_LINES" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ADC_RESOLUTION_BITS" -parent ${Page_0}


}

proc update_PARAM_VALUE.ADC_DATA_LINES { PARAM_VALUE.ADC_DATA_LINES } {
	# Procedure called to update ADC_DATA_LINES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADC_DATA_LINES { PARAM_VALUE.ADC_DATA_LINES } {
	# Procedure called to validate ADC_DATA_LINES
	return true
}

proc update_PARAM_VALUE.ADC_RESOLUTION_BITS { PARAM_VALUE.ADC_RESOLUTION_BITS } {
	# Procedure called to update ADC_RESOLUTION_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADC_RESOLUTION_BITS { PARAM_VALUE.ADC_RESOLUTION_BITS } {
	# Procedure called to validate ADC_RESOLUTION_BITS
	return true
}


proc update_MODELPARAM_VALUE.ADC_DATA_LINES { MODELPARAM_VALUE.ADC_DATA_LINES PARAM_VALUE.ADC_DATA_LINES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADC_DATA_LINES}] ${MODELPARAM_VALUE.ADC_DATA_LINES}
}

proc update_MODELPARAM_VALUE.ADC_RESOLUTION_BITS { MODELPARAM_VALUE.ADC_RESOLUTION_BITS PARAM_VALUE.ADC_RESOLUTION_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADC_RESOLUTION_BITS}] ${MODELPARAM_VALUE.ADC_RESOLUTION_BITS}
}

