library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity gNN_wrapper is 
	Port	(	A,	B		:	in	std_logic_vector (3 downto 0);
				decoded_A:  out std_logic_vector (6 downto 0);
				decoded_B:   out std_logic_vector (6 downto 0);
				decoded_AplusB : out std_logic_vector (13 downto 0));
end gNN_wrapper;

architecture struc of gNN_wrapper is

component GROUP_15_bcd_adder  
Port (A : in std_logic_vector (3 DOWNTo 0);
		B : in std_logic_vector (3 DOWNTo 0);
		S : out std_logic_vector (3 DOWNTo 0);
		C_out : out std_logic );
end component;

component seven_segment_decoder 
port ( 	code : in std_logic_vector (3 downto 0) ;
			segments_out : out std_logic_vector (6 downto 0) );
end component;


signal   t1 : STD_LOGIC;
signal	s1 : std_logic_vector (3 downto 0);
signal	s2 : std_logic_vector (3 downto 0);
signal	s3 : std_logic_vector (6 downto 0);
signal   s4 : std_logic_vector (6 downto 0);

begin



P1: 	seven_segment_decoder
		port map(A,decoded_A);

P2:	seven_segment_decoder
		port map(B,decoded_B);

P3:	GROUP_15_bcd_adder
		port map(A,B,s1,t1);
		
      s2 <= "000"&t1;

P4:	seven_segment_decoder
		port map(s1,s3);

P5:	seven_segment_decoder
		port map(s2,s4);
		
		
decoded_AplusB <= s4&s3;





end struc;

