library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
entity fir is
	   generic (
      N_BITS_INPUT: integer := 6;
		N_BITS_COEF: integer:= 8;
		N_TAPS: integer := 9
    );
	port (
		i_clk        : in  std_logic;
		i_rstb       : in  std_logic;
  -- coefficient
  --i_coeff_0    : in  std_logic_vector( 7 downto 0);
  --i_coeff_1    : in  std_logic_vector( 7 downto 0);
  --i_coeff_2    : in  std_logic_vector( 7 downto 0);
  --i_coeff_3    : in  std_logic_vector( 7 downto 0);
  -- data input
		i_data       : in  std_logic_vector( N_BITS_INPUT-1 downto 0);
  -- filtered data 
		o_data       : out std_logic_vector( N_BITS_INPUT-1 downto 0));
end fir;
architecture rtl of fir is
	constant i_coeff_0: std_logic_vector(N_BITS_COEF-1 downto 0) := std_logic_vector(to_unsigned(19, 8));
	constant i_coeff_1: std_logic_vector(N_BITS_COEF-1 downto 0) := std_logic_vector(to_unsigned(50, 8));
	constant i_coeff_2: std_logic_vector(N_BITS_COEF-1 downto 0) := std_logic_vector(to_unsigned(126, 8));
	constant i_coeff_3: std_logic_vector(N_BITS_COEF-1 downto 0) := std_logic_vector(to_unsigned(201, 8));
	constant i_coeff_4: std_logic_vector(N_BITS_COEF-1 downto 0) := std_logic_vector(to_unsigned(233, 8));
	constant i_coeff_5: std_logic_vector(N_BITS_COEF-1 downto 0) := std_logic_vector(to_unsigned(201, 8));
	constant i_coeff_6: std_logic_vector(N_BITS_COEF-1 downto 0) := std_logic_vector(to_unsigned(126, 8));
	constant i_coeff_7: std_logic_vector(N_BITS_COEF-1 downto 0) := std_logic_vector(to_unsigned(50, 8));
	constant i_coeff_8: std_logic_vector(N_BITS_COEF-1 downto 0) := std_logic_vector(to_unsigned(19, 8));
	constant MULT_RESULT_LENGTH: integer := (N_BITS_INPUT + N_BITS_COEF);
	constant N_TAPS_DIV_2: integer := integer(floor(real(N_TAPS/2)));
	
	type t_data_pipe      is array (0 to N_TAPS-1) of unsigned(N_BITS_INPUT-1  downto 0);
	type t_coeff          is array (0 to N_TAPS-1) of unsigned(N_BITS_COEF-1  downto 0);
	type t_mult           is array (0 to N_TAPS-1) of unsigned(MULT_RESULT_LENGTH-1    downto 0);
	type t_add_st0        is array (0 to N_TAPS_DIV_2-1) of unsigned(MULT_RESULT_LENGTH  downto 0);
	type t_add_st1        is array (0 to N_TAPS_DIV_2/2-1) of unsigned(MULT_RESULT_LENGTH+1  downto 0);
	--different length of the registers are avoid the possibility of overflow
	--type t_add_st2			 is array (MULT_RESULT_LENGTH+2  downto 0) of unsigned; 
	--type t_add_st3			 is array (MULT_RESULT_LENGTH+3 downto 0) of unsigned; 
	signal r_coeff              : t_coeff ;
	signal p_data               : t_data_pipe;
	signal r_mult               : t_mult;
	signal r_add_st0            : t_add_st0;
	signal r_add_st1            : t_add_st1;
	signal r_add_st2            : unsigned (MULT_RESULT_LENGTH+2  downto 0);
	signal r_add_st3            : unsigned (MULT_RESULT_LENGTH+3  downto 0);
	
	begin
	-------------------------------------------------------
	p_input : process (i_rstb,i_clk)
	begin
	if(i_rstb='0') then
		p_data       <= (others=>(others=>'0'));
		r_coeff      <= (others=>(others=>'0'));
	elsif(rising_edge(i_clk)) then
		p_data      <= unsigned(i_data)&p_data(0 to p_data'length-2); --desplazando datos
		r_coeff(0)  <= unsigned(i_coeff_0);
		r_coeff(1)  <= unsigned(i_coeff_1);
		r_coeff(2)  <= unsigned(i_coeff_2);
		r_coeff(3)  <= unsigned(i_coeff_3);
		r_coeff(4)  <= unsigned(i_coeff_4);
		r_coeff(5)	<= unsigned(i_coeff_5);
		r_coeff(6)	<= unsigned(i_coeff_6);
		r_coeff(7)	<= unsigned(i_coeff_7);
		r_coeff(8)	<= unsigned(i_coeff_8);
	end if;
	end process p_input;
	-------------------------------------------------------
	p_mult : process (i_rstb,i_clk)
	begin
	if(i_rstb='0') then
		r_mult       <= (others=>(others=>'0'));
	elsif(rising_edge(i_clk)) then
		for k in 0 to N_TAPS-1 loop
			r_mult(k)       <= p_data(k) * r_coeff(k);
		end loop;
	end if;
	end process p_mult;
	-----------------------------------------------------
	p_add_st0 : process (i_rstb,i_clk)
	begin
	if(i_rstb='0') then
		r_add_st0     <= (others=>(others=>'0'));
	elsif(rising_edge(i_clk)) then
		for k in 0 to (N_TAPS_DIV_2-1) loop 
			r_add_st0(k)     <= resize(r_mult(2*k),MULT_RESULT_LENGTH+1)  + resize(r_mult(2*k+1),MULT_RESULT_LENGTH+1);
		end loop;
	end if;
	end process p_add_st0;
	-------------------------------------------------------
	p_add_st1 : process (i_rstb,i_clk)
	begin
	if(i_rstb='0') then
		r_add_st1     <= (others=>(others=>'0'));
	elsif(rising_edge(i_clk)) then
		for k in 0 to (N_TAPS_DIV_2/2-1) loop
			r_add_st1(k)     <= resize(r_add_st0(2*k),MULT_RESULT_LENGTH+2)  + resize(r_add_st0(2*k+1),MULT_RESULT_LENGTH+2);
			end loop;
	end if;
	end process p_add_st1;
	-------------------------------------------------------
	p_add_st2 : process (i_rstb,i_clk)
	begin
	if(i_rstb='0') then
		r_add_st2     <= (others=>'0');
	elsif(rising_edge(i_clk)) then
		r_add_st2     <= resize(r_add_st1(0),MULT_RESULT_LENGTH+3)  + resize(r_add_st1(1),MULT_RESULT_LENGTH+3);
	end if;
	end process p_add_st2;
	-------------------------------------------------------
	p_add_st3 : process (i_rstb,i_clk)
	begin
	if(i_rstb='0') then
		r_add_st3     <= (others=>'0');
	elsif(rising_edge(i_clk)) then
		r_add_st3     <= resize(r_add_st2,MULT_RESULT_LENGTH+4)  + resize(r_mult(N_TAPS-1),MULT_RESULT_LENGTH+4);
	end if;
	end process p_add_st3;
	-------------------------------------------------------
	p_output : process (i_rstb,i_clk)
	begin
	if(i_rstb='0') then
		o_data     <= (others=>'0');
	elsif(rising_edge(i_clk)) then
		o_data     <= std_logic_vector(r_add_st3(15 downto 10));--dividing by 1024 because the coefficients were multiplied by 1024
	end if;
	end process p_output;
	end rtl;