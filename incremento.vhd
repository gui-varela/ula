library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity incremento is
	port ( valor: in STD_LOGIC_VECTOR( 3 downto 0);
			 saida: out STD_LOGIC_VECTOR (3 downto 0);
			 flags: out STD_LOGIC_VECTOR (3 downto 0));				
end incremento;


architecture Behavioral of incremento is

	signal x : STD_LOGIC_VECTOR( 3 downto 0); 

	-- COMPONENTE
	component fullAdder4bits

		port ( num1 : in  STD_LOGIC_VECTOR(3 downto 0);
				 num2 : in  STD_LOGIC_VECTOR(3 downto 0);
				 Cin  : in  STD_LOGIC;
				 Sum  : out STD_LOGIC_VECTOR(3 downto 0);
				 flags: out STD_LOGIC_VECTOR);
			  
end component fullAdder4bits;


begin

	saida <= x;

	passo1:	fullAdder4bits port map (valor, "0001",'0', x, flags);

	
end Behavioral;