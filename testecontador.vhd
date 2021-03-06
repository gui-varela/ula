library ieee;
use ieee.std_logic_1164.all;

entity testecontador is
    constant    n   :   integer := 4; -- quantidade de bits do contador (DUT)
end testecontador;

architecture sim of testecontador is

    signal clk  :   std_logic   := '0';
    signal rst  :   std_logic   := '0';
    signal q    :   std_logic_vector(n - 1 downto 0) := (others => '0');

begin

    DUT :   entity work.contador generic map(n) port map(clk, rst, q);

    clock : process
    begin
        wait for 50 ns; -- clock de 10 MHz
        clk <= not clk;
    end process ; -- clock

    reset : process
    begin
        rst <= '0';
        wait for 120 ns;

        rst <= '1';
        wait for 120 ns;

        rst <= '0';
        wait;

    end process ; -- reset

end sim ; -- sim