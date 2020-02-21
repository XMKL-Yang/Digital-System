library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity g15_clock_divider is
	 Generic (constant T : integer := 500000);

    Port (enable     : in  std_logic;
	  reset      : in  std_logic;
	  clk        : in  std_logic;
	  en_out     : out std_logic);

end g15_clock_divider;

architecture g15_clock_divider_behavior of g15_clock_divider is


    signal temporary : std_logic := '0';
	 signal current   : integer;
BEGIN

    Process(clk, reset) begin
	
    If (reset = '0') then
        current <= T - 1;
		  temporary <= '0';
		
    elsif (rising_edge(clk)) then
		  if (enable = '1') then
		      current <= current - 1;
		  else
		      current <= current;
		  end if;
    
	 
	 
		  if (current > 0) then
				temporary <= '0';
		  else
				temporary <= '1';
				current <= T-1;
	  	  end if;
		  
	 end if;
	 end Process;
	 
	 en_out <= temporary;

end g15_clock_divider_behavior;