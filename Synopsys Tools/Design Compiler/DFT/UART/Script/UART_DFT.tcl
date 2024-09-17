# ---------------------------  Setup --------------------------- #

set search_path "/mnt/ext/synopsys/pdks/32nm/install/edu/SAED32_EDK/lib/stdcell_rvt/SAED32_EDK/lib/stdcell_rvt/db_nldm"



# ----------- Link and Target library 
set_app_var link_library "* saed32rvt_tt1p05v125c.db"
set_app_var target_library "saed32rvt_tt1p05v125c.db"


read_ddc /home/user26/Moustafa_Mohammed/DC/UART/Script/output/UART_TX_TOP.ddc
read_sdc /home/user26/Moustafa_Mohammed/DC/UART/Script/output/UART_TX_TOP.sdc

# --------------------------- Test_prtocol --------------------------- #

# depend on number of scan chains 
# ----- Create_Ports_for_Testability
for {set i 0} {$i < 8 } { incr i } {
 create_port -direction in Scan_In[$i]
 set_dft_signal -type ScanDataIn -view spec -port Scan_In[$i] 
}

for {set j 0} { $j < 8 } { incr j} {
create_port -direction out Scan_Out[$j]
set_dft_signal -type ScanDataOut -view spec -port Scan_Out[$j]
}

create_port -direction in { Scan_En  } 

# ----- Test_prtocol 
#For signal already connected in design (view exist)
set_dft_signal -view exist -type ScanMasterClock -timing {45 55} -port CLK

set_dft_signal -type reset -view exist -active 0 -port RST

set_dft_signal -view spec -type ScanEnable -active 1 -port Scan_En

#Determined number of scan chin 
set_scan_configuration -chain_count 8


# ------- Report All Signals 
report_dft_signal -view exist
report_dft_signal -view spec

# -------Create_Test_protocol 
create_test_protocol
# ------------------- Drc_checking ------------------- #
dft_drc


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
report_scan_path > ../DFT/UART_Scanchain.report

 
# -------Coverage_estimate
dft_drc -coverage_estimate 

# ------------------- Outputs ------------------- #

# --------SPF_File (STIL Protcol File) 
write_test_protocol -out ./output/UART_dft.spf

# ------- Coverage Estimation 
dft_drc -coverage_estimate > ./output/UART_rpt_dft_drc_coverage
# -------- Reports 
report_area > ./output/UART_rpt_dft_area.report
report_timing > ./output/UART_rpt_dft_timing.report
report_qor > ./output/UART_rpt_dft_qor.report

# --------- Netlist output (.v and .ddc )
write -format ddc -h  -o ./output/UART_dft_compiled.ddc
write -format verilog -h  -o ./output/UART_dft_compiled.v

write_sdf  ./output/UART_dft.sdf