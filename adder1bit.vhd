library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

------------------------------
entity adder1bit is
    port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end adder1bit;


architecture Behavioral of adder1bit is

signal x : std_logic;

begin
		x <= (A XOR B) XOR Cin;
		sum <= x;
		cout <= (A AND B) or (B AND Cin) or (A AND Cin);
end Behavioral;