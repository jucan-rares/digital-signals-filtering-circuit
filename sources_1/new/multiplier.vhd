library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity multiplier is
    port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR (15 downto 0));
end multiplier;

architecture Behavioral of multiplier is

signal aux0, aux1, aux2, aux3, aux4, aux5, aux6, aux7: STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

begin 

    process (B)  --shift and add method
    begin 
    
        if (B(0) = '1') then
            aux0 <= "00000000" & A;
        else
            aux0 <= "0000000000000000";
        end if;
        
        if (B(1) = '1') then
            aux1 <= "0000000" & A & "0";
        else
            aux1 <= "0000000000000000";
        end if; 
        
        if (B(2) = '1') then
            aux2 <= "000000" & A & "00";
        else
            aux2 <= "0000000000000000";
        end if;  
        
        if (B(3) = '1') then
            aux3 <= "00000" & A & "000";
        else
            aux3 <= "0000000000000000";
        end if;
        
        if (B(4) = '1') then
            aux4 <= "0000" & A & "0000";
        else
            aux4 <= "0000000000000000";
        end if;
        
        if (B(5) = '1') then
            aux5 <= "000" & A & "00000";
        else
            aux5 <= "0000000000000000";
        end if;
        
        if (B(6) = '1') then
            aux6 <= "00" & A & "000000";
        else
            aux6 <= "0000000000000000";
        end if;
        
        if (B(7) = '1') then
            aux7 <= "0" & A & "0000000";
        else
            aux7 <= "0000000000000000";
        end if;
           
   end process; 
   
   output <= aux0 + aux1 + aux2 + aux3 + aux4 + aux5 + aux6 + aux7;
 
end Behavioral;