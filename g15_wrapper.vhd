library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity g15_wrapper is
	Port	(	reset		:	in		std_logic;
				clk		:	in		std_logic;
				HEX0		:	out	std_logic_vector (6 downto 0);
				HEX5		:	out	std_logic_vector (6 downto 0));
end g15_wrapper;

architecture arch of g15_wrapper is

component ROM
port(
    clk : in std_logic;
    enable : in std_logic;
    reset : in std_logic;
    data : out std_logic
);
end component;

component g15_clock_divider

    Port (enable     : in  std_logic;
	  reset      : in  std_logic;
	  clk        : in  std_logic;
	  en_out     : out std_logic);
end component;


component g15_sequence_detector 
	Port	(	seq		:	in		std_logic;
				enable	:	in		std_logic;
				reset		:	in		std_logic;
				clk		:	in		std_logic;
				cnt_1		:	out	std_logic_vector (2 downto 0);
				cnt_2		:	out	std_logic_vector (2 downto 0));
end component;

component seven_segment_decoder
port ( 	code : in std_logic_vector (3 downto 0) ;
			segments_out : out std_logic_vector (6 downto 0) );
end component;

signal enable_out, data_out: std_logic;
signal cnt_10, cnt_20 : std_logic_vector (2 downto 0);
signal trans1:std_logic_vector(3 downto 0);
signal trans2:std_logic_vector(3 downto 0);


Begin

P1: g15_clock_divider port map 
( '1', reset, clk, enable_out );

P2: ROM port map
( clk,  enable_out , reset, data_out );

P3: g15_sequence_detector port map
( data_out, enable_out, reset, clk, cnt_10, cnt_20 );

	trans1 <= ('0' & cnt_10);
	trans2 <= ('0' & cnt_20);
										
P4:seven_segment_decoder
	port map(trans1, HEX0);

P5:seven_segment_decoder
	port map(trans2, HEX5);

end arch;