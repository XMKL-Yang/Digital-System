-- Copyright (C) 2016  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "10/15/2019 17:07:04"
                                                            
-- Vhdl Test Bench template for design  :  yujing_yang_half_adder
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY yujing_yang_half_adder_vhd_tst IS
END yujing_yang_half_adder_vhd_tst;
ARCHITECTURE yujing_yang_half_adder_arch OF yujing_yang_half_adder_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL a : STD_LOGIC;
SIGNAL b : STD_LOGIC;
SIGNAL c : STD_LOGIC;
SIGNAL s : STD_LOGIC;
COMPONENT yujing_yang_half_adder
	PORT (
	a : IN STD_LOGIC;
	b : IN STD_LOGIC;
	c : BUFFER STD_LOGIC;
	s : BUFFER STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : yujing_yang_half_adder
	PORT MAP (
-- list connections between master ports and signals
	a => a,
	b => b,
	c => c,
	s => s
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
   a <= '0';
	b <= '0';
	wait for 5 ns;
	a <= '1';
	b <= '0';
	wait for 5 ns;
	a <= '0';
	b <= '1';
	wait for 5 ns;
	a <= '1';
	b <= '1';
	wait for 5 ns; 

WAIT;                                                        
END PROCESS always;                                          
END yujing_yang_half_adder_arch;
