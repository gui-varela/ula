library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity a_xor_b is
    port ( A 	 : in  STD_LOGIC_VECTOR(3 downto 0);
           B 	 : in  STD_LOGIC_VECTOR(3 downto 0);
           S 	 : out STD_LOGIC_VECTOR(3 downto 0);
			  flags: out STD_LOGIC_VECTOR(3 downto 0));
end a_xor_b;

architecture Behavioral of a_xor_b is

	signal saida:std_logic_vector(3 downto 0);

begin

	S(0) <= saida(0);
	S(1) <= saida(1);
	S(2) <= saida(2);
	S(3) <= saida(3);

	saida(0) <= A(0) xor B(0);
	saida(1) <= A(1) xor B(1);
	saida(2) <= A(2) xor B(2);
	saida(3) <= A(3) xor B(3);

	-- As operações lógicas trazem apenas a flag "ZERO"
	flags(0)<= (not saida(0)) and (not saida(1)) and (not saida(2)) and (not saida(3));
	flags(1)<='0';
	flags(2)<='0';
	flags(3)<='0';

end Behavioral;