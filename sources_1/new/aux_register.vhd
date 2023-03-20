library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity aux_register is
    Port ( clk : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR (7 downto 0));
end aux_register;

architecture Behavioral of aux_register is

begin

    process (clk)
    begin 
        if clk'event and clk = '1' then
            output <= input; 
        end if;   
    end process;

end Behavioral;