library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.textio.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;

entity circuit_tb is

end circuit_tb;

 architecture Behavioral of circuit_tb is

    component circuit is
    Port ( clk : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (7 downto 0);
           switch1 : in STD_LOGIC;
           switch2 : in STD_LOGIC;
           switch3 : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (15 downto 0));
    end component;

signal clk, switch1, switch2, switch3: STD_LOGIC := '0';
signal input: STD_LOGIC_VECTOR (7 downto 0);
signal outputs: STD_LOGIC_VECTOR (15 downto 0);

file file_input, file_output: text;

begin

    uut: circuit port map ( clk => clk, input => input, switch1 => switch1, switch2 => switch2, switch3 => switch3, output=> outputs ); 
    
    clk <= not clk after 10 ns;
    
    p1: process
        variable v_input_line, v_output_line: line;
        variable v_input: STD_LOGIC_VECTOR (7 downto 0);
        variable v_space1, v_space2, v_space3: character;
        variable v_switch1, v_switch2, v_switch3: STD_LOGIC;
    begin
        
        wait for 10 ns;
        
        file_open(file_input, "input.txt",  read_mode);
        file_open(file_output, "output.txt", write_mode);
        
        while not endfile(file_input) loop
            readline(file_input, v_input_line);
            read(v_input_line, v_input);
            read(v_input_line, v_space1);
            read(v_input_line, v_switch1);
            read(v_input_line, v_space2);
            read(v_input_line, v_switch2);
            read(v_input_line, v_space3);
            read(v_input_line, v_switch3);
           
            input <= v_input;
            switch1 <= v_switch1;
            switch2 <= v_switch2;
            switch3 <= v_switch3;
            wait for 10 ns;
            switch1 <= '0';
            switch2 <= '0';
            switch3 <= '0';
            --wait for 10 ns;
           
            write(v_output_line, outputs, right, 16);
            writeline(file_output, v_output_line); 
            wait for 10 ns;
              
        end loop;
        
        file_close(file_input);
        file_close(file_output);
        
        wait for 10 ns;
        
    end process;
end Behavioral;