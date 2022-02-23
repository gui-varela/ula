library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- ENTIDADE PRINCIPAL

entity ula is
    Port ( entrada1   : in  STD_LOGIC_VECTOR(3 downto 0);
           entrada2   : in  STD_LOGIC_VECTOR(3 downto 0);
			  selecao    : in  STD_LOGIC_VECTOR(3 downto 0);
			  saidaFinal : out STD_LOGIC_VECTOR(3 downto 0);
			  flags      : out STD_LOGIC_VECTOR(3 downto 0));          
end ula;

-- ARCHITECTURE

architecture Behavioral of ula is	

---- COMPONENTES

---- INCREMENTO
component incremento is
	PORT (
				valor: in  STD_LOGIC_VECTOR(3 downto 0);
				saida: out STD_LOGIC_VECTOR(3 downto 0);
				flags: out STD_LOGIC_VECTOR(3 downto 0));
				
end component incremento;

---- COMPLEMENTO2
component complemento2 
    Port ( num1  : in   STD_LOGIC_VECTOR(3 downto 0);
           saida : out  STD_LOGIC_VECTOR(3 downto 0)
			  );
end component complemento2;

---- FULLADDER4BITS
component fullAdder4bits

    Port ( num1 : in  STD_LOGIC_VECTOR(3 downto 0);
           num2 : in  STD_LOGIC_VECTOR(3 downto 0);
           Cin  : in  STD_LOGIC;
           Sum  : out STD_LOGIC_VECTOR(3 downto 0);
			  flags: out STD_LOGIC_VECTOR(3 downto 0));
			  
end component fullAdder4bits;


---- SUBTRATOR
component subtrator
	PORT (
				minuendo   : in  STD_LOGIC_VECTOR( 3 downto 0);
				subtraendo : in  STD_LOGIC_VECTOR( 3 downto 0);
				saida      : out STD_LOGIC_VECTOR(3 downto 0);
				flags      : out STD_LOGIC_VECTOR(3 downto 0));
				
end component subtrator;

---- AND 
component a_and_b
    Port ( A     : in  STD_LOGIC_VECTOR(3 downto 0);
           B     : in  STD_LOGIC_VECTOR(3 downto 0);
           S     : out STD_LOGIC_VECTOR(3 downto 0);
			  flags : out STD_LOGIC_VECTOR(3 downto 0));
end component a_and_b;

---- XOR
component a_xor_b
    Port ( A     : in  STD_LOGIC_VECTOR(3 downto 0);
           B     : in  STD_LOGIC_VECTOR(3 downto 0);
           S     : out STD_LOGIC_VECTOR(3 downto 0);
			  flags : out STD_LOGIC_VECTOR(3 downto 0));
end component a_xor_b;

---- DOBRO
component dobro is
	PORT (
				valor: in  STD_LOGIC_VECTOR(3 downto 0);
				saida: out STD_LOGIC_VECTOR(3 downto 0);
				flags: out STD_LOGIC_VECTOR(3 downto 0));
				
end component dobro;

---- METADE
component metade is
	PORT (
				valor: in  STD_LOGIC_VECTOR(3 downto 0);
				saida: out STD_LOGIC_VECTOR(3 downto 0));
				
end component metade;

-----------SINAIS

	-- SAÍDAS
	signal saida_INCREMENTO  : STD_LOGIC_VECTOR(3 downto 0);
	signal saida_AND         : STD_LOGIC_VECTOR(3 downto 0);
	signal saida_XOR         : STD_LOGIC_VECTOR(3 downto 0);
	signal saida_COMPLEMENTO2: STD_LOGIC_VECTOR(3 downto 0);
	signal saida_SUBTRATOR   : STD_LOGIC_VECTOR(3 downto 0);
	signal saida_FULLADDER   :	STD_LOGIC_VECTOR(3 downto 0);
	signal saida_DOBRO       : STD_LOGIC_VECTOR(3 downto 0);
	signal saida_METADE  	 :	STD_LOGIC_VECTOR(3 downto 0);

	-- FLAGS
	signal flags_INCREMENTO  : STD_LOGIC_VECTOR(3 downto 0);
	signal flags_AND         : STD_LOGIC_VECTOR(3 downto 0);
	signal flags_XOR 			 : STD_LOGIC_VECTOR(3 downto 0);
	signal flags_COMPLEMENTO2: STD_LOGIC_VECTOR(3 downto 0);
	signal flags_SUBTRATOR	 : STD_LOGIC_VECTOR(3 downto 0);
	signal flags_FULLADDER   : STD_LOGIC_VECTOR(3 downto 0);
	signal flags_DOBRO 		 : STD_LOGIC_VECTOR(3 downto 0);
	signal flags_METADE		 : STD_LOGIC_VECTOR(3 downto 0);

begin

	-- MAPEAMENTO DE PORTAS
	FUNCTION_INCREMENTO   : incremento     PORT MAP (entrada1, saida_INCREMENTO, flags_INCREMENTO);
	FUNCTION_AND          : a_and_b        PORT MAP (entrada1, entrada2, saida_AND, flags_AND);
	FUNCTION_XOR          : a_xor_b        PORT MAP (entrada1, entrada2, saida_XOR, flags_XOR);  
	FUNCTION_COMPLEMENTO2 : complemento2   PORT MAP (entrada1, saida_COMPLEMENTO2);
   FUNCTION_FULLADDER    : fullAdder4bits PORT MAP (entrada1, entrada2, '0' , saida_FULLADDER, flags_FULLADDER);
   FUNCTION_SUBTRATOR    : subtrator      PORT MAP (entrada1, entrada2, saida_SUBTRATOR, flags_SUBTRATOR);
	FUNCTION_DOBRO        : dobro          PORT MAP (entrada1, saida_DOBRO, flags_DOBRO);
	FUNCTION_METADE       : metade 			PORT MAP (entrada1, saida_METADE);
	 
	-- CODIFICAÇÃO DA SAÍDA DEPENDENDO DA SELEÇÃO
	WITH selecao SELECT saidaFinal <=  
								-- Exigem 1 entrada
								saida_INCREMENTO   WHEN "0001",
								saida_COMPLEMENTO2 WHEN "0010",
								saida_DOBRO        WHEN "0011",
								saida_METADE       WHEN "0100",
								
								-- Exigem duas entradas
								saida_XOR          WHEN "0101",
								saida_AND          WHEN "0110",
								saida_SUBTRATOR    WHEN "0111",
								saida_FULLADDER    WHEN "1000",
								"0000"             WHEN OTHERS;
								
	WITH selecao SELECT flags <=
								-- Exigem 1 entrada
								flags_INCREMENTO   WHEN "0001",	
								flags_COMPLEMENTO2 WHEN "0010",
								flags_DOBRO        WHEN "0011",
								flags_METADE       WHEN "0100",
								
								-- Exigem duas entradas
								flags_XOR          WHEN "0101",
								flags_AND          WHEN "0110",
								flags_SUBTRATOR    WHEN "0111",
								flags_FULLADDER    WHEN "1000",
								"0000"             WHEN OTHERS;

end Behavioral;