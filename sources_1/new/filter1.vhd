library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity filter1 is
    Port ( x0 : in STD_LOGIC_VECTOR (7 downto 0);
           x1 : in STD_LOGIC_VECTOR (7 downto 0);
           x2 : in STD_LOGIC_VECTOR (7 downto 0);
           x3 : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR (15 downto 0));
end filter1;

architecture Behavioral of filter1 is

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
    
signal aux1, aux2, aux3, aux4, aux5, aux6: STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal cout: STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
begin
  
    --formula: output = a0*x0 + a1*x1 + a2*x2 + a3*x3      
    --the coefficients are hardcoded (in our case: a0 = 2, a1 = 16, a2 = 5, a3 = 10)
    
    --firstly we compute the products
    m1: multiplier port map ( A => "00000001", B => x0, output => aux1);
    m2: multiplier port map ( A => "00000001", B => x1, output => aux2);
    m3: multiplier port map ( A => "00000001", B => x2, output => aux3);
    m4: multiplier port map ( A => "00000001", B => x3, output => aux4);
     
    --then the final additions
    a1: adder port map ( A => aux1, B => aux2, cin => '0'    , output => aux5  , cout => cout(0));
    a2: adder port map ( A => aux5, B => aux3, cin => cout(0), output => aux6  , cout => cout(1));
    a3: adder port map ( A => aux6, B => aux4, cin => cout(1), output => output, cout => cout(2));

end Behavioral;