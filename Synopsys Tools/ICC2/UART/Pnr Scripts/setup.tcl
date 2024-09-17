# Run this when you are on PNR/Scripts


# put the search path directory of the technology 

set_app_var search_path /home/user26/Student_PDK/LIB

set TECH_FILE astroTechFile.tf

# put the directory of your ndm created from the library manager

set reference_library /home/user26/Moustafa_Mohammed/Labs/Labs/Johnson/pnr/NDM/saed90nm_max_lth.ndm

#create design library from technology file & ndm

create_lib -technology $TECH_FILE -ref_libs $reference_library UART.dlib

#read gate level netlist output from synthesis
read_verilog -top UART /home/user26/Moustafa_Mohammed/Labs/Labs/UART/output/UART_TX_TOP.v



link_block

read_parasitic_tech -layermap tech2itf.map -tlup saed90nm_1p9m_1t_Cmax.tluplus  -name maxTLU

read_parasitic_tech -layermap tech2itf.map -tlup saed90nm_1p9m_1t_Cmin.tluplus  -name minTLU

#put the sdc file output from synthesis
read_sdc /home/user26/Moustafa_Mohammed/Labs/Labs/UART/output/UART_TX_TOP.sdc
get_site_defs

set_attribute [get_site_defs unit] symmetry y

set_attribute [get_layers {M1 M3 M5 M7 M9} ] routing_direction horizontal

set_attribute [get_layers {M2 M4 M6 M8 } ] routing_direction vertical

get_attribute [get_layers M7] routing_direction

report_ignored_layers

set_ignored_layers -max_routing_layer M8

report_ignored_layers

save_block 

start_gui 
 





