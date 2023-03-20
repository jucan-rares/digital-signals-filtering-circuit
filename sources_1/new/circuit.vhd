library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity circuit is
    Port ( clk : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (7 downto 0);
           switch1 : in STD_LOGIC;
           switch2 : in STD_LOGIC;
           switch3 : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (15 downto 0));
end circuit;

architecture Structural of circuit is

-- declaring components -------------------------------

    component filter1 is
    Port ( x0 : in STD_LOGIC_VECTOR (7 downto 0);
           x1 : in STD_LOGIC_VECTOR (7 downto 0);
           x2 : in STD_LOGIC_VECTOR (7 downto 0);
           x3 : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    component filter2 is
    Port ( x0 : in STD_LOGIC_VECTOR (7 downto 0);
           x1 : in STD_LOGIC_VECTOR (7 downto 0);
           x2 : in STD_LOGIC_VECTOR (7 downto 0);
           x3 : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component filter3 is
    Port ( x0 : in STD_LOGIC_VECTOR (7 downto 0);
           y1 : in STD_LOGIC_VECTOR (15 downto 0);
           y2 : in STD_LOGIC_VECTOR (15 downto 0);
           y3 : in STD_LOGIC_VECTOR (15 downto 0);
           output : out STD_LOGIC_VECTOR (15 downto 0));
    end component;

    component queue is
    Port ( clk : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (7 downto 0);
           output0 : out STD_LOGIC_VECTOR (7 downto 0);
           output1 : out STD_LOGIC_VECTOR (7 downto 0);
           output2 : out STD_LOGIC_VECTOR (7 downto 0);
           output3 : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component queue_extended is
    Port ( clk : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (15 downto 0);
           output0 : out STD_LOGIC_VECTOR (15 downto 0);
           output1 : out STD_LOGIC_VECTOR (15 downto 0);
           output2 : out STD_LOGIC_VECTOR (15 downto 0);
           output3 : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    component selector is
    Port ( f_out1 : in STD_LOGIC_VECTOR (15 downto 0);
           f_out2 : in STD_LOGIC_VECTOR (15 downto 0);
           f_out3 : in STD_LOGIC_VECTOR (15 downto 0);
           switch1 : in STD_LOGIC;
           switch2 : in STD_LOGIC;
           switch3 : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    component extender is
    Port ( input : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
-- declaring components --------------------------------
   
-- declaring signals -----------------------------------

signal x0, x1, x2, x3, f_out2 : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal y1, y2, y3 : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal f_out1, f_out2_extended, f_out3 : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal selector_out : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');

-- declaring signals ----------------------------------- 
  
begin
    
    q1: queue port map( clk => clk, input => input, output0 => x0, output1 => x1, output2 => x2, output3 => x3 );
    
    f1: filter1 port map( x0 => x0, x1 => x1, x2 => x2, x3 => x3, output => f_out1 );  
    
    f2: filter2 port map( x0 => x0, x1 => x1, x2 => x2, x3 => x3, output => f_out2 );
    
    f3: filter3 port map( x0 => x0, y1 => y1, y2 => y2, y3 => y3, output => f_out3 );
    
    e1: extender port map( input => f_out2, output =>  f_out2_extended);
    
    s1: selector port map( f_out1 => f_out1, f_out2 => f_out2_extended, f_out3 => f_out3, switch1 => switch1, switch2 => switch2, switch3 => switch3, output => output );
    
    --q2: queue_extended port map( clk => clk, input => selector_out, output0 => output, output1 => y1, output2 => y2, output3 => y3 );
    
end Structural;