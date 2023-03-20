library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity filter3 is
    Port ( x0 : in STD_LOGIC_VECTOR (7 downto 0);
           y1 : in STD_LOGIC_VECTOR (15 downto 0);
           y2 : in STD_LOGIC_VECTOR (15 downto 0);
           y3 : in STD_LOGIC_VECTOR (15 downto 0);
           output : out STD_LOGIC_VECTOR (15 downto 0));
end filter3;

architecture Behavioral of filter3 is

    component adder is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           cin : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (15 downto 0);
           cout : out STD_LOGIC);
    end component;

    component multiplier is
    port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
signal aux1, aux2, aux3: STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal cout: STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
begin
  
    --formula: output = a*x0 + y1 + y2 + y3      
    --the coefficient is hardcoded (in our case: a = 3)
    
    --firstly we compute the product
    m1: multiplier port map ( A => "00000011", B => x0, output => aux1);
     
    --then the final additions
    a1: adder port map ( A => y1  , B => y2  , cin => '0'    , output => aux2  , cout => cout(0));
    a2: adder port map ( A => aux1, B => aux2, cin => cout(0), output => aux3  , cout => cout(1));
    a3: adder port map ( A => aux3, B => y3  , cin => cout(1), output => output, cout => cout(2));

end Behavioral;