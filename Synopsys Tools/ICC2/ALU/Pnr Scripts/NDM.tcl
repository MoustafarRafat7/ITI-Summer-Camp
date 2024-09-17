					# ndm script using icc2_lm_shell

# 1- create_workspace

create_workspace -flow exploration -technology /home/user26/Student_PDK/LIB/astroTechFile.tf ndmtest

# 2- set_app_options

set_app_options -list {lib.workspace.keep_all_physical_cells {true}}
set_app_options -list {design.enable_lib_cell_editing {mutable}}
set_app_options -list {lib.workspace.save_design_views {true}}
set_app_options -list {lib.workspace.save_layout_views {true}}


# 3- read_db 

#read_db /mnt/ext/synopsys/pdks/32nm/install/edu/SAED32_EDK/lib/stdcell_rvt/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_tt1p05v125c.db
read_db { /home/user26/Student_PDK/LIB/saed90nm_max_lth.db }

# 4- read_lef

read_lef /home/user26/Student_PDK/LIB/Saeed_90_lef.lef


# 5- see layout view

#change_selection [get_designs -filter {view_name == design} {AND4X1}]
#current_block saed90nmEditted:AND4X1.design


# 6- create group


#saed90nm_max_lth.ndm

#reflib.ndm  >>>> re

group_libs



# 7- finaL Step will create the ndm

process_workspaces  -directory /home/user26/Moustafa_Mohammed/Labs/Labs/ALU/pnr/NDM



#########################################################################################################






