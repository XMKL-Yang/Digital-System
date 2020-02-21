library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity GROUP_15_bcd_adder  is
Port (A : in std_logic_vector (3 DOWNTo 0);
		B : in std_logic_vector (3 DOWNTo 0);
		S : out std_logic_vector (3 DOWNTo 0);
		C_out : out std_logic );
end GROUP_15_bcd_adder ;

ARCHITECTURE behavior OF GROUP_15_bcd_adder is

	SIGNAL Z:STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL Z2:STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL Adjust : STD_LOGIC;
BEGIN
		  Z <= ('0'&A)+B;
		  Adjust <= '1'when Z>9 else'0';
		  Z2 <= Z+6;
		  S <=  Z(3 DOWNTO 0) when(Adjust='0') 
		  ELSE Z2(3 DOWNTO 0);
		  C_out <= '1' WHEN (Adjust='1') ELSE '0';
End behavior;
	
