library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Compx4 is port (
   --Inputs and outputs
   a   	:  in  std_logic_vector(3 downto 0);
   b		:  in std_logic_vector(3 downto 0);
	output : out std_logic_vector(2 downto 0)
); 
end Compx4;

architecture Compx4Architecture of Compx4 is 
	--Components
	  component Compx1 port (
		a : in std_logic;
		b: in std_logic;
		output: out std_logic_vector(2 downto 0)
		); 
		end component;
	
	--Signals of outputs from comparison of bits
		signal oneBit : std_logic_vector(2 downto 0);
		signal twoBit : std_logic_vector(2 downto 0);
		signal threeBit : std_logic_vector(2 downto 0);
		signal fourBit : std_logic_vector(2 downto 0);
	
	--Comparison signals for output
		signal greater : std_logic;
		signal equal : std_logic;
	
begin
	--Instances for comparing bits
	INST0: Compx1 port map (a(0), b(0), oneBit);
	INST1: Compx1 port map (a(1), b(1), twoBit);
	INST2: Compx1 port map (a(2), b(2), threeBit);
	INST3: Compx1 port map (a(3), b(3), fourBit);
	
	--Comparison logic
	greater <= (fourBit(0)) or (fourBit(1) and threeBit(0)) or (threeBit(1) and twoBit(0)) or (twoBit(1) and oneBit(0));
	equal <= oneBit(1) and twoBit(1) and threeBit(1) and fourBit(1);
	
	--Setting output vector
	output(0) <= greater;
	output(1) <= equal;
	output(2) <= not(greater) and not(equal);
		

				
 
end architecture Compx4Architecture;