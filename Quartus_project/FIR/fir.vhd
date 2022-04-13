library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
entity fir is
	   generic (
      N_BITS_INPUT: integer := 6;
		N_BITS_COEF: integer:= 9;
		N_TAPS: integer := 17
    );
	port (
		CLK        : in  std_logic;
		RST       : in  std_logic;
		ORDER_SEL	 : in  std_logic;
		-- data input
		DATA_IN       : in  std_logic_vector( N_BITS_INPUT-1 downto 0);
		-- filtered data 
		DATA_OUT       : out std_logic_vector( N_BITS_INPUT-1 downto 0)
		);
end fir;
architecture rtl of fir is
	constant MULT_RESULT_LENGTH: integer := (N_BITS_INPUT + N_BITS_COEF+1);
	constant N_TAPS_DIV_2: integer := integer(ceil(real(N_TAPS/2)));
	type DATA_BUF_MATRIX			is array (0 to N_TAPS-1) of signed(N_BITS_INPUT  downto 0);
	type COEFF_TYPE          	is array (0 to N_TAPS-1) of signed(N_BITS_COEF-1  downto 0);
	type MULT_MATRIX           	is array (0 to N_TAPS-1) of signed(MULT_RESULT_LENGTH-1    downto 0);
	type ADD0_MATRIX        	is array (0 to N_TAPS_DIV_2-1) of signed(MULT_RESULT_LENGTH  downto 0);
	type ADD1_MATRIX        	is array (0 to N_TAPS_DIV_2/2-1) of signed(MULT_RESULT_LENGTH+1  downto 0);
	type ADD2_MATRIX        	is array (0 to N_TAPS_DIV_2/4-1) of signed (MULT_RESULT_LENGTH+2  downto 0);
		
		constant COEFFS_VALS: COEFF_TYPE			:= (
															to_signed(-3, 9),
															to_signed(-1, 9),
															to_signed(3, 9),
															to_signed(18, 9),
															to_signed(45, 9),
															to_signed(83, 9),
															to_signed(124, 9),
															to_signed(155, 9),
															to_signed(167, 9),
															
															to_signed(155, 9),
															to_signed(124, 9),
															to_signed(83, 9),
															to_signed(45, 9),
															to_signed(18, 9),
															to_signed(3, 9),
															to_signed(-1, 9),
															to_signed(-3, 9)
															
															);
		
		constant COEFFS_VALS_LO: COEFF_TYPE			:= (
															to_signed(1, 9),
															to_signed(0, 9),
															to_signed(-4, 9),
															to_signed(-12, 9),
															to_signed(-13, 9),
															to_signed(11, 9),
															to_signed(66, 9),
															to_signed(126, 9),
															to_signed(152, 9),
															
															to_signed(126, 9),
															to_signed(66, 9),
															to_signed(11, 9),
															to_signed(-13, 9),
															to_signed(-12, 9),
															to_signed(-4, 9),
															to_signed(0, 9),
															to_signed(1, 9)
															);
	
	
	
	--different length of the registers are prevent from overflow
	signal COEFFS              : COEFF_TYPE ;
	signal DATA_BUF            : DATA_BUF_MATRIX;
	signal MULT_OUT              : MULT_MATRIX;
	signal ADD0_OUT            : ADD0_MATRIX;
	signal ADD1_OUT            : ADD1_MATRIX;
	signal ADD2_OUT            : ADD2_MATRIX;
	signal ADD3_OUT            : signed (MULT_RESULT_LENGTH+3  downto 0);
	signal ADD4_OUT				 : signed (MULT_RESULT_LENGTH+4  downto 0);
	signal DATA_IN_EXT			: signed (N_BITS_INPUT  downto 0);
	begin
	-------------------------------------------------------
	p_input : process (RST,CLK)
	begin
	if(RST='0') then
		DATA_BUF       <= (others=>(others=>'0'));
		COEFFS      <= (others=>(others=>'0'));
		DATA_IN_EXT    <= (others=>'0');
	elsif(rising_edge(CLK)) then
		DATA_IN_EXT   <= signed('0' & DATA_IN);
		DATA_BUF      <= DATA_IN_EXT&DATA_BUF(0 to DATA_BUF'length-2); --desplazando datos
		for i in 0 to N_TAPS-1 loop
			if(ORDER_SEL = '0') then
				COEFFS(i)  <= COEFFS_VALS(i);
			
			elsif( ORDER_SEL = '1') then
				COEFFS(i)  <= COEFFS_VALS_LO(i);
			else
				COEFFS(i)  <= COEFFS_VALS(i);
			end if;

		end loop;
	end if;
	end process p_input;
	-------------------------------------------------------
	p_mult : process (RST,CLK)
	begin
	if(RST='0') then
		MULT_OUT       <= (others=>(others=>'0'));
	elsif(rising_edge(CLK)) then
		for k in 0 to N_TAPS-1 loop
			MULT_OUT(k)       <= DATA_BUF(k) * COEFFS(k);
		end loop;
	end if;
	end process p_mult;
	-----------------------------------------------------
	adders_row0 : process (RST,CLK)
	begin
	if(RST='0') then
		ADD0_OUT     <= (others=>(others=>'0'));
	elsif(rising_edge(CLK)) then
		for k in 0 to (N_TAPS_DIV_2-1) loop 
			ADD0_OUT(k)     <= resize(MULT_OUT(2*k),MULT_RESULT_LENGTH+1)  + resize(MULT_OUT(2*k+1),MULT_RESULT_LENGTH+1);
		end loop;
	end if;
	end process adders_row0;
	-------------------------------------------------------
	adders_row1 : process (RST,CLK)
	begin
	if(RST='0') then
		ADD1_OUT     <= (others=>(others=>'0'));
	elsif(rising_edge(CLK)) then
		for k in 0 to (N_TAPS_DIV_2/2-1) loop
			ADD1_OUT(k)     <= resize(ADD0_OUT(2*k),MULT_RESULT_LENGTH+2)  + resize(ADD0_OUT(2*k+1),MULT_RESULT_LENGTH+2);
			end loop;
	end if;
	end process adders_row1;
	-------------------------------------------------------
	adders_row2 : process (RST,CLK)
	begin
	if(RST='0') then
		ADD2_OUT     <= (others=>(others=>'0'));
	elsif(rising_edge(CLK)) then
		for k in 0 to (N_TAPS_DIV_2/4-1) loop
			ADD2_OUT(k)     <= resize(ADD1_OUT(2*k),MULT_RESULT_LENGTH+3)  + resize(ADD1_OUT(2*k+1),MULT_RESULT_LENGTH+3);
			end loop;
	end if;
	end process adders_row2;
	-------------------------------------------------------
	adders_row3 : process (RST,CLK)
	begin
	if(RST='0') then
		ADD3_OUT     <= (others=>'0');
	elsif(rising_edge(CLK)) then
		ADD3_OUT     <= resize(ADD2_OUT(0),MULT_RESULT_LENGTH+4)  + resize(ADD2_OUT(1),MULT_RESULT_LENGTH+4);
	end if;
	end process adders_row3;
	-------------------------------------------------------
	adders_row4 : process (RST,CLK)
	begin
	if(RST='0') then
		ADD4_OUT     <= (others=>'0');
	elsif(rising_edge(CLK)) then
		ADD4_OUT     <= resize(ADD3_OUT,MULT_RESULT_LENGTH+5)  + resize(MULT_OUT(N_TAPS-1),MULT_RESULT_LENGTH+5);
	end if;
	end process adders_row4;
	-------------------------------------------------------
	p_output : process (RST,CLK)
	begin
	if(RST='0') then
		DATA_OUT     <= (others=>'0');
	elsif(rising_edge(CLK)) then
		if(ORDER_SEL = '0') then
			DATA_OUT     <= std_logic_vector(ADD4_OUT(15 downto 10));--dividing by 1024 because the coefficients were multiplied by 1024
		elsif(ORDER_SEL = '1') then
			DATA_OUT     <= std_logic_vector(ADD4_OUT(14 downto 9));--dividing by 512 because the coefficients were multiplied by 512
		end if;
	end if;
	end process p_output;
	end rtl;