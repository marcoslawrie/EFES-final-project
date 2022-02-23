library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end entity;

architecture struct of testbench is


type input_DATA is array (0 to 29)
        of std_logic_vector(7 downto 0);
  constant waveform : input_DATA :=
            (    "00000000",
    "01000011",
    "00001000",
    "11001100",
    "00010000",
    "01010011",
    "00010111",
    "11011100",
    "00011111",
    "01100010",
    "00100101",
    "11101001",
    "00101011",
    "01101110",
    "00110001",
    "11110100",
    "00110110",
    "01110111",
    "00111001",
    "11111100",
    "00111100",
    "01111101",
    "00111110",
    "11111111",
    "00111111",
    "01111111",
    "00111111",
    "11111111",
    "00111110",
    "01111101");
COMPONENT fir IS
    PORT
    (
		i_clk        : in  std_logic;
		i_rstb       : in  std_logic;
    	  -- data input
		i_data       : in  std_logic_vector( 7 downto 0);
  -- filtered data 
		o_data       : out std_logic_vector( 9 downto 0)
    );
END COMPONENT;

CONSTANT clk_period: TIME:=5 ms;

signal data_in:std_logic_vector(7 downto 0);
signal data_out:std_logic_vector( 9 downto 0);
signal clk_tb,rst_tb:std_logic;

begin

DUT: fir PORT MAP(clk_tb,rst_tb,data_in,data_out);

ClkProcess:PROCESS
BEGIN
    clk_tb<='0';
    wait for clk_period/2;
    clk_tb<='1';
    wait for clk_period/2;
END PROCESS ClkProcess;
testProcess: PROCESS 
variable index : integer := 0;
BEGIN
data_in<="00000000";
rst_tb<='0';
wait for 20 ns;
rst_tb<='1';
for k in 0 to waveform'length-1 loop
	wait until rising_edge(clk_tb);
	data_in<=waveform(index);
	index := index + 1;
end loop;
--wait until rising_edge(clk_tb);
--data_in<=waveform(index);
--index := index + 1;
--wait until rising_edge(clk_tb);
--data_in<=waveform(index);
--index := index + 1;
--wait until rising_edge(clk_tb);
--data_in<=waveform(index);
--index := index + 1;
--wait until rising_edge(clk_tb);
--data_in<=waveform(index);
--index := index + 1;
--wait until rising_edge(clk_tb);
--data_in<=waveform(index);
--index := index + 1;
--wait until rising_edge(clk_tb);
--data_in<=waveform(index);
--index := index + 1;
--wait until rising_edge(clk_tb);
--data_in<=waveform(index);
--index := index + 1;
--wait until rising_edge(clk_tb);
--data_in<=waveform(index);
--index := index + 1;
--wait until rising_edge(clk_tb);
--data_in<=waveform(index);
--index := index + 1;
--wait until rising_edge(clk_tb);
--data_in<=waveform(index);
--index := index + 1;



WAIT;
END PROCESS testProcess;



end architecture struct;