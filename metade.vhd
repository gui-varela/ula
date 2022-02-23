library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity metade is
	port (
				valor: in  STD_LOGIC_VECTOR(3 downto 0);
				saida: out STD_LOGIC_VECTOR(3 downto 0));
				
end metade;


architecture Behavioral of metade is

	--signal msb : STD_LOGIC := '0';
	signal s   : STD_LOGIC_VECTOR(3 downto 0);

begin
	
	--msb 	<= valor(0); 
	s     <= ('0', valor(3), valor(2), valor(1));
	saida <= s;
	
end Behavioral;
