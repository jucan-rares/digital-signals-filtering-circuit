library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity queue is
    Port ( clk : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (7 downto 0);
           output0 : out STD_LOGIC_VECTOR (7 downto 0);
           output1 : out STD_LOGIC_VECTOR (7 downto 0);
           output2 : out STD_LOGIC_VECTOR (7 downto 0);
           output3 : out STD_LOGIC_VECTOR (7 downto 0));
end queue;

architecture Structural of queue is

    component aux_register is
    Port ( clk : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

signal out0, out1, out2, out3: STD_LOGIC_VECTOR (7 downto 0);

begin
    
    a1: aux_register port map ( clk => clk, input => input, output => out0 );
    a2: aux_register port map ( clk => clk, input => out0,  output => out1 );
    a3: aux_register port map ( clk => clk, input => out1,  output => out2 );
    a4: aux_register port map ( clk => clk, input => out2,  output => out3 );

    output0 <= out0;
    output1 <= out1;
    output2 <= out2;
    output3 <= out3;

end Structural;