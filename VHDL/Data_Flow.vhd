LIBRARY IEEE;LIBRARY WORK;LIBRARY std;USE IEEE.STD_LOGIC_1164.ALL;USE ieee.numeric_bit.ALL;USE IEEE.std_logic_arith.all;USE IEEE.numeric_std.all;USE IEEE.std_logic_signed.all;

ENTITY Add_Sub_behav IS
PORT ( A,B : IN std_logic_vector( 3 DOWNTO 0);
       M: IN std_logic;
        S  : OUT std_logic_vector( 3 DOWNTO 0);
        Cout: OUT std_logic);
END ENTITY Add_Sub_behav;


ARCHITECTURE Data_Flow OF Add_Sub_behav IS
SIGNAL RESULT :std_logic_vector( 4 DOWNTO 0);
BEGIN
RESULT <= (("0" & A ) + ( "0" & B )) WHEN M = '0' ELSE  (("0" & A ) - ( "0" & B ));

Cout <= RESULT(4);

S <= RESULT(3 DOWNTO 0);
END ARCHITECTURE Data_Flow;

