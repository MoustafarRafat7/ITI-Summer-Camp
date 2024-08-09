LIBRARY IEEE;LIBRARY WORK;LIBRARY std;USE IEEE.STD_LOGIC_1164.ALL;USE ieee.numeric_bit.ALL;USE IEEE.std_logic_arith.all;USE IEEE.numeric_std.all;USE IEEE.std_logic_signed.all;
USE std.textio.ALL;

ENTITY Adder_Subtractor_tb IS
END ENTITY Adder_Subtractor_tb;

ARCHITECTURE testbench OF  Adder_Subtractor_tb IS
COMPONENT Adder_Sub IS
PORT (A,B:IN std_logic_vector(3 DOWNTO 0);
      M: IN std_logic;
      Sum :OUT std_logic_vector(3 DOWNTO 0);
      Cout :OUT std_logic);
END COMPONENT Adder_Sub ;
FOR ALL : Adder_Sub USE ENTITY WORK.Adder_Sub(Struct);
SIGNAL A,B,Sum:std_logic_vector(3 DOWNTO 0);
SIGNAL Cout,M : std_logic;

BEGIN

add_sub0:Adder_Sub 
PORT MAP(A => A,B => B,M => M,Sum => Sum,Cout => Cout);

pd: PROCESS IS
FILE input : text OPEN READ_MODE IS ("E:\ITI Internship\VHDL\Lab\input.txt");
FILE output: text OPEN WRITE_MODE IS ("E:\ITI Internship\VHDL\Lab\output.txt");
VARIABLE inputl, outputl: line;
VARIABLE delay : time ;
VARIABLE A_F,B_F,Sum_F :std_logic_vector(3 DOWNTO 0);
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
SUM_F:=SUM;
Cout_F:=Cout;
WRITE (outputl, string' ("Time is now ") );
WRITE (outputl, NOW); -- Current simulation time
WRITE (outputl, string' (" SUM = ") );
WRITE (outputl,SUM_F);
WRITE (outputl, string' (" Cout = ") );
WRITE (outputl,Cout);

WRITELINE(output,outputl);
wait for 10 ns;
END LOOP;
WAIT; -- stop simulation run
END PROCESS pd;
END ARCHITECTURE testbench;

