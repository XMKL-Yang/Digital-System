library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BBBg15_FSM is
	Port	(	seq		:	in		std_logic;
				enable	:	in		std_logic;
				reset		:	in		std_logic;
				clk		:	in		std_logic;
				out_2		:	out	std_logic);
end BBBg15_FSM;

architecture behavior of BBBg15_FSM is
	type State_type is (A2,B2,C2,D2);
	signal st2: State_type :=A2;
	
	BEGIN
	process (seq,enable,reset,clk)
	BEGIN
		if (reset = '1') then 
			out_2 <= '0';
			st2<= A2;
		elsif ( rising_edge(clk)) then
			case st2 is
				when A2 =>
					out_2 <= '0';
					if(enable = '1') then
						if (seq = '0') then
							st2 <= B2;
						else
							st2 <= A2;
						end if;
					end if;
				when B2 =>
					out_2 <= '0';
					if(enable = '1') then
						if (seq = '0') then
							st2 <= C2;
						else
							st2 <= A2;
						end if;
					end if;
				when C2 =>
					out_2 <= '0';
					if(enable = '1') then
						if (seq = '0') then
							st2 <= C2;
						else
							st2 <= D2;
						end if;
					end if;
				when D2 =>
					out_2 <= '0';
					if(enable = '1') then
						if (seq = '0') then
							st2 <= B2;
							out_2 <= '1';
						else
							st2 <= A2;
						end if;
					end if;
				when others =>
					NULL;
			end case;
		end if;
	end process;
end behavior;