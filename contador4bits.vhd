library ieee;
use ieee.std_logic_1164.all;

entity contador4bits is
    port ( clock : in std_logic;
           contagematual: out std_logic_vector);
end contador4bits;
-----------------------
architecture behavioral of contador4bits is

begin
	process(clock)
		variable numeroatualcontador: integer range 0 to 15;
		
		begin
		numeroatualcontador:=0;
		if clock'event and clock = '1' then
		  numeroatualcontador := numeroatualcontador + 1;
		end if;		
	end process;
end behavioral;