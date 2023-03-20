library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adder is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           cin : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (15 downto 0);
           cout : out STD_LOGIC);
end adder;

architecture Behavioral of adder is

    component full_adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           cin : in STD_LOGIC;
           output : out STD_LOGIC;
           cout : out STD_LOGIC);
    end component;
    
signal carry: STD_LOGIC_VECTOR(14 downto 0) := (others => '0');

begin

     a0:  full_adder port map ( A => A(0),  B => B(0),  cin => cin,       output => output(0),  cout => carry(0));
     a1:  full_adder port map ( A => A(1),  B => B(1),  cin => carry(0),  output => output(1),  cout => carry(1));
     a2:  full_adder port map ( A => A(2),  B => B(2),  cin => carry(1),  output => output(2),  cout => carry(2));
     a3:  full_adder port map ( A => A(3),  B => B(3),  cin => carry(2),  output => output(3),  cout => carry(3));
     a4:  full_adder port map ( A => A(4),  B => B(4),  cin => carry(3),  output => output(4),  cout => carry(4));
     a5:  full_adder port map ( A => A(5),  B => B(5),  cin => carry(4),  output => output(5),  cout => carry(5));
     a6:  full_adder port map ( A => A(6),  B => B(6),  cin => carry(5),  output => output(6),  cout => carry(6));
     a7:  full_adder port map ( A => A(7),  B => B(7),  cin => carry(6),  output => output(7),  cout => carry(7));
     a8:  full_adder port map ( A => A(8),  B => B(8),  cin => carry(7),  output => output(8),  cout => carry(8));
     a9:  full_adder port map ( A => A(9),  B => B(9),  cin => carry(8),  output => output(9),  cout => carry(9));
     a10: full_adder port map ( A => A(10), B => B(10), cin => carry(9),  output => output(10), cout => carry(10));
     a11: full_adder port map ( A => A(11), B => B(11), cin => carry(10), output => output(11), cout => carry(11));
     a12: full_adder port map ( A => A(12), B => B(12), cin => carry(11), output => output(12), cout => carry(12));
     a13: full_adder port map ( A => A(13), B => B(13), cin => carry(12), output => output(13), cout => carry(13));
     a14: full_adder port map ( A => A(14), B => B(14), cin => carry(13), output => output(14), cout => carry(14));
     a15: full_adder port map ( A => A(15), B => B(15), cin => carry(14), output => output(15), cout => cout);
    
end Behavioral;