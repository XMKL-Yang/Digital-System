library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity g15_sequence_detector is
	Port	(	seq		:	in		std_logic;
				enable	:	in		std_logic;
				reset		:	in		std_logic;
				clk		:	in		std_logic;
				cnt_1		:	out	std_logic_vector (2 downto 0);
				cnt_2		:	out	std_logic_vector (2 downto 0));
end g15_sequence_detector;

architecture struc of g15_sequence_detector is

component g15_FSM is
Port	(		Aseq		:	in		std_logic;
				Aenable	:	in		std_logic;
				Areset		:	in		std_logic;
				Aclk		:	in		std_logic;
				Aout_1		:	out	std_logic;
				Aout_2		:	out	std_logic);
end component;

component AAAg15_FSM is
Port	(		seq		:	in		std_logic;
				enable	:	in		std_logic;
				reset		:	in		std_logic;
				clk		:	in		std_logic;
				out_1		:	out	std_logic);
end component;

component BBBg15_FSM is
Port	(		seq		:	in		std_logic;
				enable	:	in		std_logic;
				reset		:	in		std_logic;
				clk		:	in		std_logic;
				out_2		:	out	std_logic);
end component;

signal cnt_1signal : std_logic_vector(2 downto 0);
signal cnt_2signal : std_logic_vector(2 downto 0);
signal	t1 : std_logic;
signal	t2 : std_logic;

Begin
	--P1: g15_FSM port map (seq,enable,reset,clk,t1,t2);
	P2 : AAAg15_FSM port map(seq,enable,reset,clk,t1);
	P3 : BBBg15_FSM port map(seq,enable,reset,clk,t2);
		
	
compute : process (seq, enable, reset, clk)
	Begin
		if(enable = '0') then
			cnt_1signal <= cnt_1signal;
			cnt_2signal <= cnt_2signal;
		elsif (reset = '1') then
			cnt_1signal <= "000";
			cnt_2signal <= "000";
		else
			if (clk'event and clk = '1' ) then
				cnt_1signal <= cnt_1signal+t1;
			end if;
			if (clk'event and clk = '1' ) then
				cnt_2signal <= cnt_2signal+t2;
			end if;
		end if;
	end process compute;
	
	cnt_1 <= cnt_1signal;
	cnt_2 <= cnt_2signal;
	
end struc;