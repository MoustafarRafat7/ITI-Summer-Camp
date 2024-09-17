start_gui

set_svf -append { /home/user26/Moustafa_Mohammed/DC/Script/default.svf }

read_verilog -container r -libname WORK -05 { /home/user26/Moustafa_Mohammed/DC/RTL/ALU.v}

set_top r:/WORK/ALU

read_verilog -container i -libname WORK -05 { /home/user26/Moustafa_Mohammed/DC/Script/output/ALU.v }

read_db { /mnt/ext/synopsys/pdks/32nm/install/edu/SAED32_EDK/lib/stdcell_rvt/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_tt1p05v125c.db }


set_top i:/WORK/ALU

match
verify