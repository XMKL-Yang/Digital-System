library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
entity g_NN_comparator is
	Port ( 	A, B 				: in std_logic_vector (3 downto 0);
				AgtBplusOne 	: out std_logic;
				AgteBplusOne 	: out std_logic;
				AltBplusOne 	: out std_logic;
				AlteBplusOne 	: out std_logic;
				AeqBplusOne 	: out std_logic;
				overflow 		: out std_logic);

end g_NN_comparator ;

architecture Comparator of g_NN_comparator is
SIGNAL BplusOne:STD_LOGIC_VECTOR(4 DOWNTO 0);
Begin
	
	BplusOne <= ('0'&B)+1;
	
	process(A,B)
	begin
			overflow <= BplusOne(4);
		if BplusOne(4) = '1' then
				AgtBplusOne <=  '0';
				AgteBplusOne <= '0';
				AltBplusOne <=  '0';
				AlteBplusOne <= '0';
				AeqBplusOne <=  '0';
		elsif A > BplusOne then
				AgtBplusOne <=  '1';
				AgteBplusOne <= '1';
				AltBplusOne <=  '0';
				AlteBplusOne <= '0';
				AeqBplusOne <=  '0';
		elsif A = BplusOne then
				AgtBplusOne <=  '0';
				AgteBplusOne <= '1';
				AltBplusOne <=  '0';
				AlteBplusOne <= '1';
				AeqBplusOne <=  '1';		
		elsif A < BplusOne then
				AgtBplusOne <=  '0';
				AgteBplusOne <= '0';
				AltBplusOne <=  '1';
				AlteBplusOne <= '1';
				AeqBplusOne <=  '0';		
		END IF;
	end process;
end Comparator;
