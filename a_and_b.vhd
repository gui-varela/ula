library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity a_and_b is
    port ( A 	 : in  STD_LOGIC_VECTOR (3 downto 0);
           B 	 : in  STD_LOGIC_VECTOR (3 downto 0);
           S    : out STD_LOGIC_VECTOR (3 downto 0);
			  flags: out STD_LOGIC_VECTOR (3 downto 0));
end a_and_b;

architecture Behavioral of a_and_b is

	signal saida:std_logic_vector(3 downto 0);

begin
	saida(0) <= A(0) and B(0);
	saida(1) <= A(1) and B(1);
	saida(2) <= A(2) and B(2);
	saida(3) <= A(3) and B(3);

	s <= saida;

	-- As operações lógicas trazem apenas a flag "ZERO"
	flags(0)<= (not saida(0)) and (not saida(1)) and (not saida(2)) and (not saida(3));
	flags(1)<='0';
	flags(2)<='0';
	flags(3)<='0';

end Behavioral;