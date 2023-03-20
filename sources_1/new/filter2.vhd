library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity filter2 is
    Port ( x0 : in STD_LOGIC_VECTOR (7 downto 0);
           x1 : in STD_LOGIC_VECTOR (7 downto 0);
           x2 : in STD_LOGIC_VECTOR (7 downto 0);
           x3 : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR (7 downto 0));
end filter2;

architecture Behavioral of filter2 is

begin

    process (x0, x1, x2, x3) 
        variable cnt : STD_LOGIC_VECTOR(7 downto 0);
        variable Atemp : STD_LOGIC_VECTOR(7 downto 0);
        variable aux : STD_LOGIC_VECTOR(7 downto 0);
    begin
        
        aux := x1 + x2 + x3;
        Atemp :=  x0;
        cnt := "00000000";
        
        while Atemp >= aux loop 
            Atemp := (Atemp - aux);
            cnt := cnt + "00000001";
        end loop;
        
        output <= cnt;
        
    end process;
    
end Behavioral;