LIBRARY IEEE;LIBRARY WORK;LIBRARY std;USE IEEE.STD_LOGIC_1164.ALL;USE ieee.numeric_bit.ALL;USE IEEE.std_logic_arith.all;USE IEEE.numeric_std.all;USE IEEE.std_logic_signed.all;

ENTITY HA  IS
PORT ( A,B : IN std_logic;
        S  : OUT std_logic;
        Cout: OUT std_logic);
END ENTITY HA;

ARCHITECTURE HA_struct OF HA IS
BEGIN
S <= A XOR B;
Cout <= A AND B ;
END ARCHITECTURE HA_struct ;

library IEEE;
use IEEE.std_logic_1164.all;

USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_bit.ALL;
USE IEEE.std_logic_arith.all;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_signed.all;

ENTITY FA  IS
PORT ( A,B : IN std_logic;
       Cin: IN std_logic;
        S  : OUT std_logic;
        Cout: OUT std_logic);
END ENTITY FA;

ARCHITECTURE FA_struct OF FA IS
COMPONENT HA IS
PORT(A,B: IN std_logic; S, Cout: OUT std_logic);
END COMPONENT HA;
FOR ALL: HA USE ENTITY WORK.HA (HA_struct);
SIGNAL SUM1,Cout1,Cout2 :std_logic;
BEGIN
HA0:HA
PORT MAP(A => A,B => B,S => SUM1,Cout => cout1);

HA1:HA
PORT MAP(A => SUM1,B => Cin,S => S,Cout =>Cout2);

Cout <= Cout1 OR Cout2;
END ARCHITECTURE FA_struct;

library IEEE;
use IEEE.std_logic_1164.all;

USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_bit.ALL;
USE IEEE.std_logic_arith.all;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_signed.all;


ENTITY Adder_Sub IS
PORT( A,B:IN std_logic_vector(3 DOWNTO 0);
      M: IN std_logic;
      Sum :OUT std_logic_vector(3 DOWNTO 0);
      Cout :OUT std_logic);

END ENTITY Adder_Sub;

ARCHITECTURE Struct OF Adder_Sub IS
COMPONENT FA IS
PORT ( A,B : IN std_logic;
       Cin: IN std_logic;
        S  : OUT std_logic;
        Cout: OUT std_logic);

END COMPONENT FA;

--FOR ALL:FA ENTITY USE WORK.FA (FA_struct);

SIGNAL B_XORED : std_logic_vector(3 DOWNTO 0);
SIGNAL carry_int : std_logic_vector(2 DOWNTO 0);


BEGIN
B_XORED(0) <= B(0) XOR M;
B_XORED(1) <= B(1) XOR M;
B_XORED(2) <= B(2) XOR M;
B_XORED(3) <= B(3) XOR M;

ADD_SUB0:FA
PORT MAP (A => A(0),B => B_XORED(0),Cin => M,S => Sum(0),Cout => carry_int(0));

ADD_SUB1:FA
PORT MAP (A => A(1),B => B_XORED(1),Cin => carry_int(0),S => Sum(1),Cout => carry_int(1));

ADD_SUB2:FA
PORT MAP (A => A(2),B => B_XORED(2),Cin => carry_int(1),S => Sum(2),Cout => carry_int(2));

ADD_SUB3:FA
PORT MAP ( A =>A(3), B => B_XORED(3),Cin => carry_int(2), S => Sum(3),Cout => Cout );
 

END ARCHITECTURE Struct;
