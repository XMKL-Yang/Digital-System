library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity g_NN_storage_element is
	Port ( A			:	in	std_logic;
			 reset	: 	in	std_logic;
			 set		:	in	std_logic;
			 B			:	out	std_logic);
	end g_NN_storage_element;
	
ARCHITECTURE Behavior OF g_NN_storage_element IS
	SIGNAL C: std_logic;
BEGIN
	PROCESS (A,reset,set) 
		BEGIN		
		IF set = '0' THEN
			C <= '1';
		
		ELSIF reset = '0' THEN
			C <= '0';

		ELSIF RISING_EDGE (A) THEN
			IF C = '0' THEN
				B <= '1';
			ELSIF C = '1' THEN
				B <= '0';
			END IF;
		END IF;		
	END PROCESS;
END Behavior;