start_gui

set_svf -append { /home/user26/Moustafa_Mohammed/DC/UART/Script/default.svf }

read_verilog -container r -libname WORK -05 { /home/user26/Moustafa_Mohammed/DC/UART/RTL/Parity_Calc.v /home/user26/Moustafa_Mohammed/DC/UART/RTL/Serializer.v /home/user26/Moustafa_Mohammed/DC/UART/RTL/UART_FSM.v /home/user26/Moustafa_Mohammed/DC/UART/RTL/UART_MUX.v /home/user26/Moustafa_Mohammed/DC/UART/RTL/UART_TX_TOP.v }

set_top r:/WORK/UART_TX_TOP

read_verilog -container i -libname WORK -05 { /home/user26/Moustafa_Mohammed/DC/UART/Script/output/UART_TX_TOP.v }


read_db { /mnt/ext/synopsys/pdks/32nm/install/edu/SAED32_EDK/lib/stdcell_rvt/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_tt1p05v125c.db }

set_top i:/WORK/UART_TX_TOP

match
verify