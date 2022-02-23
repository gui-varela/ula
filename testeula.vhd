LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY testeula IS
END testeula;
 
ARCHITECTURE behavior OF testeula IS 
 
    -- Entidade principal
 
    COMPONENT ula
    PORT(
         entrada1   : IN  std_logic_vector(3 downto 0);
         entrada2   : IN  std_logic_vector(3 downto 0);
         selecao    : IN  std_logic_vector(3 downto 0);
         saidaFinal : OUT  std_logic_vector(3 downto 0);
			flags      : OUT std_logic_vector(3 downto 0) 
        );
    END COMPONENT ula;
    

   --Inputs
   signal entrada1 : unsigned(3 downto 0) := ("0000");
   signal entrada2 : unsigned(3 downto 0) := ("0000");
   signal selecao  : unsigned(3 downto 0) := ("0001");

 	--Outputs
   signal saidaFinal : std_logic_vector(3 downto 0);
	signal flags      : std_logic_vector(3 downto 0);
 
BEGIN
 
	-- Mapeamento de portas
   dut: ula PORT MAP (
          entrada1   => std_logic_vector(entrada1),
          entrada2   => std_logic_vector(entrada2),
          selecao    => std_logic_vector(selecao),
          saidaFinal => saidaFinal,
			 flags      => flags
        );
	
	-- Incremento do seletor	
	selec: process
   begin	
		
		case selecao is
			when "0100" | "0101" | "0110" | "0111" =>
				wait for 5120 ns;	
				selecao <= selecao + 1;
				
			when others =>
				wait for 320 ns;	
				selecao <= selecao + 1;
		end case;

   end process;

	
   -- INCREMENTO DA ENTRADA 1
	prim_entrada: process
   begin			
			wait for 20 ns;
			entrada1 <= entrada1 + 1;	
		
   end process;
	
	
	-- INCREMENTO DA ENTRADA 2
	seg_entrada: process
   begin		
		-- Não incrementa quando a entrada 2 não é necessária
		case selecao is
			when "0100" | "0101" | "0110" | "0111" =>
				wait for 320 ns;
				entrada2 <= entrada2 + 1;
				
			when others =>
				entrada2 <= "0000";
				wait for 320 ns;	
				
		end case;
		
   end process;

END;