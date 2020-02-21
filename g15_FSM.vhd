library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity g15_FSM is
	Port	(	seq		:	in		std_logic;
				enable	:	in		std_logic;
				reset		:	in		std_logic;
				clk		:	in		std_logic;
				out_1		:	out	std_logic;
				out_2		:	out	std_logic);
end g15_FSM;

architecture behavior of g15_FSM is
	type State_type is (A1,B1,C1,D1,A2,B2,C2,D2);
	signal st1: State_type :=A1;
	signal st2: State_type :=A2;

BEGIN
	process (clk)
	BEGIN
		if (reset = '1') then 
			out_1 <= '0';
			out_2 <= '0';
			st1<= A1;
			st2<= A2;
		elsif ( rising_edge(clk)) then
			case st1 is
				when A1 =>
					out_1 <= '0';
					if(enable = '1') then
						if (seq = '0') then
							st1 <= A1;
						else
							st1 <= B1;
						end if;
					end if;
				when B1 =>
					out_1 <= '0';
					if(enable = '1') then
						if (seq = '0') then
							st1 <= C1;
						else
							st1 <= B1;
						end if;
					end if;
				when C1 =>
					out_1 <= '0';
					if(enable = '1') then
						if (seq = '0') then
							st1 <= A1;
						else
							st1 <= D1;
						end if;
					end if;
				when D1 =>
					out_1 <= '0';
					if(enable = '1') then
						if (seq = '0') then
							st1 <= C1;
						else
							st1 <= B1;
							out_1 <= '1';
						end if;
					end if;
				when others =>
					NULL;
			end case;
			
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

				