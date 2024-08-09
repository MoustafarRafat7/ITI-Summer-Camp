LIBRARY IEEE;LIBRARY WORK;LIBRARY std;USE IEEE.STD_LOGIC_1164.ALL;USE ieee.numeric_bit.ALL;USE IEEE.std_logic_arith.all;USE IEEE.numeric_std.all;USE IEEE.std_logic_signed.all;
USE std.textio.ALL;

ENTITY behav_tb IS
END ENTITY behav_tb;

ARCHITECTURE testbench OF  behav_tb IS
COMPONENT Add_Sub_behav IS
PORT ( A,B : IN std_logic_vector( 3 DOWNTO 0);
       M: IN std_logic;
        S  : OUT std_logic_vector( 3 DOWNTO 0);
        Cout: OUT std_logic);
END COMPONENT  Add_Sub_behav ;
FOR ALL : Add_Sub_behav USE ENTITY WORK.Add_Sub_behav(behav);
SIGNAL A,B,S:std_logic_vector(3 DOWNTO 0);
SIGNAL Cout,M : std_logic;

BEGIN

add_sub0: Add_Sub_behav
PORT MAP(A => A,B => B,M => M,S => S,Cout => Cout);

pd: PROCESS IS
FILE input : text OPEN READ_MODE IS ("E:\ITI Internship\VHDL\Lab\input.txt");
FILE output: text OPEN WRITE_MODE IS ("E:\ITI Internship\VHDL\Lab\output.txt");
VARIABLE inputl, outputl: line;
VARIABLE delay : time ;
VARIABLE A_F,B_F,S_F :std_logic_vector(3 DOWNTO 0);
VARIABLE Cout_F,M_F:std_logic;


BEGIN

WHILE NOT endfile (input) LOOP
READLINE (input, inputl);
READ (inputl,A_F);
READ (inputl,B_F);
READ (inputl,M_F);

A<=A_F;
B<=B_F;
M<=M_F;
S_F:=S;
Cout_F:=Cout;
WRITE (outputl, string' ("Time is now ") );
WRITE (outputl, NOW); -- Current simulation time
WRITE (outputl, string' (" SUM = ") );
WRITE (outputl,S_F);
WRITE (outputl, string' (" Cout = ") );
WRITE (outputl,Cout);

WRITELINE(output,outputl);
wait for 10 ns;
END LOOP;
WAIT; -- stop simulation run
END PROCESS pd;
END ARCHITECTURE testbench;

