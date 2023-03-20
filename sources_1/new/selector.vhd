library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity selector is
    Port ( f_out1 : in STD_LOGIC_VECTOR (15 downto 0);
           f_out2 : in STD_LOGIC_VECTOR (15 downto 0);
           f_out3 : in STD_LOGIC_VECTOR (15 downto 0);
           switch1 : in STD_LOGIC;
           switch2 : in STD_LOGIC;
           switch3 : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (15 downto 0));
end selector;

architecture Behavioral of selector is

begin

    --an important note here is that if multiple switches are on then the selector will choose the one with the smaller number 
    process(switch1, switch2, switch3)
    begin
        if(switch1 = '1') then
            output <= f_out1;
        else
            if(switch2 = '1') then
                output <= f_out2;
            else
                if(switch3 = '1') then
                    output <= f_out3;
                else 
                    output <= "0000000000000000"; --if neither switch is on then we will set the output to 0
                end if;
            end if;
        end if;
    end process;

end Behavioral;