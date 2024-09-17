set design UART_TX_TOP 

set search_path "/mnt/ext/synopsys/pdks/32nm/install/edu/SAED32_EDK/lib/stdcell_rvt/SAED32_EDK/lib/stdcell_rvt/db_nldm"


# ----------- Link and Target library 
set_app_var link_library "* saed32rvt_tt1p05v125c.db"
set_app_var target_library "saed32rvt_tt1p05v125c.db"

sh rm -rf work
sh mkdir -p work
define_design_lib work -path ./work

analyze -library work -format verilog ../RTL/${design}.v
elaborate $design -lib work
current_design 

#write GETECH netlist
write -hierarchy -format verilog -output ../output/${design}.v

check_design
source ../cons/cons.tcl
link

compile -map_effort medium

report_area > ./report/synth_area.rpt
report_cell > ./report/synth_cells.rpt
report_qor  > ./report/synth_qor.rpt
report_resources > ./report/synth_resources.rpt
report_timing -max_paths 10 > ./report/synth_timing.rpt 
 
write_sdc  output/${design}.sdc 

define_name_rules  no_case -case_insensitive
change_names -rule no_case -hierarchy
change_names -rule verilog -hierarchy
set verilogout_no_tri	 true
set verilogout_equation  false

write -hierarchy -format verilog -output output/${design}.v 
write -f ddc -hierarchy -output output/${design}.ddc   

set_svf -off
