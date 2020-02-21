library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity yujing_yang_ripple_carry_adder_structural is
	Port	(	A			:	in		std_logic_vector (3 downto 0);
				b			:	in		std_logic_vector (3 downto 0);
				s			:	out		std_logic_vector (4 downto 0));
end yujing_yang_ripple_carry_adder_structural;

architecture structural of yujing_yang_ripple_carry_adder_structural is



signal c0,c1,c2,c3: STD_LOGIC;

begin 
S(0) <= A(0) xor B(0);
c0 <= A(0) and B(0);
S(1) <= A(1) xor B(1) xor c0;
c1 <= (A(1) and B(1)) or (A(1) and c0) or(c0 and B(1));
S(2) <= A(2) xor B(2) xor c1;
c2 <= (A(2) and B(2)) or (A(2) and c1) or(c1 and B(2));
S(3) <= A(3) xor B(3) xor c2;
c3 <= (A(3) and B(3)) or (A(3) and c2) or(c2 and B(3));
S(4) <= c3; 

end structural;


