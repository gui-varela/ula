library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dobro is
	port ( valor: in  STD_LOGIC_VECTOR( 3 downto 0);
			 saida: out STD_LOGIC_VECTOR(3 downto 0);
			 flags: out STD_LOGIC_VECTOR(3 downto 0));
end dobro;


architecture Behavioral of dobro is

	-- COMPONENTE
	component fullAdder4bits

		 port ( num1 : in  STD_LOGIC_VECTOR(3 downto 0);
				  num2 : in  STD_LOGIC_VECTOR(3 downto 0);
				  Cin  : in  STD_LOGIC;
				  Sum  : out STD_LOGIC_VECTOR(3 downto 0);
				  flags: out STD_LOGIC_VECTOR);
				  
	end component fullAdder4bits;

	signal x : STD_LOGIC_VECTOR (3 downto 0);

begin

	saida <= x;
	
	passo1:	fullAdder4bits port map (valor, valor,'0', x, flags);
	
end Behavioral;