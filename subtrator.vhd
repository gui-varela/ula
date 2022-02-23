library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity subtrator is
	port (
				minuendo  : in  STD_LOGIC_VECTOR( 3 downto 0);
				subtraendo: in  STD_LOGIC_VECTOR( 3 downto 0);
				saida     : out STD_LOGIC_VECTOR (3 downto 0);
				flags		 : out STD_LOGIC_VECTOR (3 downto 0));				
end subtrator;


architecture Behavioral of subtrator is


--- COMPONENTS

-- Complemento de 2
component complemento2 
    port ( num1 : in  STD_LOGIC_VECTOR(3 downto 0);
           saida: out STD_LOGIC_VECTOR(3 downto 0)
			  );
end component complemento2;

-- Full adder
component fullAdder4bits

    port ( num1 : in  STD_LOGIC_VECTOR (3 downto 0);
           num2 : in  STD_LOGIC_VECTOR (3 downto 0);
           Cin  : in  STD_LOGIC;
           Sum  : out  STD_LOGIC_VECTOR (3 downto 0);
			  flags: out STD_LOGIC_VECTOR
			);	  
end component fullAdder4bits;

	signal novosubtraendo: STD_LOGIC_VECTOR (3 downto 0);
	signal x 			   : STD_LOGIC_VECTOR (3 downto 0);

begin
	saida <= x;

	passo1: complemento2   port map (subtraendo, novosubtraendo);
	passo2: fullAdder4bits port map (minuendo, novosubtraendo,'0', x, flags);

	
end Behavioral;