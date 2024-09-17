# ---------------------------  Setup --------------------------- #

set search_path "/mnt/ext/synopsys/pdks/32nm/install/edu/SAED32_EDK/lib/stdcell_rvt/SAED32_EDK/lib/stdcell_rvt/db_nldm"



# ----------- Link and Target library 
set_app_var link_library "* saed32rvt_tt1p05v125c.db"
set_app_var target_library "saed32rvt_tt1p05v125c.db"

# If you want to replace the entire design module that consists of leaf cells, you 
# should use the remove_design command to remove the module and then read the Verilog netlist description of that module into memor
remove_design -all
# ----- Change mode for testing   
set test_default_scan_style


# --------------------------- Read_Design --------------------------- #
# -----Netlist 
#read_verilog /home/user26/Moustafa_Mohammed/DC/Script/output/ALU.v
read_ddc /home/user26/Moustafa_Mohammed/DC/Script/output/ALU.ddc
# -----Constraits 
read_sdc /home/user26/Moustafa_Mohammed/DC/Script/output/ALU.sdc

# --------------------------- Test_prtocol --------------------------- #

# depend on number of scan chains 
# ----- Create_Ports_for_Testability
for {set i 0} {$i < 2 } { incr i } {
 create_port -direction in Scan_In[$i]
 set_dft_signal -type ScanDataIn -view spec -port Scan_In[$i] 
}

for {set j 0 } {$j < 2 } {incr j } { 
 create_port -direction out Scan_Out[$j]
 set_dft_signal -type ScanDataOut -view spec -port Scan_Out[$j]
}

create_port -direction in { Scan_En  } 


# ----- Test_prtocol 
#For signal already connected in design (view exist)
set_dft_signal -view exist -type ScanMasterClock -timing {45 55} -port clk

#set_dft_signal -view exist -type Reset -active 1 -port r

#For signal not connected in design (view spec)
#set_dft_signal -view spec -type ScanDataIn -port Scan_In
#set_dft_signal -view spec -type ScanDataOut -port Scan_Out
set_dft_signal -view spec -type ScanEnable -active 1 -port Scan_En

#Determined number of scan chin 
set_scan_configuration -chain_count 2

# -------Simple_Constaints 
create_clock clk -period 1000
for { set k 0 } { $k < 8 } {incr k} {
set_input_delay 250 Scan_In[$k] -clock CLK
}

set_input_delay 150 Scan_En -clock CLK
# ------- Report All Signals 
report_dft_signal -view exist
report_dft_signal -view spec

# -------Create_Test_protocol 
create_test_protocol
# ------------------- Drc_checking ------------------- #
dft_drc


#read_test_protocol ../results/johnson_dft.spf
# To prevent uniquification of your design, enter the command:
set_dft_insertion_configuration -preserve_design_name true


# ------------------- Replaced Flip-Flops ------------------- #
#Used it in case you used HDL Verilog design not netist 
compile -scan -incremental 

# ---- Preview  
preview_dft

# ------ Scan_stitching 
insert_dft

# --- Report_scan_chains 
report_scan_path 
 
# -------Coverage_estimate
dft_drc -coverage_estimate 
# ------------------- Outputs ------------------- #

# --------SPF_File (STIL Protcol File) 
write_test_protocol -out ./output/ALU_dft.spf

# ------- Coverage Estimation 
dft_drc -coverage_estimate > ./output/ALU_rpt_dft_drc_coverage
# -------- Reports 
report_area > ./output/ALU_rpt_dft_area.report
report_timing > ./output/ALU_rpt_dft_timing.report
report_qor > ./output/ALU_rpt_dft_qor.report

# --------- Netlist output (.v and .ddc )
write -format ddc -h  -o ./output/ALU_dft_compiled.ddc
write -format verilog -h  -o ./output/ALU_dft_compiled.v

write_sdf  ./output/ALU_dft.sdf

exit

