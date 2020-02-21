library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity yujing_yang_half_adder is
	Port	(	a			:	in		std_logic;
				b			:	in		std_logic;
				s			:	out	std_logic;
				c			:	out	std_logic);
end yujing_yang_half_adder;

Architecture struc of yujing_yang_half_adder is

begin

s <= a xor b;
c <= a and b;


end struc;