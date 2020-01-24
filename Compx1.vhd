library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Compx1 is port (
   --Inputs and outputs
   a   	:  in  std_logic;
   b		:  in std_logic;
	output : out std_logic_vector(2 downto 0)
); 
end Compx1;

architecture Compx1Architecture of Compx1 is
	--Comparison signals
	signal equal: std_logic;
	signal greater : std_logic;
	signal less : std_logic;
	
begin
		--1 bit comparison logic
		equal <= not (a xor b);
		greater <= not(a) and b;
		less <= a and not (b);
		
		--Setting vector values
		output(0) <= greater;
		output(1) <= equal;
		output(2) <= less;
		
 
end architecture Compx1Architecture;