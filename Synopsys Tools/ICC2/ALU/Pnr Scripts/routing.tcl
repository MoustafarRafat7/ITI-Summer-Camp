
# 1.routing


copy_block -from_block ALU.dlib:CTS.design -to_block ALU_Routing.design
current_block ALU_Routing.design

#  check for any issues that might cause problems during routing
report_qor -summary
check_design -checks pre_route_stage
check_design -checks {pre_route_stage mv_design routability} 


#antenna rules (change the directory according to your project)

source /home/user26/Student_PDK/LIB/saed90nm_1p9m_antenna.tcl



## Routing  (Performs all routing stages in one step the command runs global routing, track assignment, and detail routing )

#route_auto

###our flow

route_global

check_pg_drc

#Information: Skipping global routing as it has already been run in the global_route_opt stage of clock_opt. (ZRT-607)

route_track

check_pg_drc

route_detail

check_pg_drc

# Routing Optimization



check_pg_drc
#Final Check
check_routes

check_pg_drc

#Routing is Finished 

# 2.Filler Cells Insertion

set FillerCells " SHFILL128 SHFILL64 SHFILL1 "
create_stdcell_fillers -lib_cells $FillerCells

connect_pg_net -automatic

remove_stdcell_fillers_with_violation

check_legality

# 3.Checks & Reports
# First Create new directory called Reportss in pnr folder

set DESIGN_NAME ALU

# Netlist after physical synthesis
write_verilog  ./Reports/${DESIGN_NAME}_Routing_Netlist.v

#SDC_OUT
write_sdc -Reports ./Reports/${DESIGN_NAME}_Routing_SDC.sdc

#our_out >>> Warning: Multiply cell derates are skipped!

#Warning: Multiply net derates are skipped!

# SPEF_OUT
write_parasitics -format SPEF -Reports ./Reports/${DESIGN_NAME}_Routing_Spef.spef


##our out>>> NEX:Warning write_parasitics supports only Ohm and kOhm as user resistance unit not 1MOhm, we force to set it Ohm.NEX: write_parasitics command finished

######DEF_OUT
write_def ./Reports/${DESIGN_NAME}_Routing_def.def


##########GDS_OUT

set GDS_MAP_FILE /home/user26/Student_PDK/LIB/saed90nm.gdsout.map

set STD_CELL_GDS /home/user26/Student_PDK/LIB/saed90nm.gds

write_gds \
-view design \
-lib_cell_view frame \
-Reports_pin all \
-fill include \
-exclude_empty_block \
-long_names \
-layer_map "$GDS_MAP_FILE" \
-keep_data_type \
-merge_files "$STD_CELL_GDS" \
./Reports/${DESIGN_NAME}_Routing_GDS.gds



# Save Netlist


write_verilog  ../output/Routing_netlist.v

#save block


save_block -as Routing ALU.dlib:ALU_Routing.design


# Export Reports

report_cell > ./Reports/routing_cells.rpt

report_qor  > ./Reports/Routing_qor.rpt

report_timing -max_paths 10 > ./Reports/Routing_timing.rpt

report_timing -delay min -max_paths 10 > ./Reports/Routing_timing_hold.rpt

check_legality -verbose > ./Reports/Routing_legalization.rpt

report_utilization > ./Reports/Routing_legalization.rpt

report_routing_rules -verbose > ./Reports/Routing_routing_rules.rpt

report_clock_routing_rules > ./Reports/Routing_Clock_routing_rules.rpt

report_ports -verbose [get_ports *clk*] > ./Reports/Routing_ports.rpt

report_clock_settings > ./Reports/Routing_clk_setting.rpt














