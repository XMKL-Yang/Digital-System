library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity yujing_yang_full_adder is
	Port	(	a			:	in		std_logic;
				b			:	in		std_logic;
				c_in		:	in		std_logic;
				s			:	out	std_logic;
				c_out		:	out	std_logic);
end yujing_yang_full_adder;

architecture full_adder_struc of yujing_yang_full_adder is

component yujing_yang_half_adder is
	Port	(	a			:	in		std_logic;
				b			:	in		std_logic;
				s			:	out	std_logic;
				c			:	out	std_logic);
end component;

signal m1, m2, m3: std_logic;

begin
I1: yujing_yang_half_adder PORT MAP (a, b, m1, m2);
I2: yujing_yang_half_adder PORT MAP (m1, c_in, s, m3);

c_out <= m2 or m3;

end full_adder_struc;
	
	