# PT script

pt_shell
start_gui

#assign search path  
set_app_var search_path "/home/user26/Student_PDK/LIB"

#assign target & Link  library 
set_app_var target_library "saed90nm_max_lth.db"

set_app_var link_library "* $target_library"

# Netlist Reading from ICC2
read_verilog /home/user26/Moustafa_Mohammed/Labs/Labs/ALU/output/ALU_Routing_Netlist.v

link_design

# Reading parasitics & constrains
read_parasitics /home/user26/Moustafa_Mohammed/Labs/Labs/ALU/output/ALU_Routing_Spef.spef.maxTLU_-40.spef

read_sdc /home/user26/Moustafa_Mohammed/Labs/Labs/ALU/output/ALU_Routing_SDC.sdc
update_timing

# Checks 

report_timing > ./Prime_Time/ALU.Timing.rpt
report_analysis_coverage > ./Prime_Time/ALU.analysis_coverage.rpt
report_global_timing       > ./Prime_Time/ALU_global_timing.rpt
report_clocks > ./Prime_Time/ALU_global_clocks.rpt

report_constraint -all_violators -significant_digits 4 > ./Prime_Time/ALU.max_constr.rpt
report_timing -delay_type max -nworst 40 -significant_digits 4 > ./Prime_Time/ALU.max_timing.rpt

write_sdf ./Prime_Time/ALU.max.sdf
