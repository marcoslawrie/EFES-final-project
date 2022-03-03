-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "03/01/2022 20:27:58"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	fir IS
    PORT (
	i_clk : IN std_logic;
	i_rstb : IN std_logic;
	i_data : IN std_logic_vector(5 DOWNTO 0);
	o_data : BUFFER std_logic_vector(5 DOWNTO 0)
	);
END fir;

-- Design Ports Information
-- o_data[0]	=>  Location: PIN_AF19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- o_data[1]	=>  Location: PIN_AG21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- o_data[2]	=>  Location: PIN_AF18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- o_data[3]	=>  Location: PIN_AG20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- o_data[4]	=>  Location: PIN_AG18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- o_data[5]	=>  Location: PIN_AJ21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- i_clk	=>  Location: PIN_AE16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_rstb	=>  Location: PIN_AG16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[0]	=>  Location: PIN_AC18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[1]	=>  Location: PIN_Y17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[2]	=>  Location: PIN_AD17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[3]	=>  Location: PIN_Y18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[4]	=>  Location: PIN_AK16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[5]	=>  Location: PIN_AK18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF fir IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_i_clk : std_logic;
SIGNAL ww_i_rstb : std_logic;
SIGNAL ww_i_data : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_o_data : std_logic_vector(5 DOWNTO 0);
SIGNAL \Mult8~8_ACLR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Mult8~8_CLK_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Mult8~8_ENA_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Mult8~8_AX_bus\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \Mult8~8_AY_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \Mult8~8_RESULTA_bus\ : std_logic_vector(63 DOWNTO 0);
SIGNAL \Add3~8_ACLR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Add3~8_CLK_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Add3~8_ENA_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Add3~8_AX_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \Add3~8_AY_bus\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \Add3~8_BX_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \Add3~8_BY_bus\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \Add3~8_RESULTA_bus\ : std_logic_vector(63 DOWNTO 0);
SIGNAL \Add2~8_ACLR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Add2~8_CLK_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Add2~8_ENA_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Add2~8_AX_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \Add2~8_AY_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \Add2~8_BX_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \Add2~8_BY_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \Add2~8_RESULTA_bus\ : std_logic_vector(63 DOWNTO 0);
SIGNAL \Add1~8_ACLR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Add1~8_CLK_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Add1~8_ENA_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Add1~8_AX_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \Add1~8_AY_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \Add1~8_BX_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \Add1~8_BY_bus\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \Add1~8_RESULTA_bus\ : std_logic_vector(63 DOWNTO 0);
SIGNAL \Add0~8_ACLR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Add0~8_CLK_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Add0~8_ENA_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Add0~8_AX_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \Add0~8_AY_bus\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \Add0~8_BX_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \Add0~8_BY_bus\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \Add0~8_RESULTA_bus\ : std_logic_vector(63 DOWNTO 0);
SIGNAL \Mult8~22\ : std_logic;
SIGNAL \Mult8~23\ : std_logic;
SIGNAL \Mult8~24\ : std_logic;
SIGNAL \Mult8~25\ : std_logic;
SIGNAL \Mult8~26\ : std_logic;
SIGNAL \Mult8~27\ : std_logic;
SIGNAL \Mult8~28\ : std_logic;
SIGNAL \Mult8~29\ : std_logic;
SIGNAL \Mult8~30\ : std_logic;
SIGNAL \Mult8~31\ : std_logic;
SIGNAL \Mult8~32\ : std_logic;
SIGNAL \Mult8~33\ : std_logic;
SIGNAL \Mult8~34\ : std_logic;
SIGNAL \Mult8~35\ : std_logic;
SIGNAL \Mult8~36\ : std_logic;
SIGNAL \Mult8~37\ : std_logic;
SIGNAL \Mult8~38\ : std_logic;
SIGNAL \Mult8~39\ : std_logic;
SIGNAL \Mult8~40\ : std_logic;
SIGNAL \Mult8~41\ : std_logic;
SIGNAL \Mult8~42\ : std_logic;
SIGNAL \Mult8~43\ : std_logic;
SIGNAL \Mult8~44\ : std_logic;
SIGNAL \Mult8~45\ : std_logic;
SIGNAL \Mult8~46\ : std_logic;
SIGNAL \Mult8~47\ : std_logic;
SIGNAL \Mult8~48\ : std_logic;
SIGNAL \Mult8~49\ : std_logic;
SIGNAL \Mult8~50\ : std_logic;
SIGNAL \Mult8~51\ : std_logic;
SIGNAL \Mult8~52\ : std_logic;
SIGNAL \Mult8~53\ : std_logic;
SIGNAL \Mult8~54\ : std_logic;
SIGNAL \Mult8~55\ : std_logic;
SIGNAL \Mult8~56\ : std_logic;
SIGNAL \Mult8~57\ : std_logic;
SIGNAL \Mult8~58\ : std_logic;
SIGNAL \Mult8~59\ : std_logic;
SIGNAL \Mult8~60\ : std_logic;
SIGNAL \Mult8~61\ : std_logic;
SIGNAL \Mult8~62\ : std_logic;
SIGNAL \Mult8~63\ : std_logic;
SIGNAL \Mult8~64\ : std_logic;
SIGNAL \Mult8~65\ : std_logic;
SIGNAL \Mult8~66\ : std_logic;
SIGNAL \Mult8~67\ : std_logic;
SIGNAL \Mult8~68\ : std_logic;
SIGNAL \Mult8~69\ : std_logic;
SIGNAL \Mult8~70\ : std_logic;
SIGNAL \Mult8~71\ : std_logic;
SIGNAL \Add3~23\ : std_logic;
SIGNAL \Add3~24\ : std_logic;
SIGNAL \Add3~25\ : std_logic;
SIGNAL \Add3~26\ : std_logic;
SIGNAL \Add3~27\ : std_logic;
SIGNAL \Add3~28\ : std_logic;
SIGNAL \Add3~29\ : std_logic;
SIGNAL \Add3~30\ : std_logic;
SIGNAL \Add3~31\ : std_logic;
SIGNAL \Add3~32\ : std_logic;
SIGNAL \Add3~33\ : std_logic;
SIGNAL \Add3~34\ : std_logic;
SIGNAL \Add3~35\ : std_logic;
SIGNAL \Add3~36\ : std_logic;
SIGNAL \Add3~37\ : std_logic;
SIGNAL \Add3~38\ : std_logic;
SIGNAL \Add3~39\ : std_logic;
SIGNAL \Add3~40\ : std_logic;
SIGNAL \Add3~41\ : std_logic;
SIGNAL \Add3~42\ : std_logic;
SIGNAL \Add3~43\ : std_logic;
SIGNAL \Add3~44\ : std_logic;
SIGNAL \Add3~45\ : std_logic;
SIGNAL \Add3~46\ : std_logic;
SIGNAL \Add3~47\ : std_logic;
SIGNAL \Add3~48\ : std_logic;
SIGNAL \Add3~49\ : std_logic;
SIGNAL \Add3~50\ : std_logic;
SIGNAL \Add3~51\ : std_logic;
SIGNAL \Add3~52\ : std_logic;
SIGNAL \Add3~53\ : std_logic;
SIGNAL \Add3~54\ : std_logic;
SIGNAL \Add3~55\ : std_logic;
SIGNAL \Add3~56\ : std_logic;
SIGNAL \Add3~57\ : std_logic;
SIGNAL \Add3~58\ : std_logic;
SIGNAL \Add3~59\ : std_logic;
SIGNAL \Add3~60\ : std_logic;
SIGNAL \Add3~61\ : std_logic;
SIGNAL \Add3~62\ : std_logic;
SIGNAL \Add3~63\ : std_logic;
SIGNAL \Add3~64\ : std_logic;
SIGNAL \Add3~65\ : std_logic;
SIGNAL \Add3~66\ : std_logic;
SIGNAL \Add3~67\ : std_logic;
SIGNAL \Add3~68\ : std_logic;
SIGNAL \Add3~69\ : std_logic;
SIGNAL \Add3~70\ : std_logic;
SIGNAL \Add3~71\ : std_logic;
SIGNAL \Add2~23\ : std_logic;
SIGNAL \Add2~24\ : std_logic;
SIGNAL \Add2~25\ : std_logic;
SIGNAL \Add2~26\ : std_logic;
SIGNAL \Add2~27\ : std_logic;
SIGNAL \Add2~28\ : std_logic;
SIGNAL \Add2~29\ : std_logic;
SIGNAL \Add2~30\ : std_logic;
SIGNAL \Add2~31\ : std_logic;
SIGNAL \Add2~32\ : std_logic;
SIGNAL \Add2~33\ : std_logic;
SIGNAL \Add2~34\ : std_logic;
SIGNAL \Add2~35\ : std_logic;
SIGNAL \Add2~36\ : std_logic;
SIGNAL \Add2~37\ : std_logic;
SIGNAL \Add2~38\ : std_logic;
SIGNAL \Add2~39\ : std_logic;
SIGNAL \Add2~40\ : std_logic;
SIGNAL \Add2~41\ : std_logic;
SIGNAL \Add2~42\ : std_logic;
SIGNAL \Add2~43\ : std_logic;
SIGNAL \Add2~44\ : std_logic;
SIGNAL \Add2~45\ : std_logic;
SIGNAL \Add2~46\ : std_logic;
SIGNAL \Add2~47\ : std_logic;
SIGNAL \Add2~48\ : std_logic;
SIGNAL \Add2~49\ : std_logic;
SIGNAL \Add2~50\ : std_logic;
SIGNAL \Add2~51\ : std_logic;
SIGNAL \Add2~52\ : std_logic;
SIGNAL \Add2~53\ : std_logic;
SIGNAL \Add2~54\ : std_logic;
SIGNAL \Add2~55\ : std_logic;
SIGNAL \Add2~56\ : std_logic;
SIGNAL \Add2~57\ : std_logic;
SIGNAL \Add2~58\ : std_logic;
SIGNAL \Add2~59\ : std_logic;
SIGNAL \Add2~60\ : std_logic;
SIGNAL \Add2~61\ : std_logic;
SIGNAL \Add2~62\ : std_logic;
SIGNAL \Add2~63\ : std_logic;
SIGNAL \Add2~64\ : std_logic;
SIGNAL \Add2~65\ : std_logic;
SIGNAL \Add2~66\ : std_logic;
SIGNAL \Add2~67\ : std_logic;
SIGNAL \Add2~68\ : std_logic;
SIGNAL \Add2~69\ : std_logic;
SIGNAL \Add2~70\ : std_logic;
SIGNAL \Add2~71\ : std_logic;
SIGNAL \Add1~23\ : std_logic;
SIGNAL \Add1~24\ : std_logic;
SIGNAL \Add1~25\ : std_logic;
SIGNAL \Add1~26\ : std_logic;
SIGNAL \Add1~27\ : std_logic;
SIGNAL \Add1~28\ : std_logic;
SIGNAL \Add1~29\ : std_logic;
SIGNAL \Add1~30\ : std_logic;
SIGNAL \Add1~31\ : std_logic;
SIGNAL \Add1~32\ : std_logic;
SIGNAL \Add1~33\ : std_logic;
SIGNAL \Add1~34\ : std_logic;
SIGNAL \Add1~35\ : std_logic;
SIGNAL \Add1~36\ : std_logic;
SIGNAL \Add1~37\ : std_logic;
SIGNAL \Add1~38\ : std_logic;
SIGNAL \Add1~39\ : std_logic;
SIGNAL \Add1~40\ : std_logic;
SIGNAL \Add1~41\ : std_logic;
SIGNAL \Add1~42\ : std_logic;
SIGNAL \Add1~43\ : std_logic;
SIGNAL \Add1~44\ : std_logic;
SIGNAL \Add1~45\ : std_logic;
SIGNAL \Add1~46\ : std_logic;
SIGNAL \Add1~47\ : std_logic;
SIGNAL \Add1~48\ : std_logic;
SIGNAL \Add1~49\ : std_logic;
SIGNAL \Add1~50\ : std_logic;
SIGNAL \Add1~51\ : std_logic;
SIGNAL \Add1~52\ : std_logic;
SIGNAL \Add1~53\ : std_logic;
SIGNAL \Add1~54\ : std_logic;
SIGNAL \Add1~55\ : std_logic;
SIGNAL \Add1~56\ : std_logic;
SIGNAL \Add1~57\ : std_logic;
SIGNAL \Add1~58\ : std_logic;
SIGNAL \Add1~59\ : std_logic;
SIGNAL \Add1~60\ : std_logic;
SIGNAL \Add1~61\ : std_logic;
SIGNAL \Add1~62\ : std_logic;
SIGNAL \Add1~63\ : std_logic;
SIGNAL \Add1~64\ : std_logic;
SIGNAL \Add1~65\ : std_logic;
SIGNAL \Add1~66\ : std_logic;
SIGNAL \Add1~67\ : std_logic;
SIGNAL \Add1~68\ : std_logic;
SIGNAL \Add1~69\ : std_logic;
SIGNAL \Add1~70\ : std_logic;
SIGNAL \Add1~71\ : std_logic;
SIGNAL \Add0~23\ : std_logic;
SIGNAL \Add0~24\ : std_logic;
SIGNAL \Add0~25\ : std_logic;
SIGNAL \Add0~26\ : std_logic;
SIGNAL \Add0~27\ : std_logic;
SIGNAL \Add0~28\ : std_logic;
SIGNAL \Add0~29\ : std_logic;
SIGNAL \Add0~30\ : std_logic;
SIGNAL \Add0~31\ : std_logic;
SIGNAL \Add0~32\ : std_logic;
SIGNAL \Add0~33\ : std_logic;
SIGNAL \Add0~34\ : std_logic;
SIGNAL \Add0~35\ : std_logic;
SIGNAL \Add0~36\ : std_logic;
SIGNAL \Add0~37\ : std_logic;
SIGNAL \Add0~38\ : std_logic;
SIGNAL \Add0~39\ : std_logic;
SIGNAL \Add0~40\ : std_logic;
SIGNAL \Add0~41\ : std_logic;
SIGNAL \Add0~42\ : std_logic;
SIGNAL \Add0~43\ : std_logic;
SIGNAL \Add0~44\ : std_logic;
SIGNAL \Add0~45\ : std_logic;
SIGNAL \Add0~46\ : std_logic;
SIGNAL \Add0~47\ : std_logic;
SIGNAL \Add0~48\ : std_logic;
SIGNAL \Add0~49\ : std_logic;
SIGNAL \Add0~50\ : std_logic;
SIGNAL \Add0~51\ : std_logic;
SIGNAL \Add0~52\ : std_logic;
SIGNAL \Add0~53\ : std_logic;
SIGNAL \Add0~54\ : std_logic;
SIGNAL \Add0~55\ : std_logic;
SIGNAL \Add0~56\ : std_logic;
SIGNAL \Add0~57\ : std_logic;
SIGNAL \Add0~58\ : std_logic;
SIGNAL \Add0~59\ : std_logic;
SIGNAL \Add0~60\ : std_logic;
SIGNAL \Add0~61\ : std_logic;
SIGNAL \Add0~62\ : std_logic;
SIGNAL \Add0~63\ : std_logic;
SIGNAL \Add0~64\ : std_logic;
SIGNAL \Add0~65\ : std_logic;
SIGNAL \Add0~66\ : std_logic;
SIGNAL \Add0~67\ : std_logic;
SIGNAL \Add0~68\ : std_logic;
SIGNAL \Add0~69\ : std_logic;
SIGNAL \Add0~70\ : std_logic;
SIGNAL \Add0~71\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \i_clk~input_o\ : std_logic;
SIGNAL \i_clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \i_rstb~input_o\ : std_logic;
SIGNAL \i_rstb~inputCLKENA0_outclk\ : std_logic;
SIGNAL \i_data[0]~input_o\ : std_logic;
SIGNAL \p_data[0][0]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \p_data[0][0]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[1][0]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[2][0]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[3][0]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \p_data[3][0]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[4][0]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[5][0]~_Duplicate_1DUPLICATE_q\ : std_logic;
SIGNAL \p_data[6][0]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \p_data[6][0]~_Duplicate_1_q\ : std_logic;
SIGNAL \i_data[1]~input_o\ : std_logic;
SIGNAL \p_data[0][1]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[1][1]~_Duplicate_1DUPLICATE_q\ : std_logic;
SIGNAL \p_data[2][1]~_Duplicate_1DUPLICATE_q\ : std_logic;
SIGNAL \p_data[3][1]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[4][1]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \p_data[4][1]~_Duplicate_1DUPLICATE_q\ : std_logic;
SIGNAL \p_data[5][1]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \p_data[5][1]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[6][1]~_Duplicate_1_q\ : std_logic;
SIGNAL \i_data[2]~input_o\ : std_logic;
SIGNAL \p_data[0][2]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \p_data[0][2]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[1][2]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \p_data[1][2]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[2][2]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[3][2]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \p_data[3][2]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[4][2]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \p_data[4][2]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[5][2]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \p_data[5][2]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[6][2]~_Duplicate_1_q\ : std_logic;
SIGNAL \i_data[3]~input_o\ : std_logic;
SIGNAL \p_data[0][3]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[1][3]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[2][3]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \p_data[2][3]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[3][3]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[4][3]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[5][3]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[6][3]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \p_data[6][3]~_Duplicate_1_q\ : std_logic;
SIGNAL \i_data[4]~input_o\ : std_logic;
SIGNAL \p_data[0][4]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \p_data[0][4]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[1][4]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[2][4]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \p_data[2][4]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[3][4]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \p_data[3][4]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[4][4]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \p_data[4][4]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[5][4]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[6][4]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \p_data[6][4]~_Duplicate_1_q\ : std_logic;
SIGNAL \i_data[5]~input_o\ : std_logic;
SIGNAL \p_data[0][5]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[1][5]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \p_data[1][5]~_Duplicate_1DUPLICATE_q\ : std_logic;
SIGNAL \p_data[2][5]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[3][5]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \p_data[3][5]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[4][5]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \p_data[4][5]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[5][5]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \p_data[5][5]~_Duplicate_1DUPLICATE_q\ : std_logic;
SIGNAL \p_data[6][5]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \p_data[6][5]~_Duplicate_1DUPLICATE_q\ : std_logic;
SIGNAL \p_data[5][0]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[5][2]~_Duplicate_1DUPLICATE_q\ : std_logic;
SIGNAL \p_data[5][4]~_Duplicate_1DUPLICATE_q\ : std_logic;
SIGNAL \p_data[5][5]~_Duplicate_1_q\ : std_logic;
SIGNAL \Add3~mac_pl[0][10]\ : std_logic;
SIGNAL \r_add_st0[3][10]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[3][10]~q\ : std_logic;
SIGNAL \p_data[4][0]~_Duplicate_1DUPLICATE_q\ : std_logic;
SIGNAL \p_data[4][1]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[4][2]~_Duplicate_1DUPLICATE_q\ : std_logic;
SIGNAL \p_data[3][0]~_Duplicate_1DUPLICATE_q\ : std_logic;
SIGNAL \Add2~mac_pl[0][10]\ : std_logic;
SIGNAL \r_add_st0[2][10]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[2][10]~q\ : std_logic;
SIGNAL \Add2~mac_pl[0][9]\ : std_logic;
SIGNAL \r_add_st0[2][9]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[2][9]~q\ : std_logic;
SIGNAL \Add3~mac_pl[0][9]\ : std_logic;
SIGNAL \r_add_st0[3][9]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[3][9]~q\ : std_logic;
SIGNAL \Add3~mac_pl[0][8]\ : std_logic;
SIGNAL \r_add_st0[3][8]~q\ : std_logic;
SIGNAL \Add2~mac_pl[0][8]\ : std_logic;
SIGNAL \r_add_st0[2][8]~q\ : std_logic;
SIGNAL \Add2~mac_pl[0][7]\ : std_logic;
SIGNAL \r_add_st0[2][7]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[2][7]~q\ : std_logic;
SIGNAL \Add3~mac_pl[0][7]\ : std_logic;
SIGNAL \r_add_st0[3][7]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[3][7]~q\ : std_logic;
SIGNAL \Add2~mac_pl[0][6]\ : std_logic;
SIGNAL \r_add_st0[2][6]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[2][6]~q\ : std_logic;
SIGNAL \Add3~mac_pl[0][6]\ : std_logic;
SIGNAL \r_add_st0[3][6]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[3][6]~q\ : std_logic;
SIGNAL \Add3~mac_pl[0][5]\ : std_logic;
SIGNAL \r_add_st0[3][5]~q\ : std_logic;
SIGNAL \Add2~mac_pl[0][5]\ : std_logic;
SIGNAL \r_add_st0[2][5]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[2][5]~q\ : std_logic;
SIGNAL \Add2~mac_pl[0][4]\ : std_logic;
SIGNAL \r_add_st0[2][4]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[2][4]~q\ : std_logic;
SIGNAL \Add3~mac_pl[0][4]\ : std_logic;
SIGNAL \r_add_st0[3][4]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[3][4]~q\ : std_logic;
SIGNAL \Add3~mac_pl[0][3]\ : std_logic;
SIGNAL \r_add_st0[3][3]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[3][3]~q\ : std_logic;
SIGNAL \Add2~mac_pl[0][3]\ : std_logic;
SIGNAL \r_add_st0[2][3]~q\ : std_logic;
SIGNAL \Add3~mac_pl[0][2]\ : std_logic;
SIGNAL \r_add_st0[3][2]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[3][2]~q\ : std_logic;
SIGNAL \Add2~mac_pl[0][2]\ : std_logic;
SIGNAL \r_add_st0[2][2]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[2][2]~q\ : std_logic;
SIGNAL \Add3~mac_pl[0][1]\ : std_logic;
SIGNAL \r_add_st0[3][1]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[3][1]~q\ : std_logic;
SIGNAL \Add2~mac_pl[0][1]\ : std_logic;
SIGNAL \r_add_st0[2][1]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[2][1]~q\ : std_logic;
SIGNAL \Add2~mac_pl[0][0]\ : std_logic;
SIGNAL \r_add_st0[2][0]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[2][0]~q\ : std_logic;
SIGNAL \Add3~mac_pl[0][0]\ : std_logic;
SIGNAL \r_add_st0[3][0]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[3][0]~q\ : std_logic;
SIGNAL \Add5~62\ : std_logic;
SIGNAL \Add5~58\ : std_logic;
SIGNAL \Add5~54\ : std_logic;
SIGNAL \Add5~50\ : std_logic;
SIGNAL \Add5~46\ : std_logic;
SIGNAL \Add5~42\ : std_logic;
SIGNAL \Add5~38\ : std_logic;
SIGNAL \Add5~34\ : std_logic;
SIGNAL \Add5~30\ : std_logic;
SIGNAL \Add5~26\ : std_logic;
SIGNAL \Add5~1_sumout\ : std_logic;
SIGNAL \r_add_st1[1][10]~q\ : std_logic;
SIGNAL \p_data[2][1]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[2][3]~_Duplicate_1DUPLICATE_q\ : std_logic;
SIGNAL \p_data[1][1]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[1][5]~_Duplicate_1_q\ : std_logic;
SIGNAL \Add1~mac_pl[0][10]\ : std_logic;
SIGNAL \r_add_st0[1][10]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[1][10]~q\ : std_logic;
SIGNAL \Add0~mac_pl[0][10]\ : std_logic;
SIGNAL \r_add_st0[0][10]~q\ : std_logic;
SIGNAL \Add1~mac_pl[0][9]\ : std_logic;
SIGNAL \r_add_st0[1][9]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[1][9]~q\ : std_logic;
SIGNAL \Add0~mac_pl[0][9]\ : std_logic;
SIGNAL \r_add_st0[0][9]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[0][9]~q\ : std_logic;
SIGNAL \Add0~mac_pl[0][8]\ : std_logic;
SIGNAL \r_add_st0[0][8]~q\ : std_logic;
SIGNAL \Add1~mac_pl[0][8]\ : std_logic;
SIGNAL \r_add_st0[1][8]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[1][8]~q\ : std_logic;
SIGNAL \Add0~mac_pl[0][7]\ : std_logic;
SIGNAL \r_add_st0[0][7]~q\ : std_logic;
SIGNAL \Add1~mac_pl[0][7]\ : std_logic;
SIGNAL \r_add_st0[1][7]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[1][7]~q\ : std_logic;
SIGNAL \Add1~mac_pl[0][6]\ : std_logic;
SIGNAL \r_add_st0[1][6]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[1][6]~q\ : std_logic;
SIGNAL \Add0~mac_pl[0][6]\ : std_logic;
SIGNAL \r_add_st0[0][6]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[0][6]~q\ : std_logic;
SIGNAL \Add1~mac_pl[0][5]\ : std_logic;
SIGNAL \r_add_st0[1][5]~q\ : std_logic;
SIGNAL \Add0~mac_pl[0][5]\ : std_logic;
SIGNAL \r_add_st0[0][5]~q\ : std_logic;
SIGNAL \Add1~mac_pl[0][4]\ : std_logic;
SIGNAL \r_add_st0[1][4]~q\ : std_logic;
SIGNAL \Add0~mac_pl[0][4]\ : std_logic;
SIGNAL \r_add_st0[0][4]~q\ : std_logic;
SIGNAL \Add1~mac_pl[0][3]\ : std_logic;
SIGNAL \r_add_st0[1][3]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[1][3]~q\ : std_logic;
SIGNAL \Add0~mac_pl[0][3]\ : std_logic;
SIGNAL \r_add_st0[0][3]~q\ : std_logic;
SIGNAL \Add1~mac_pl[0][2]\ : std_logic;
SIGNAL \r_add_st0[1][2]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[1][2]~q\ : std_logic;
SIGNAL \Add0~mac_pl[0][2]\ : std_logic;
SIGNAL \r_add_st0[0][2]~q\ : std_logic;
SIGNAL \Add1~mac_pl[0][1]\ : std_logic;
SIGNAL \r_add_st0[1][1]~q\ : std_logic;
SIGNAL \Add0~mac_pl[0][1]\ : std_logic;
SIGNAL \r_add_st0[0][1]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[0][1]~q\ : std_logic;
SIGNAL \Add0~mac_pl[0][0]\ : std_logic;
SIGNAL \r_add_st0[0][0]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[0][0]~q\ : std_logic;
SIGNAL \Add1~mac_pl[0][0]\ : std_logic;
SIGNAL \r_add_st0[1][0]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[1][0]~q\ : std_logic;
SIGNAL \Add4~62\ : std_logic;
SIGNAL \Add4~58\ : std_logic;
SIGNAL \Add4~54\ : std_logic;
SIGNAL \Add4~50\ : std_logic;
SIGNAL \Add4~46\ : std_logic;
SIGNAL \Add4~42\ : std_logic;
SIGNAL \Add4~38\ : std_logic;
SIGNAL \Add4~34\ : std_logic;
SIGNAL \Add4~30\ : std_logic;
SIGNAL \Add4~26\ : std_logic;
SIGNAL \Add4~1_sumout\ : std_logic;
SIGNAL \r_add_st1[0][10]~q\ : std_logic;
SIGNAL \Add5~25_sumout\ : std_logic;
SIGNAL \r_add_st1[1][9]~q\ : std_logic;
SIGNAL \Add4~25_sumout\ : std_logic;
SIGNAL \r_add_st1[0][9]~q\ : std_logic;
SIGNAL \Add4~29_sumout\ : std_logic;
SIGNAL \r_add_st1[0][8]~q\ : std_logic;
SIGNAL \Add5~29_sumout\ : std_logic;
SIGNAL \r_add_st1[1][8]~q\ : std_logic;
SIGNAL \Add5~33_sumout\ : std_logic;
SIGNAL \r_add_st1[1][7]~q\ : std_logic;
SIGNAL \Add4~33_sumout\ : std_logic;
SIGNAL \r_add_st1[0][7]~q\ : std_logic;
SIGNAL \Add5~37_sumout\ : std_logic;
SIGNAL \r_add_st1[1][6]~q\ : std_logic;
SIGNAL \Add4~37_sumout\ : std_logic;
SIGNAL \r_add_st1[0][6]~q\ : std_logic;
SIGNAL \Add4~41_sumout\ : std_logic;
SIGNAL \r_add_st1[0][5]~q\ : std_logic;
SIGNAL \Add5~41_sumout\ : std_logic;
SIGNAL \r_add_st1[1][5]~q\ : std_logic;
SIGNAL \Add5~45_sumout\ : std_logic;
SIGNAL \r_add_st1[1][4]~q\ : std_logic;
SIGNAL \Add4~45_sumout\ : std_logic;
SIGNAL \r_add_st1[0][4]~q\ : std_logic;
SIGNAL \Add4~49_sumout\ : std_logic;
SIGNAL \r_add_st1[0][3]~q\ : std_logic;
SIGNAL \Add5~49_sumout\ : std_logic;
SIGNAL \r_add_st1[1][3]~q\ : std_logic;
SIGNAL \Add4~53_sumout\ : std_logic;
SIGNAL \r_add_st1[0][2]~q\ : std_logic;
SIGNAL \Add5~53_sumout\ : std_logic;
SIGNAL \r_add_st1[1][2]~q\ : std_logic;
SIGNAL \Add5~57_sumout\ : std_logic;
SIGNAL \r_add_st1[1][1]~q\ : std_logic;
SIGNAL \Add4~57_sumout\ : std_logic;
SIGNAL \r_add_st1[0][1]~q\ : std_logic;
SIGNAL \Add5~61_sumout\ : std_logic;
SIGNAL \r_add_st1[1][0]~feeder_combout\ : std_logic;
SIGNAL \r_add_st1[1][0]~q\ : std_logic;
SIGNAL \Add4~61_sumout\ : std_logic;
SIGNAL \r_add_st1[0][0]~q\ : std_logic;
SIGNAL \Add6~62\ : std_logic;
SIGNAL \Add6~58\ : std_logic;
SIGNAL \Add6~54\ : std_logic;
SIGNAL \Add6~50\ : std_logic;
SIGNAL \Add6~46\ : std_logic;
SIGNAL \Add6~42\ : std_logic;
SIGNAL \Add6~38\ : std_logic;
SIGNAL \Add6~34\ : std_logic;
SIGNAL \Add6~30\ : std_logic;
SIGNAL \Add6~26\ : std_logic;
SIGNAL \Add6~1_sumout\ : std_logic;
SIGNAL \p_data[7][0]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[6][1]~_Duplicate_1DUPLICATE_q\ : std_logic;
SIGNAL \p_data[7][1]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[7][2]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[7][3]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[7][4]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[6][5]~_Duplicate_1_q\ : std_logic;
SIGNAL \p_data[7][5]~_Duplicate_1_q\ : std_logic;
SIGNAL \r_mult[8][10]\ : std_logic;
SIGNAL \Add6~25_sumout\ : std_logic;
SIGNAL \r_mult[8][9]\ : std_logic;
SIGNAL \Add6~29_sumout\ : std_logic;
SIGNAL \r_mult[8][8]\ : std_logic;
SIGNAL \Add6~33_sumout\ : std_logic;
SIGNAL \r_mult[8][7]\ : std_logic;
SIGNAL \Add6~37_sumout\ : std_logic;
SIGNAL \r_mult[8][6]\ : std_logic;
SIGNAL \r_mult[8][5]\ : std_logic;
SIGNAL \Add6~41_sumout\ : std_logic;
SIGNAL \r_mult[8][4]\ : std_logic;
SIGNAL \Add6~45_sumout\ : std_logic;
SIGNAL \r_mult[8][3]\ : std_logic;
SIGNAL \Add6~49_sumout\ : std_logic;
SIGNAL \Add6~53_sumout\ : std_logic;
SIGNAL \r_mult[8][2]\ : std_logic;
SIGNAL \Add6~57_sumout\ : std_logic;
SIGNAL \r_mult[8][1]\ : std_logic;
SIGNAL \Add6~61_sumout\ : std_logic;
SIGNAL \r_mult[8][0]\ : std_logic;
SIGNAL \Add7~62_cout\ : std_logic;
SIGNAL \Add7~58_cout\ : std_logic;
SIGNAL \Add7~54_cout\ : std_logic;
SIGNAL \Add7~50_cout\ : std_logic;
SIGNAL \Add7~46_cout\ : std_logic;
SIGNAL \Add7~42_cout\ : std_logic;
SIGNAL \Add7~38_cout\ : std_logic;
SIGNAL \Add7~34_cout\ : std_logic;
SIGNAL \Add7~30_cout\ : std_logic;
SIGNAL \Add7~26_cout\ : std_logic;
SIGNAL \Add7~1_sumout\ : std_logic;
SIGNAL \o_data[0]~reg0feeder_combout\ : std_logic;
SIGNAL \o_data[0]~reg0_q\ : std_logic;
SIGNAL \Add1~mac_pl[0][11]\ : std_logic;
SIGNAL \r_add_st0[1][11]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[1][11]~q\ : std_logic;
SIGNAL \Add0~mac_pl[0][11]\ : std_logic;
SIGNAL \r_add_st0[0][11]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[0][11]~q\ : std_logic;
SIGNAL \Add4~2\ : std_logic;
SIGNAL \Add4~5_sumout\ : std_logic;
SIGNAL \r_add_st1[0][11]~q\ : std_logic;
SIGNAL \Add2~mac_pl[0][11]\ : std_logic;
SIGNAL \r_add_st0[2][11]~q\ : std_logic;
SIGNAL \Add3~mac_pl[0][11]\ : std_logic;
SIGNAL \r_add_st0[3][11]~q\ : std_logic;
SIGNAL \Add5~2\ : std_logic;
SIGNAL \Add5~5_sumout\ : std_logic;
SIGNAL \r_add_st1[1][11]~q\ : std_logic;
SIGNAL \Add6~2\ : std_logic;
SIGNAL \Add6~5_sumout\ : std_logic;
SIGNAL \r_mult[8][11]\ : std_logic;
SIGNAL \Add7~2\ : std_logic;
SIGNAL \Add7~5_sumout\ : std_logic;
SIGNAL \o_data[1]~reg0_q\ : std_logic;
SIGNAL \Add2~mac_pl[0][12]\ : std_logic;
SIGNAL \r_add_st0[2][12]~q\ : std_logic;
SIGNAL \Add3~mac_pl[0][12]\ : std_logic;
SIGNAL \r_add_st0[3][12]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[3][12]~q\ : std_logic;
SIGNAL \Add5~6\ : std_logic;
SIGNAL \Add5~9_sumout\ : std_logic;
SIGNAL \r_add_st1[1][12]~q\ : std_logic;
SIGNAL \Add0~mac_pl[0][12]\ : std_logic;
SIGNAL \r_add_st0[0][12]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[0][12]~q\ : std_logic;
SIGNAL \Add1~mac_pl[0][12]\ : std_logic;
SIGNAL \r_add_st0[1][12]~q\ : std_logic;
SIGNAL \Add4~6\ : std_logic;
SIGNAL \Add4~9_sumout\ : std_logic;
SIGNAL \r_add_st1[0][12]~q\ : std_logic;
SIGNAL \Add6~6\ : std_logic;
SIGNAL \Add6~9_sumout\ : std_logic;
SIGNAL \r_mult[8][12]\ : std_logic;
SIGNAL \Add7~6\ : std_logic;
SIGNAL \Add7~9_sumout\ : std_logic;
SIGNAL \o_data[2]~reg0feeder_combout\ : std_logic;
SIGNAL \o_data[2]~reg0_q\ : std_logic;
SIGNAL \Add1~mac_pl[0][13]\ : std_logic;
SIGNAL \r_add_st0[1][13]~q\ : std_logic;
SIGNAL \Add0~mac_pl[0][13]\ : std_logic;
SIGNAL \r_add_st0[0][13]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[0][13]~q\ : std_logic;
SIGNAL \Add4~10\ : std_logic;
SIGNAL \Add4~13_sumout\ : std_logic;
SIGNAL \r_add_st1[0][13]~q\ : std_logic;
SIGNAL \Add3~mac_pl[0][13]\ : std_logic;
SIGNAL \r_add_st0[3][13]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[3][13]~q\ : std_logic;
SIGNAL \Add2~mac_pl[0][13]\ : std_logic;
SIGNAL \r_add_st0[2][13]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[2][13]~q\ : std_logic;
SIGNAL \Add5~10\ : std_logic;
SIGNAL \Add5~13_sumout\ : std_logic;
SIGNAL \r_add_st1[1][13]~q\ : std_logic;
SIGNAL \Add6~10\ : std_logic;
SIGNAL \Add6~13_sumout\ : std_logic;
SIGNAL \r_mult[8][13]\ : std_logic;
SIGNAL \Add7~10\ : std_logic;
SIGNAL \Add7~13_sumout\ : std_logic;
SIGNAL \o_data[3]~reg0feeder_combout\ : std_logic;
SIGNAL \o_data[3]~reg0_q\ : std_logic;
SIGNAL \Add1~mac_pl[0][14]\ : std_logic;
SIGNAL \r_add_st0[1][14]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[1][14]~q\ : std_logic;
SIGNAL \Add0~mac_pl[0][14]\ : std_logic;
SIGNAL \r_add_st0[0][14]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[0][14]~q\ : std_logic;
SIGNAL \Add4~14\ : std_logic;
SIGNAL \Add4~17_sumout\ : std_logic;
SIGNAL \r_add_st1[0][14]~q\ : std_logic;
SIGNAL \Add2~mac_pl[0][14]\ : std_logic;
SIGNAL \r_add_st0[2][14]~feeder_combout\ : std_logic;
SIGNAL \r_add_st0[2][14]~q\ : std_logic;
SIGNAL \Add3~mac_pl[0][14]\ : std_logic;
SIGNAL \r_add_st0[3][14]~q\ : std_logic;
SIGNAL \Add5~14\ : std_logic;
SIGNAL \Add5~17_sumout\ : std_logic;
SIGNAL \r_add_st1[1][14]~q\ : std_logic;
SIGNAL \Add6~14\ : std_logic;
SIGNAL \Add6~17_sumout\ : std_logic;
SIGNAL \Add7~14\ : std_logic;
SIGNAL \Add7~17_sumout\ : std_logic;
SIGNAL \o_data[4]~reg0_q\ : std_logic;
SIGNAL \Add4~18\ : std_logic;
SIGNAL \Add4~21_sumout\ : std_logic;
SIGNAL \r_add_st1[0][15]~q\ : std_logic;
SIGNAL \Add5~18\ : std_logic;
SIGNAL \Add5~21_sumout\ : std_logic;
SIGNAL \r_add_st1[1][15]~q\ : std_logic;
SIGNAL \Add6~18\ : std_logic;
SIGNAL \Add6~21_sumout\ : std_logic;
SIGNAL \Add7~18\ : std_logic;
SIGNAL \Add7~21_sumout\ : std_logic;
SIGNAL \o_data[5]~reg0_q\ : std_logic;
SIGNAL r_add_st3 : std_logic_vector(17 DOWNTO 0);
SIGNAL r_add_st2 : std_logic_vector(16 DOWNTO 0);
SIGNAL \ALT_INV_r_mult[8][13]\ : std_logic;
SIGNAL \ALT_INV_r_mult[8][12]\ : std_logic;
SIGNAL \ALT_INV_r_mult[8][11]\ : std_logic;
SIGNAL \ALT_INV_r_mult[8][10]\ : std_logic;
SIGNAL \ALT_INV_r_mult[8][9]\ : std_logic;
SIGNAL \ALT_INV_r_mult[8][8]\ : std_logic;
SIGNAL \ALT_INV_r_mult[8][7]\ : std_logic;
SIGNAL \ALT_INV_r_mult[8][6]\ : std_logic;
SIGNAL \ALT_INV_r_mult[8][5]\ : std_logic;
SIGNAL \ALT_INV_r_mult[8][4]\ : std_logic;
SIGNAL \ALT_INV_r_mult[8][3]\ : std_logic;
SIGNAL \ALT_INV_r_mult[8][2]\ : std_logic;
SIGNAL \ALT_INV_r_mult[8][1]\ : std_logic;
SIGNAL \ALT_INV_r_mult[8][0]\ : std_logic;
SIGNAL \ALT_INV_Add2~mac_pl[0][14]\ : std_logic;
SIGNAL \ALT_INV_Add2~mac_pl[0][13]\ : std_logic;
SIGNAL \ALT_INV_Add2~mac_pl[0][10]\ : std_logic;
SIGNAL \ALT_INV_Add2~mac_pl[0][9]\ : std_logic;
SIGNAL \ALT_INV_Add2~mac_pl[0][7]\ : std_logic;
SIGNAL \ALT_INV_Add2~mac_pl[0][6]\ : std_logic;
SIGNAL \ALT_INV_Add2~mac_pl[0][5]\ : std_logic;
SIGNAL \ALT_INV_Add2~mac_pl[0][4]\ : std_logic;
SIGNAL \ALT_INV_Add2~mac_pl[0][2]\ : std_logic;
SIGNAL \ALT_INV_Add2~mac_pl[0][1]\ : std_logic;
SIGNAL \ALT_INV_Add2~mac_pl[0][0]\ : std_logic;
SIGNAL \ALT_INV_Add3~mac_pl[0][13]\ : std_logic;
SIGNAL \ALT_INV_Add3~mac_pl[0][12]\ : std_logic;
SIGNAL \ALT_INV_Add3~mac_pl[0][10]\ : std_logic;
SIGNAL \ALT_INV_Add3~mac_pl[0][9]\ : std_logic;
SIGNAL \ALT_INV_Add3~mac_pl[0][7]\ : std_logic;
SIGNAL \ALT_INV_Add3~mac_pl[0][6]\ : std_logic;
SIGNAL \ALT_INV_Add3~mac_pl[0][4]\ : std_logic;
SIGNAL \ALT_INV_Add3~mac_pl[0][3]\ : std_logic;
SIGNAL \ALT_INV_Add3~mac_pl[0][2]\ : std_logic;
SIGNAL \ALT_INV_Add3~mac_pl[0][1]\ : std_logic;
SIGNAL \ALT_INV_Add3~mac_pl[0][0]\ : std_logic;
SIGNAL \ALT_INV_Add0~mac_pl[0][14]\ : std_logic;
SIGNAL \ALT_INV_Add0~mac_pl[0][13]\ : std_logic;
SIGNAL \ALT_INV_Add0~mac_pl[0][12]\ : std_logic;
SIGNAL \ALT_INV_Add0~mac_pl[0][11]\ : std_logic;
SIGNAL \ALT_INV_Add0~mac_pl[0][9]\ : std_logic;
SIGNAL \ALT_INV_Add0~mac_pl[0][6]\ : std_logic;
SIGNAL \ALT_INV_Add0~mac_pl[0][1]\ : std_logic;
SIGNAL \ALT_INV_Add0~mac_pl[0][0]\ : std_logic;
SIGNAL \ALT_INV_Add1~mac_pl[0][14]\ : std_logic;
SIGNAL \ALT_INV_Add1~mac_pl[0][11]\ : std_logic;
SIGNAL \ALT_INV_Add1~mac_pl[0][10]\ : std_logic;
SIGNAL \ALT_INV_Add1~mac_pl[0][9]\ : std_logic;
SIGNAL \ALT_INV_Add1~mac_pl[0][8]\ : std_logic;
SIGNAL \ALT_INV_Add1~mac_pl[0][7]\ : std_logic;
SIGNAL \ALT_INV_Add1~mac_pl[0][6]\ : std_logic;
SIGNAL \ALT_INV_Add1~mac_pl[0][3]\ : std_logic;
SIGNAL \ALT_INV_Add1~mac_pl[0][2]\ : std_logic;
SIGNAL \ALT_INV_Add1~mac_pl[0][0]\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[0][13]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[1][13]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[2][13]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[3][13]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[0][12]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[1][12]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[2][12]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[3][12]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[0][11]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[1][11]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[2][11]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[3][11]~q\ : std_logic;
SIGNAL ALT_INV_r_add_st2 : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_r_add_st1[0][8]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[1][8]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[0][10]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[1][10]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[2][10]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[3][10]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[0][9]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[1][9]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[0][15]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[1][15]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[0][14]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[1][14]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[0][13]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[1][13]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[0][12]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[1][12]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[0][11]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[1][11]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[0][10]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[1][10]~q\ : std_logic;
SIGNAL ALT_INV_r_add_st3 : std_logic_vector(13 DOWNTO 10);
SIGNAL \ALT_INV_Add5~61_sumout\ : std_logic;
SIGNAL \ALT_INV_i_rstb~inputCLKENA0_outclk\ : std_logic;
SIGNAL \ALT_INV_i_data[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_data[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_data[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[0][0]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[1][0]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[2][0]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[3][0]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[0][1]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[1][1]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[2][1]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[3][1]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[0][0]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[1][0]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[0][2]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[1][2]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[2][2]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[3][2]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[0][1]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[1][1]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[0][3]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[1][3]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[2][3]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[3][3]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[0][2]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[1][2]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[0][4]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[1][4]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[2][4]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[3][4]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[0][3]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[1][3]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[0][5]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[1][5]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[2][5]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[3][5]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[0][4]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[1][4]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[0][6]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[1][6]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[2][6]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[3][6]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[0][5]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[1][5]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[0][7]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[1][7]~q\ : std_logic;
SIGNAL \ALT_INV_p_data[0][5]~_Duplicate_1_q\ : std_logic;
SIGNAL \ALT_INV_p_data[0][2]~_Duplicate_1_q\ : std_logic;
SIGNAL \ALT_INV_p_data[1][4]~_Duplicate_1_q\ : std_logic;
SIGNAL \ALT_INV_p_data[1][3]~_Duplicate_1_q\ : std_logic;
SIGNAL \ALT_INV_p_data[2][5]~_Duplicate_1_q\ : std_logic;
SIGNAL \ALT_INV_p_data[2][4]~_Duplicate_1_q\ : std_logic;
SIGNAL \ALT_INV_p_data[2][2]~_Duplicate_1_q\ : std_logic;
SIGNAL \ALT_INV_p_data[2][0]~_Duplicate_1_q\ : std_logic;
SIGNAL \ALT_INV_p_data[3][5]~_Duplicate_1_q\ : std_logic;
SIGNAL \ALT_INV_p_data[3][4]~_Duplicate_1_q\ : std_logic;
SIGNAL \ALT_INV_p_data[3][2]~_Duplicate_1_q\ : std_logic;
SIGNAL \ALT_INV_p_data[3][1]~_Duplicate_1_q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[2][7]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[3][7]~q\ : std_logic;
SIGNAL \ALT_INV_p_data[4][5]~_Duplicate_1_q\ : std_logic;
SIGNAL \ALT_INV_p_data[4][2]~_Duplicate_1_q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[0][6]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[1][6]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[0][8]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[1][8]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[2][8]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[3][8]~q\ : std_logic;
SIGNAL \ALT_INV_p_data[5][4]~_Duplicate_1_q\ : std_logic;
SIGNAL \ALT_INV_p_data[5][3]~_Duplicate_1_q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[0][7]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st1[1][7]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[0][9]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[1][9]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[2][9]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[3][9]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[0][14]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[1][14]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[2][14]~q\ : std_logic;
SIGNAL \ALT_INV_r_add_st0[3][14]~q\ : std_logic;
SIGNAL \ALT_INV_p_data[4][1]~_Duplicate_1DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_p_data[5][5]~_Duplicate_1DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_p_data[5][0]~_Duplicate_1DUPLICATE_q\ : std_logic;

BEGIN

ww_i_clk <= i_clk;
ww_i_rstb <= i_rstb;
ww_i_data <= i_data;
o_data <= ww_o_data;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Mult8~8_ACLR_bus\ <= (NOT \i_rstb~inputCLKENA0_outclk\ & NOT \i_rstb~inputCLKENA0_outclk\);

\Mult8~8_CLK_bus\ <= (gnd & gnd & \i_clk~inputCLKENA0_outclk\);

\Mult8~8_ENA_bus\ <= (vcc & vcc & vcc);

\Mult8~8_AX_bus\ <= (gnd & gnd & vcc & gnd & gnd & vcc & vcc);

\Mult8~8_AY_bus\ <= (\p_data[7][5]~_Duplicate_1_q\ & \p_data[7][4]~_Duplicate_1_q\ & \p_data[7][3]~_Duplicate_1_q\ & \p_data[7][2]~_Duplicate_1_q\ & \p_data[7][1]~_Duplicate_1_q\ & \p_data[7][0]~_Duplicate_1_q\);

\r_mult[8][0]\ <= \Mult8~8_RESULTA_bus\(0);
\r_mult[8][1]\ <= \Mult8~8_RESULTA_bus\(1);
\r_mult[8][2]\ <= \Mult8~8_RESULTA_bus\(2);
\r_mult[8][3]\ <= \Mult8~8_RESULTA_bus\(3);
\r_mult[8][4]\ <= \Mult8~8_RESULTA_bus\(4);
\r_mult[8][5]\ <= \Mult8~8_RESULTA_bus\(5);
\r_mult[8][6]\ <= \Mult8~8_RESULTA_bus\(6);
\r_mult[8][7]\ <= \Mult8~8_RESULTA_bus\(7);
\r_mult[8][8]\ <= \Mult8~8_RESULTA_bus\(8);
\r_mult[8][9]\ <= \Mult8~8_RESULTA_bus\(9);
\r_mult[8][10]\ <= \Mult8~8_RESULTA_bus\(10);
\r_mult[8][11]\ <= \Mult8~8_RESULTA_bus\(11);
\r_mult[8][12]\ <= \Mult8~8_RESULTA_bus\(12);
\r_mult[8][13]\ <= \Mult8~8_RESULTA_bus\(13);
\Mult8~22\ <= \Mult8~8_RESULTA_bus\(14);
\Mult8~23\ <= \Mult8~8_RESULTA_bus\(15);
\Mult8~24\ <= \Mult8~8_RESULTA_bus\(16);
\Mult8~25\ <= \Mult8~8_RESULTA_bus\(17);
\Mult8~26\ <= \Mult8~8_RESULTA_bus\(18);
\Mult8~27\ <= \Mult8~8_RESULTA_bus\(19);
\Mult8~28\ <= \Mult8~8_RESULTA_bus\(20);
\Mult8~29\ <= \Mult8~8_RESULTA_bus\(21);
\Mult8~30\ <= \Mult8~8_RESULTA_bus\(22);
\Mult8~31\ <= \Mult8~8_RESULTA_bus\(23);
\Mult8~32\ <= \Mult8~8_RESULTA_bus\(24);
\Mult8~33\ <= \Mult8~8_RESULTA_bus\(25);
\Mult8~34\ <= \Mult8~8_RESULTA_bus\(26);
\Mult8~35\ <= \Mult8~8_RESULTA_bus\(27);
\Mult8~36\ <= \Mult8~8_RESULTA_bus\(28);
\Mult8~37\ <= \Mult8~8_RESULTA_bus\(29);
\Mult8~38\ <= \Mult8~8_RESULTA_bus\(30);
\Mult8~39\ <= \Mult8~8_RESULTA_bus\(31);
\Mult8~40\ <= \Mult8~8_RESULTA_bus\(32);
\Mult8~41\ <= \Mult8~8_RESULTA_bus\(33);
\Mult8~42\ <= \Mult8~8_RESULTA_bus\(34);
\Mult8~43\ <= \Mult8~8_RESULTA_bus\(35);
\Mult8~44\ <= \Mult8~8_RESULTA_bus\(36);
\Mult8~45\ <= \Mult8~8_RESULTA_bus\(37);
\Mult8~46\ <= \Mult8~8_RESULTA_bus\(38);
\Mult8~47\ <= \Mult8~8_RESULTA_bus\(39);
\Mult8~48\ <= \Mult8~8_RESULTA_bus\(40);
\Mult8~49\ <= \Mult8~8_RESULTA_bus\(41);
\Mult8~50\ <= \Mult8~8_RESULTA_bus\(42);
\Mult8~51\ <= \Mult8~8_RESULTA_bus\(43);
\Mult8~52\ <= \Mult8~8_RESULTA_bus\(44);
\Mult8~53\ <= \Mult8~8_RESULTA_bus\(45);
\Mult8~54\ <= \Mult8~8_RESULTA_bus\(46);
\Mult8~55\ <= \Mult8~8_RESULTA_bus\(47);
\Mult8~56\ <= \Mult8~8_RESULTA_bus\(48);
\Mult8~57\ <= \Mult8~8_RESULTA_bus\(49);
\Mult8~58\ <= \Mult8~8_RESULTA_bus\(50);
\Mult8~59\ <= \Mult8~8_RESULTA_bus\(51);
\Mult8~60\ <= \Mult8~8_RESULTA_bus\(52);
\Mult8~61\ <= \Mult8~8_RESULTA_bus\(53);
\Mult8~62\ <= \Mult8~8_RESULTA_bus\(54);
\Mult8~63\ <= \Mult8~8_RESULTA_bus\(55);
\Mult8~64\ <= \Mult8~8_RESULTA_bus\(56);
\Mult8~65\ <= \Mult8~8_RESULTA_bus\(57);
\Mult8~66\ <= \Mult8~8_RESULTA_bus\(58);
\Mult8~67\ <= \Mult8~8_RESULTA_bus\(59);
\Mult8~68\ <= \Mult8~8_RESULTA_bus\(60);
\Mult8~69\ <= \Mult8~8_RESULTA_bus\(61);
\Mult8~70\ <= \Mult8~8_RESULTA_bus\(62);
\Mult8~71\ <= \Mult8~8_RESULTA_bus\(63);

\Add3~8_ACLR_bus\ <= (NOT \i_rstb~inputCLKENA0_outclk\ & NOT \i_rstb~inputCLKENA0_outclk\);

\Add3~8_CLK_bus\ <= (gnd & gnd & \i_clk~inputCLKENA0_outclk\);

\Add3~8_ENA_bus\ <= (vcc & vcc & vcc);

\Add3~8_AX_bus\ <= (\p_data[6][5]~_Duplicate_1DUPLICATE_q\ & \p_data[6][4]~_Duplicate_1_q\ & \p_data[6][3]~_Duplicate_1_q\ & \p_data[6][2]~_Duplicate_1_q\ & \p_data[6][1]~_Duplicate_1_q\ & \p_data[6][0]~_Duplicate_1_q\);

\Add3~8_AY_bus\ <= (gnd & vcc & vcc & gnd & gnd & vcc & gnd);

\Add3~8_BX_bus\ <= (\p_data[5][5]~_Duplicate_1_q\ & \p_data[5][4]~_Duplicate_1DUPLICATE_q\ & \p_data[5][3]~_Duplicate_1_q\ & \p_data[5][2]~_Duplicate_1DUPLICATE_q\ & \p_data[5][1]~_Duplicate_1_q\ & \p_data[5][0]~_Duplicate_1_q\);

\Add3~8_BY_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & gnd);

\Add3~mac_pl[0][0]\ <= \Add3~8_RESULTA_bus\(0);
\Add3~mac_pl[0][1]\ <= \Add3~8_RESULTA_bus\(1);
\Add3~mac_pl[0][2]\ <= \Add3~8_RESULTA_bus\(2);
\Add3~mac_pl[0][3]\ <= \Add3~8_RESULTA_bus\(3);
\Add3~mac_pl[0][4]\ <= \Add3~8_RESULTA_bus\(4);
\Add3~mac_pl[0][5]\ <= \Add3~8_RESULTA_bus\(5);
\Add3~mac_pl[0][6]\ <= \Add3~8_RESULTA_bus\(6);
\Add3~mac_pl[0][7]\ <= \Add3~8_RESULTA_bus\(7);
\Add3~mac_pl[0][8]\ <= \Add3~8_RESULTA_bus\(8);
\Add3~mac_pl[0][9]\ <= \Add3~8_RESULTA_bus\(9);
\Add3~mac_pl[0][10]\ <= \Add3~8_RESULTA_bus\(10);
\Add3~mac_pl[0][11]\ <= \Add3~8_RESULTA_bus\(11);
\Add3~mac_pl[0][12]\ <= \Add3~8_RESULTA_bus\(12);
\Add3~mac_pl[0][13]\ <= \Add3~8_RESULTA_bus\(13);
\Add3~mac_pl[0][14]\ <= \Add3~8_RESULTA_bus\(14);
\Add3~23\ <= \Add3~8_RESULTA_bus\(15);
\Add3~24\ <= \Add3~8_RESULTA_bus\(16);
\Add3~25\ <= \Add3~8_RESULTA_bus\(17);
\Add3~26\ <= \Add3~8_RESULTA_bus\(18);
\Add3~27\ <= \Add3~8_RESULTA_bus\(19);
\Add3~28\ <= \Add3~8_RESULTA_bus\(20);
\Add3~29\ <= \Add3~8_RESULTA_bus\(21);
\Add3~30\ <= \Add3~8_RESULTA_bus\(22);
\Add3~31\ <= \Add3~8_RESULTA_bus\(23);
\Add3~32\ <= \Add3~8_RESULTA_bus\(24);
\Add3~33\ <= \Add3~8_RESULTA_bus\(25);
\Add3~34\ <= \Add3~8_RESULTA_bus\(26);
\Add3~35\ <= \Add3~8_RESULTA_bus\(27);
\Add3~36\ <= \Add3~8_RESULTA_bus\(28);
\Add3~37\ <= \Add3~8_RESULTA_bus\(29);
\Add3~38\ <= \Add3~8_RESULTA_bus\(30);
\Add3~39\ <= \Add3~8_RESULTA_bus\(31);
\Add3~40\ <= \Add3~8_RESULTA_bus\(32);
\Add3~41\ <= \Add3~8_RESULTA_bus\(33);
\Add3~42\ <= \Add3~8_RESULTA_bus\(34);
\Add3~43\ <= \Add3~8_RESULTA_bus\(35);
\Add3~44\ <= \Add3~8_RESULTA_bus\(36);
\Add3~45\ <= \Add3~8_RESULTA_bus\(37);
\Add3~46\ <= \Add3~8_RESULTA_bus\(38);
\Add3~47\ <= \Add3~8_RESULTA_bus\(39);
\Add3~48\ <= \Add3~8_RESULTA_bus\(40);
\Add3~49\ <= \Add3~8_RESULTA_bus\(41);
\Add3~50\ <= \Add3~8_RESULTA_bus\(42);
\Add3~51\ <= \Add3~8_RESULTA_bus\(43);
\Add3~52\ <= \Add3~8_RESULTA_bus\(44);
\Add3~53\ <= \Add3~8_RESULTA_bus\(45);
\Add3~54\ <= \Add3~8_RESULTA_bus\(46);
\Add3~55\ <= \Add3~8_RESULTA_bus\(47);
\Add3~56\ <= \Add3~8_RESULTA_bus\(48);
\Add3~57\ <= \Add3~8_RESULTA_bus\(49);
\Add3~58\ <= \Add3~8_RESULTA_bus\(50);
\Add3~59\ <= \Add3~8_RESULTA_bus\(51);
\Add3~60\ <= \Add3~8_RESULTA_bus\(52);
\Add3~61\ <= \Add3~8_RESULTA_bus\(53);
\Add3~62\ <= \Add3~8_RESULTA_bus\(54);
\Add3~63\ <= \Add3~8_RESULTA_bus\(55);
\Add3~64\ <= \Add3~8_RESULTA_bus\(56);
\Add3~65\ <= \Add3~8_RESULTA_bus\(57);
\Add3~66\ <= \Add3~8_RESULTA_bus\(58);
\Add3~67\ <= \Add3~8_RESULTA_bus\(59);
\Add3~68\ <= \Add3~8_RESULTA_bus\(60);
\Add3~69\ <= \Add3~8_RESULTA_bus\(61);
\Add3~70\ <= \Add3~8_RESULTA_bus\(62);
\Add3~71\ <= \Add3~8_RESULTA_bus\(63);

\Add2~8_ACLR_bus\ <= (NOT \i_rstb~inputCLKENA0_outclk\ & NOT \i_rstb~inputCLKENA0_outclk\);

\Add2~8_CLK_bus\ <= (gnd & gnd & \i_clk~inputCLKENA0_outclk\);

\Add2~8_ENA_bus\ <= (vcc & vcc & vcc);

\Add2~8_AX_bus\ <= (\p_data[4][5]~_Duplicate_1_q\ & \p_data[4][4]~_Duplicate_1_q\ & \p_data[4][3]~_Duplicate_1_q\ & \p_data[4][2]~_Duplicate_1DUPLICATE_q\ & \p_data[4][1]~_Duplicate_1_q\ & \p_data[4][0]~_Duplicate_1DUPLICATE_q\);

\Add2~8_AY_bus\ <= (vcc & vcc & gnd & gnd & vcc & gnd & gnd & vcc);

\Add2~8_BX_bus\ <= (\p_data[3][5]~_Duplicate_1_q\ & \p_data[3][4]~_Duplicate_1_q\ & \p_data[3][3]~_Duplicate_1_q\ & \p_data[3][2]~_Duplicate_1_q\ & \p_data[3][1]~_Duplicate_1_q\ & \p_data[3][0]~_Duplicate_1DUPLICATE_q\);

\Add2~8_BY_bus\ <= (vcc & vcc & vcc & gnd & vcc & gnd & gnd & vcc);

\Add2~mac_pl[0][0]\ <= \Add2~8_RESULTA_bus\(0);
\Add2~mac_pl[0][1]\ <= \Add2~8_RESULTA_bus\(1);
\Add2~mac_pl[0][2]\ <= \Add2~8_RESULTA_bus\(2);
\Add2~mac_pl[0][3]\ <= \Add2~8_RESULTA_bus\(3);
\Add2~mac_pl[0][4]\ <= \Add2~8_RESULTA_bus\(4);
\Add2~mac_pl[0][5]\ <= \Add2~8_RESULTA_bus\(5);
\Add2~mac_pl[0][6]\ <= \Add2~8_RESULTA_bus\(6);
\Add2~mac_pl[0][7]\ <= \Add2~8_RESULTA_bus\(7);
\Add2~mac_pl[0][8]\ <= \Add2~8_RESULTA_bus\(8);
\Add2~mac_pl[0][9]\ <= \Add2~8_RESULTA_bus\(9);
\Add2~mac_pl[0][10]\ <= \Add2~8_RESULTA_bus\(10);
\Add2~mac_pl[0][11]\ <= \Add2~8_RESULTA_bus\(11);
\Add2~mac_pl[0][12]\ <= \Add2~8_RESULTA_bus\(12);
\Add2~mac_pl[0][13]\ <= \Add2~8_RESULTA_bus\(13);
\Add2~mac_pl[0][14]\ <= \Add2~8_RESULTA_bus\(14);
\Add2~23\ <= \Add2~8_RESULTA_bus\(15);
\Add2~24\ <= \Add2~8_RESULTA_bus\(16);
\Add2~25\ <= \Add2~8_RESULTA_bus\(17);
\Add2~26\ <= \Add2~8_RESULTA_bus\(18);
\Add2~27\ <= \Add2~8_RESULTA_bus\(19);
\Add2~28\ <= \Add2~8_RESULTA_bus\(20);
\Add2~29\ <= \Add2~8_RESULTA_bus\(21);
\Add2~30\ <= \Add2~8_RESULTA_bus\(22);
\Add2~31\ <= \Add2~8_RESULTA_bus\(23);
\Add2~32\ <= \Add2~8_RESULTA_bus\(24);
\Add2~33\ <= \Add2~8_RESULTA_bus\(25);
\Add2~34\ <= \Add2~8_RESULTA_bus\(26);
\Add2~35\ <= \Add2~8_RESULTA_bus\(27);
\Add2~36\ <= \Add2~8_RESULTA_bus\(28);
\Add2~37\ <= \Add2~8_RESULTA_bus\(29);
\Add2~38\ <= \Add2~8_RESULTA_bus\(30);
\Add2~39\ <= \Add2~8_RESULTA_bus\(31);
\Add2~40\ <= \Add2~8_RESULTA_bus\(32);
\Add2~41\ <= \Add2~8_RESULTA_bus\(33);
\Add2~42\ <= \Add2~8_RESULTA_bus\(34);
\Add2~43\ <= \Add2~8_RESULTA_bus\(35);
\Add2~44\ <= \Add2~8_RESULTA_bus\(36);
\Add2~45\ <= \Add2~8_RESULTA_bus\(37);
\Add2~46\ <= \Add2~8_RESULTA_bus\(38);
\Add2~47\ <= \Add2~8_RESULTA_bus\(39);
\Add2~48\ <= \Add2~8_RESULTA_bus\(40);
\Add2~49\ <= \Add2~8_RESULTA_bus\(41);
\Add2~50\ <= \Add2~8_RESULTA_bus\(42);
\Add2~51\ <= \Add2~8_RESULTA_bus\(43);
\Add2~52\ <= \Add2~8_RESULTA_bus\(44);
\Add2~53\ <= \Add2~8_RESULTA_bus\(45);
\Add2~54\ <= \Add2~8_RESULTA_bus\(46);
\Add2~55\ <= \Add2~8_RESULTA_bus\(47);
\Add2~56\ <= \Add2~8_RESULTA_bus\(48);
\Add2~57\ <= \Add2~8_RESULTA_bus\(49);
\Add2~58\ <= \Add2~8_RESULTA_bus\(50);
\Add2~59\ <= \Add2~8_RESULTA_bus\(51);
\Add2~60\ <= \Add2~8_RESULTA_bus\(52);
\Add2~61\ <= \Add2~8_RESULTA_bus\(53);
\Add2~62\ <= \Add2~8_RESULTA_bus\(54);
\Add2~63\ <= \Add2~8_RESULTA_bus\(55);
\Add2~64\ <= \Add2~8_RESULTA_bus\(56);
\Add2~65\ <= \Add2~8_RESULTA_bus\(57);
\Add2~66\ <= \Add2~8_RESULTA_bus\(58);
\Add2~67\ <= \Add2~8_RESULTA_bus\(59);
\Add2~68\ <= \Add2~8_RESULTA_bus\(60);
\Add2~69\ <= \Add2~8_RESULTA_bus\(61);
\Add2~70\ <= \Add2~8_RESULTA_bus\(62);
\Add2~71\ <= \Add2~8_RESULTA_bus\(63);

\Add1~8_ACLR_bus\ <= (NOT \i_rstb~inputCLKENA0_outclk\ & NOT \i_rstb~inputCLKENA0_outclk\);

\Add1~8_CLK_bus\ <= (gnd & gnd & \i_clk~inputCLKENA0_outclk\);

\Add1~8_ENA_bus\ <= (vcc & vcc & vcc);

\Add1~8_AX_bus\ <= (\p_data[2][5]~_Duplicate_1_q\ & \p_data[2][4]~_Duplicate_1_q\ & \p_data[2][3]~_Duplicate_1DUPLICATE_q\ & \p_data[2][2]~_Duplicate_1_q\ & \p_data[2][1]~_Duplicate_1_q\ & \p_data[2][0]~_Duplicate_1_q\);

\Add1~8_AY_bus\ <= (vcc & vcc & gnd & gnd & vcc & gnd & gnd & vcc);

\Add1~8_BX_bus\ <= (\p_data[1][5]~_Duplicate_1_q\ & \p_data[1][4]~_Duplicate_1_q\ & \p_data[1][3]~_Duplicate_1_q\ & \p_data[1][2]~_Duplicate_1_q\ & \p_data[1][1]~_Duplicate_1_q\ & \p_data[1][0]~_Duplicate_1_q\);

\Add1~8_BY_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & gnd);

\Add1~mac_pl[0][0]\ <= \Add1~8_RESULTA_bus\(0);
\Add1~mac_pl[0][1]\ <= \Add1~8_RESULTA_bus\(1);
\Add1~mac_pl[0][2]\ <= \Add1~8_RESULTA_bus\(2);
\Add1~mac_pl[0][3]\ <= \Add1~8_RESULTA_bus\(3);
\Add1~mac_pl[0][4]\ <= \Add1~8_RESULTA_bus\(4);
\Add1~mac_pl[0][5]\ <= \Add1~8_RESULTA_bus\(5);
\Add1~mac_pl[0][6]\ <= \Add1~8_RESULTA_bus\(6);
\Add1~mac_pl[0][7]\ <= \Add1~8_RESULTA_bus\(7);
\Add1~mac_pl[0][8]\ <= \Add1~8_RESULTA_bus\(8);
\Add1~mac_pl[0][9]\ <= \Add1~8_RESULTA_bus\(9);
\Add1~mac_pl[0][10]\ <= \Add1~8_RESULTA_bus\(10);
\Add1~mac_pl[0][11]\ <= \Add1~8_RESULTA_bus\(11);
\Add1~mac_pl[0][12]\ <= \Add1~8_RESULTA_bus\(12);
\Add1~mac_pl[0][13]\ <= \Add1~8_RESULTA_bus\(13);
\Add1~mac_pl[0][14]\ <= \Add1~8_RESULTA_bus\(14);
\Add1~23\ <= \Add1~8_RESULTA_bus\(15);
\Add1~24\ <= \Add1~8_RESULTA_bus\(16);
\Add1~25\ <= \Add1~8_RESULTA_bus\(17);
\Add1~26\ <= \Add1~8_RESULTA_bus\(18);
\Add1~27\ <= \Add1~8_RESULTA_bus\(19);
\Add1~28\ <= \Add1~8_RESULTA_bus\(20);
\Add1~29\ <= \Add1~8_RESULTA_bus\(21);
\Add1~30\ <= \Add1~8_RESULTA_bus\(22);
\Add1~31\ <= \Add1~8_RESULTA_bus\(23);
\Add1~32\ <= \Add1~8_RESULTA_bus\(24);
\Add1~33\ <= \Add1~8_RESULTA_bus\(25);
\Add1~34\ <= \Add1~8_RESULTA_bus\(26);
\Add1~35\ <= \Add1~8_RESULTA_bus\(27);
\Add1~36\ <= \Add1~8_RESULTA_bus\(28);
\Add1~37\ <= \Add1~8_RESULTA_bus\(29);
\Add1~38\ <= \Add1~8_RESULTA_bus\(30);
\Add1~39\ <= \Add1~8_RESULTA_bus\(31);
\Add1~40\ <= \Add1~8_RESULTA_bus\(32);
\Add1~41\ <= \Add1~8_RESULTA_bus\(33);
\Add1~42\ <= \Add1~8_RESULTA_bus\(34);
\Add1~43\ <= \Add1~8_RESULTA_bus\(35);
\Add1~44\ <= \Add1~8_RESULTA_bus\(36);
\Add1~45\ <= \Add1~8_RESULTA_bus\(37);
\Add1~46\ <= \Add1~8_RESULTA_bus\(38);
\Add1~47\ <= \Add1~8_RESULTA_bus\(39);
\Add1~48\ <= \Add1~8_RESULTA_bus\(40);
\Add1~49\ <= \Add1~8_RESULTA_bus\(41);
\Add1~50\ <= \Add1~8_RESULTA_bus\(42);
\Add1~51\ <= \Add1~8_RESULTA_bus\(43);
\Add1~52\ <= \Add1~8_RESULTA_bus\(44);
\Add1~53\ <= \Add1~8_RESULTA_bus\(45);
\Add1~54\ <= \Add1~8_RESULTA_bus\(46);
\Add1~55\ <= \Add1~8_RESULTA_bus\(47);
\Add1~56\ <= \Add1~8_RESULTA_bus\(48);
\Add1~57\ <= \Add1~8_RESULTA_bus\(49);
\Add1~58\ <= \Add1~8_RESULTA_bus\(50);
\Add1~59\ <= \Add1~8_RESULTA_bus\(51);
\Add1~60\ <= \Add1~8_RESULTA_bus\(52);
\Add1~61\ <= \Add1~8_RESULTA_bus\(53);
\Add1~62\ <= \Add1~8_RESULTA_bus\(54);
\Add1~63\ <= \Add1~8_RESULTA_bus\(55);
\Add1~64\ <= \Add1~8_RESULTA_bus\(56);
\Add1~65\ <= \Add1~8_RESULTA_bus\(57);
\Add1~66\ <= \Add1~8_RESULTA_bus\(58);
\Add1~67\ <= \Add1~8_RESULTA_bus\(59);
\Add1~68\ <= \Add1~8_RESULTA_bus\(60);
\Add1~69\ <= \Add1~8_RESULTA_bus\(61);
\Add1~70\ <= \Add1~8_RESULTA_bus\(62);
\Add1~71\ <= \Add1~8_RESULTA_bus\(63);

\Add0~8_ACLR_bus\ <= (NOT \i_rstb~inputCLKENA0_outclk\ & NOT \i_rstb~inputCLKENA0_outclk\);

\Add0~8_CLK_bus\ <= (gnd & gnd & \i_clk~inputCLKENA0_outclk\);

\Add0~8_ENA_bus\ <= (vcc & vcc & vcc);

\Add0~8_AX_bus\ <= (\p_data[0][5]~_Duplicate_1_q\ & \p_data[0][4]~_Duplicate_1_q\ & \p_data[0][3]~_Duplicate_1_q\ & \p_data[0][2]~_Duplicate_1_q\ & \p_data[0][1]~_Duplicate_1_q\ & \p_data[0][0]~_Duplicate_1_q\);

\Add0~8_AY_bus\ <= (gnd & vcc & vcc & gnd & gnd & vcc & gnd);

\Add0~8_BX_bus\ <= (\i_data[5]~input_o\ & \i_data[4]~input_o\ & \i_data[3]~input_o\ & \i_data[2]~input_o\ & \i_data[1]~input_o\ & \i_data[0]~input_o\);

\Add0~8_BY_bus\ <= (gnd & gnd & vcc & gnd & gnd & vcc & vcc);

\Add0~mac_pl[0][0]\ <= \Add0~8_RESULTA_bus\(0);
\Add0~mac_pl[0][1]\ <= \Add0~8_RESULTA_bus\(1);
\Add0~mac_pl[0][2]\ <= \Add0~8_RESULTA_bus\(2);
\Add0~mac_pl[0][3]\ <= \Add0~8_RESULTA_bus\(3);
\Add0~mac_pl[0][4]\ <= \Add0~8_RESULTA_bus\(4);
\Add0~mac_pl[0][5]\ <= \Add0~8_RESULTA_bus\(5);
\Add0~mac_pl[0][6]\ <= \Add0~8_RESULTA_bus\(6);
\Add0~mac_pl[0][7]\ <= \Add0~8_RESULTA_bus\(7);
\Add0~mac_pl[0][8]\ <= \Add0~8_RESULTA_bus\(8);
\Add0~mac_pl[0][9]\ <= \Add0~8_RESULTA_bus\(9);
\Add0~mac_pl[0][10]\ <= \Add0~8_RESULTA_bus\(10);
\Add0~mac_pl[0][11]\ <= \Add0~8_RESULTA_bus\(11);
\Add0~mac_pl[0][12]\ <= \Add0~8_RESULTA_bus\(12);
\Add0~mac_pl[0][13]\ <= \Add0~8_RESULTA_bus\(13);
\Add0~mac_pl[0][14]\ <= \Add0~8_RESULTA_bus\(14);
\Add0~23\ <= \Add0~8_RESULTA_bus\(15);
\Add0~24\ <= \Add0~8_RESULTA_bus\(16);
\Add0~25\ <= \Add0~8_RESULTA_bus\(17);
\Add0~26\ <= \Add0~8_RESULTA_bus\(18);
\Add0~27\ <= \Add0~8_RESULTA_bus\(19);
\Add0~28\ <= \Add0~8_RESULTA_bus\(20);
\Add0~29\ <= \Add0~8_RESULTA_bus\(21);
\Add0~30\ <= \Add0~8_RESULTA_bus\(22);
\Add0~31\ <= \Add0~8_RESULTA_bus\(23);
\Add0~32\ <= \Add0~8_RESULTA_bus\(24);
\Add0~33\ <= \Add0~8_RESULTA_bus\(25);
\Add0~34\ <= \Add0~8_RESULTA_bus\(26);
\Add0~35\ <= \Add0~8_RESULTA_bus\(27);
\Add0~36\ <= \Add0~8_RESULTA_bus\(28);
\Add0~37\ <= \Add0~8_RESULTA_bus\(29);
\Add0~38\ <= \Add0~8_RESULTA_bus\(30);
\Add0~39\ <= \Add0~8_RESULTA_bus\(31);
\Add0~40\ <= \Add0~8_RESULTA_bus\(32);
\Add0~41\ <= \Add0~8_RESULTA_bus\(33);
\Add0~42\ <= \Add0~8_RESULTA_bus\(34);
\Add0~43\ <= \Add0~8_RESULTA_bus\(35);
\Add0~44\ <= \Add0~8_RESULTA_bus\(36);
\Add0~45\ <= \Add0~8_RESULTA_bus\(37);
\Add0~46\ <= \Add0~8_RESULTA_bus\(38);
\Add0~47\ <= \Add0~8_RESULTA_bus\(39);
\Add0~48\ <= \Add0~8_RESULTA_bus\(40);
\Add0~49\ <= \Add0~8_RESULTA_bus\(41);
\Add0~50\ <= \Add0~8_RESULTA_bus\(42);
\Add0~51\ <= \Add0~8_RESULTA_bus\(43);
\Add0~52\ <= \Add0~8_RESULTA_bus\(44);
\Add0~53\ <= \Add0~8_RESULTA_bus\(45);
\Add0~54\ <= \Add0~8_RESULTA_bus\(46);
\Add0~55\ <= \Add0~8_RESULTA_bus\(47);
\Add0~56\ <= \Add0~8_RESULTA_bus\(48);
\Add0~57\ <= \Add0~8_RESULTA_bus\(49);
\Add0~58\ <= \Add0~8_RESULTA_bus\(50);
\Add0~59\ <= \Add0~8_RESULTA_bus\(51);
\Add0~60\ <= \Add0~8_RESULTA_bus\(52);
\Add0~61\ <= \Add0~8_RESULTA_bus\(53);
\Add0~62\ <= \Add0~8_RESULTA_bus\(54);
\Add0~63\ <= \Add0~8_RESULTA_bus\(55);
\Add0~64\ <= \Add0~8_RESULTA_bus\(56);
\Add0~65\ <= \Add0~8_RESULTA_bus\(57);
\Add0~66\ <= \Add0~8_RESULTA_bus\(58);
\Add0~67\ <= \Add0~8_RESULTA_bus\(59);
\Add0~68\ <= \Add0~8_RESULTA_bus\(60);
\Add0~69\ <= \Add0~8_RESULTA_bus\(61);
\Add0~70\ <= \Add0~8_RESULTA_bus\(62);
\Add0~71\ <= \Add0~8_RESULTA_bus\(63);
\ALT_INV_r_mult[8][13]\ <= NOT \r_mult[8][13]\;
\ALT_INV_r_mult[8][12]\ <= NOT \r_mult[8][12]\;
\ALT_INV_r_mult[8][11]\ <= NOT \r_mult[8][11]\;
\ALT_INV_r_mult[8][10]\ <= NOT \r_mult[8][10]\;
\ALT_INV_r_mult[8][9]\ <= NOT \r_mult[8][9]\;
\ALT_INV_r_mult[8][8]\ <= NOT \r_mult[8][8]\;
\ALT_INV_r_mult[8][7]\ <= NOT \r_mult[8][7]\;
\ALT_INV_r_mult[8][6]\ <= NOT \r_mult[8][6]\;
\ALT_INV_r_mult[8][5]\ <= NOT \r_mult[8][5]\;
\ALT_INV_r_mult[8][4]\ <= NOT \r_mult[8][4]\;
\ALT_INV_r_mult[8][3]\ <= NOT \r_mult[8][3]\;
\ALT_INV_r_mult[8][2]\ <= NOT \r_mult[8][2]\;
\ALT_INV_r_mult[8][1]\ <= NOT \r_mult[8][1]\;
\ALT_INV_r_mult[8][0]\ <= NOT \r_mult[8][0]\;
\ALT_INV_Add2~mac_pl[0][14]\ <= NOT \Add2~mac_pl[0][14]\;
\ALT_INV_Add2~mac_pl[0][13]\ <= NOT \Add2~mac_pl[0][13]\;
\ALT_INV_Add2~mac_pl[0][10]\ <= NOT \Add2~mac_pl[0][10]\;
\ALT_INV_Add2~mac_pl[0][9]\ <= NOT \Add2~mac_pl[0][9]\;
\ALT_INV_Add2~mac_pl[0][7]\ <= NOT \Add2~mac_pl[0][7]\;
\ALT_INV_Add2~mac_pl[0][6]\ <= NOT \Add2~mac_pl[0][6]\;
\ALT_INV_Add2~mac_pl[0][5]\ <= NOT \Add2~mac_pl[0][5]\;
\ALT_INV_Add2~mac_pl[0][4]\ <= NOT \Add2~mac_pl[0][4]\;
\ALT_INV_Add2~mac_pl[0][2]\ <= NOT \Add2~mac_pl[0][2]\;
\ALT_INV_Add2~mac_pl[0][1]\ <= NOT \Add2~mac_pl[0][1]\;
\ALT_INV_Add2~mac_pl[0][0]\ <= NOT \Add2~mac_pl[0][0]\;
\ALT_INV_Add3~mac_pl[0][13]\ <= NOT \Add3~mac_pl[0][13]\;
\ALT_INV_Add3~mac_pl[0][12]\ <= NOT \Add3~mac_pl[0][12]\;
\ALT_INV_Add3~mac_pl[0][10]\ <= NOT \Add3~mac_pl[0][10]\;
\ALT_INV_Add3~mac_pl[0][9]\ <= NOT \Add3~mac_pl[0][9]\;
\ALT_INV_Add3~mac_pl[0][7]\ <= NOT \Add3~mac_pl[0][7]\;
\ALT_INV_Add3~mac_pl[0][6]\ <= NOT \Add3~mac_pl[0][6]\;
\ALT_INV_Add3~mac_pl[0][4]\ <= NOT \Add3~mac_pl[0][4]\;
\ALT_INV_Add3~mac_pl[0][3]\ <= NOT \Add3~mac_pl[0][3]\;
\ALT_INV_Add3~mac_pl[0][2]\ <= NOT \Add3~mac_pl[0][2]\;
\ALT_INV_Add3~mac_pl[0][1]\ <= NOT \Add3~mac_pl[0][1]\;
\ALT_INV_Add3~mac_pl[0][0]\ <= NOT \Add3~mac_pl[0][0]\;
\ALT_INV_Add0~mac_pl[0][14]\ <= NOT \Add0~mac_pl[0][14]\;
\ALT_INV_Add0~mac_pl[0][13]\ <= NOT \Add0~mac_pl[0][13]\;
\ALT_INV_Add0~mac_pl[0][12]\ <= NOT \Add0~mac_pl[0][12]\;
\ALT_INV_Add0~mac_pl[0][11]\ <= NOT \Add0~mac_pl[0][11]\;
\ALT_INV_Add0~mac_pl[0][9]\ <= NOT \Add0~mac_pl[0][9]\;
\ALT_INV_Add0~mac_pl[0][6]\ <= NOT \Add0~mac_pl[0][6]\;
\ALT_INV_Add0~mac_pl[0][1]\ <= NOT \Add0~mac_pl[0][1]\;
\ALT_INV_Add0~mac_pl[0][0]\ <= NOT \Add0~mac_pl[0][0]\;
\ALT_INV_Add1~mac_pl[0][14]\ <= NOT \Add1~mac_pl[0][14]\;
\ALT_INV_Add1~mac_pl[0][11]\ <= NOT \Add1~mac_pl[0][11]\;
\ALT_INV_Add1~mac_pl[0][10]\ <= NOT \Add1~mac_pl[0][10]\;
\ALT_INV_Add1~mac_pl[0][9]\ <= NOT \Add1~mac_pl[0][9]\;
\ALT_INV_Add1~mac_pl[0][8]\ <= NOT \Add1~mac_pl[0][8]\;
\ALT_INV_Add1~mac_pl[0][7]\ <= NOT \Add1~mac_pl[0][7]\;
\ALT_INV_Add1~mac_pl[0][6]\ <= NOT \Add1~mac_pl[0][6]\;
\ALT_INV_Add1~mac_pl[0][3]\ <= NOT \Add1~mac_pl[0][3]\;
\ALT_INV_Add1~mac_pl[0][2]\ <= NOT \Add1~mac_pl[0][2]\;
\ALT_INV_Add1~mac_pl[0][0]\ <= NOT \Add1~mac_pl[0][0]\;
\ALT_INV_r_add_st0[0][13]~q\ <= NOT \r_add_st0[0][13]~q\;
\ALT_INV_r_add_st0[1][13]~q\ <= NOT \r_add_st0[1][13]~q\;
\ALT_INV_r_add_st0[2][13]~q\ <= NOT \r_add_st0[2][13]~q\;
\ALT_INV_r_add_st0[3][13]~q\ <= NOT \r_add_st0[3][13]~q\;
\ALT_INV_r_add_st0[0][12]~q\ <= NOT \r_add_st0[0][12]~q\;
\ALT_INV_r_add_st0[1][12]~q\ <= NOT \r_add_st0[1][12]~q\;
\ALT_INV_r_add_st0[2][12]~q\ <= NOT \r_add_st0[2][12]~q\;
\ALT_INV_r_add_st0[3][12]~q\ <= NOT \r_add_st0[3][12]~q\;
\ALT_INV_r_add_st0[0][11]~q\ <= NOT \r_add_st0[0][11]~q\;
\ALT_INV_r_add_st0[1][11]~q\ <= NOT \r_add_st0[1][11]~q\;
\ALT_INV_r_add_st0[2][11]~q\ <= NOT \r_add_st0[2][11]~q\;
\ALT_INV_r_add_st0[3][11]~q\ <= NOT \r_add_st0[3][11]~q\;
ALT_INV_r_add_st2(6) <= NOT r_add_st2(6);
\ALT_INV_r_add_st1[0][8]~q\ <= NOT \r_add_st1[0][8]~q\;
\ALT_INV_r_add_st1[1][8]~q\ <= NOT \r_add_st1[1][8]~q\;
\ALT_INV_r_add_st0[0][10]~q\ <= NOT \r_add_st0[0][10]~q\;
\ALT_INV_r_add_st0[1][10]~q\ <= NOT \r_add_st0[1][10]~q\;
\ALT_INV_r_add_st0[2][10]~q\ <= NOT \r_add_st0[2][10]~q\;
\ALT_INV_r_add_st0[3][10]~q\ <= NOT \r_add_st0[3][10]~q\;
ALT_INV_r_add_st2(7) <= NOT r_add_st2(7);
\ALT_INV_r_add_st1[0][9]~q\ <= NOT \r_add_st1[0][9]~q\;
\ALT_INV_r_add_st1[1][9]~q\ <= NOT \r_add_st1[1][9]~q\;
\ALT_INV_r_add_st1[0][15]~q\ <= NOT \r_add_st1[0][15]~q\;
\ALT_INV_r_add_st1[1][15]~q\ <= NOT \r_add_st1[1][15]~q\;
\ALT_INV_r_add_st1[0][14]~q\ <= NOT \r_add_st1[0][14]~q\;
\ALT_INV_r_add_st1[1][14]~q\ <= NOT \r_add_st1[1][14]~q\;
\ALT_INV_r_add_st1[0][13]~q\ <= NOT \r_add_st1[0][13]~q\;
\ALT_INV_r_add_st1[1][13]~q\ <= NOT \r_add_st1[1][13]~q\;
\ALT_INV_r_add_st1[0][12]~q\ <= NOT \r_add_st1[0][12]~q\;
\ALT_INV_r_add_st1[1][12]~q\ <= NOT \r_add_st1[1][12]~q\;
\ALT_INV_r_add_st1[0][11]~q\ <= NOT \r_add_st1[0][11]~q\;
\ALT_INV_r_add_st1[1][11]~q\ <= NOT \r_add_st1[1][11]~q\;
ALT_INV_r_add_st2(8) <= NOT r_add_st2(8);
\ALT_INV_r_add_st1[0][10]~q\ <= NOT \r_add_st1[0][10]~q\;
\ALT_INV_r_add_st1[1][10]~q\ <= NOT \r_add_st1[1][10]~q\;
ALT_INV_r_add_st2(9) <= NOT r_add_st2(9);
ALT_INV_r_add_st2(15) <= NOT r_add_st2(15);
ALT_INV_r_add_st2(14) <= NOT r_add_st2(14);
ALT_INV_r_add_st2(13) <= NOT r_add_st2(13);
ALT_INV_r_add_st2(12) <= NOT r_add_st2(12);
ALT_INV_r_add_st2(11) <= NOT r_add_st2(11);
ALT_INV_r_add_st2(10) <= NOT r_add_st2(10);
ALT_INV_r_add_st3(13) <= NOT r_add_st3(13);
ALT_INV_r_add_st3(12) <= NOT r_add_st3(12);
ALT_INV_r_add_st3(10) <= NOT r_add_st3(10);
\ALT_INV_Add5~61_sumout\ <= NOT \Add5~61_sumout\;
\ALT_INV_i_rstb~inputCLKENA0_outclk\ <= NOT \i_rstb~inputCLKENA0_outclk\;
\ALT_INV_i_data[4]~input_o\ <= NOT \i_data[4]~input_o\;
\ALT_INV_i_data[2]~input_o\ <= NOT \i_data[2]~input_o\;
\ALT_INV_i_data[0]~input_o\ <= NOT \i_data[0]~input_o\;
\ALT_INV_r_add_st0[0][0]~q\ <= NOT \r_add_st0[0][0]~q\;
\ALT_INV_r_add_st0[1][0]~q\ <= NOT \r_add_st0[1][0]~q\;
\ALT_INV_r_add_st0[2][0]~q\ <= NOT \r_add_st0[2][0]~q\;
\ALT_INV_r_add_st0[3][0]~q\ <= NOT \r_add_st0[3][0]~q\;
\ALT_INV_r_add_st0[0][1]~q\ <= NOT \r_add_st0[0][1]~q\;
\ALT_INV_r_add_st0[1][1]~q\ <= NOT \r_add_st0[1][1]~q\;
\ALT_INV_r_add_st0[2][1]~q\ <= NOT \r_add_st0[2][1]~q\;
\ALT_INV_r_add_st0[3][1]~q\ <= NOT \r_add_st0[3][1]~q\;
\ALT_INV_r_add_st1[0][0]~q\ <= NOT \r_add_st1[0][0]~q\;
\ALT_INV_r_add_st1[1][0]~q\ <= NOT \r_add_st1[1][0]~q\;
\ALT_INV_r_add_st0[0][2]~q\ <= NOT \r_add_st0[0][2]~q\;
\ALT_INV_r_add_st0[1][2]~q\ <= NOT \r_add_st0[1][2]~q\;
\ALT_INV_r_add_st0[2][2]~q\ <= NOT \r_add_st0[2][2]~q\;
\ALT_INV_r_add_st0[3][2]~q\ <= NOT \r_add_st0[3][2]~q\;
\ALT_INV_r_add_st1[0][1]~q\ <= NOT \r_add_st1[0][1]~q\;
\ALT_INV_r_add_st1[1][1]~q\ <= NOT \r_add_st1[1][1]~q\;
\ALT_INV_r_add_st0[0][3]~q\ <= NOT \r_add_st0[0][3]~q\;
\ALT_INV_r_add_st0[1][3]~q\ <= NOT \r_add_st0[1][3]~q\;
\ALT_INV_r_add_st0[2][3]~q\ <= NOT \r_add_st0[2][3]~q\;
\ALT_INV_r_add_st0[3][3]~q\ <= NOT \r_add_st0[3][3]~q\;
ALT_INV_r_add_st2(0) <= NOT r_add_st2(0);
\ALT_INV_r_add_st1[0][2]~q\ <= NOT \r_add_st1[0][2]~q\;
\ALT_INV_r_add_st1[1][2]~q\ <= NOT \r_add_st1[1][2]~q\;
\ALT_INV_r_add_st0[0][4]~q\ <= NOT \r_add_st0[0][4]~q\;
\ALT_INV_r_add_st0[1][4]~q\ <= NOT \r_add_st0[1][4]~q\;
\ALT_INV_r_add_st0[2][4]~q\ <= NOT \r_add_st0[2][4]~q\;
\ALT_INV_r_add_st0[3][4]~q\ <= NOT \r_add_st0[3][4]~q\;
ALT_INV_r_add_st2(1) <= NOT r_add_st2(1);
\ALT_INV_r_add_st1[0][3]~q\ <= NOT \r_add_st1[0][3]~q\;
\ALT_INV_r_add_st1[1][3]~q\ <= NOT \r_add_st1[1][3]~q\;
\ALT_INV_r_add_st0[0][5]~q\ <= NOT \r_add_st0[0][5]~q\;
\ALT_INV_r_add_st0[1][5]~q\ <= NOT \r_add_st0[1][5]~q\;
\ALT_INV_r_add_st0[2][5]~q\ <= NOT \r_add_st0[2][5]~q\;
\ALT_INV_r_add_st0[3][5]~q\ <= NOT \r_add_st0[3][5]~q\;
ALT_INV_r_add_st2(2) <= NOT r_add_st2(2);
\ALT_INV_r_add_st1[0][4]~q\ <= NOT \r_add_st1[0][4]~q\;
\ALT_INV_r_add_st1[1][4]~q\ <= NOT \r_add_st1[1][4]~q\;
\ALT_INV_r_add_st0[0][6]~q\ <= NOT \r_add_st0[0][6]~q\;
\ALT_INV_r_add_st0[1][6]~q\ <= NOT \r_add_st0[1][6]~q\;
\ALT_INV_r_add_st0[2][6]~q\ <= NOT \r_add_st0[2][6]~q\;
\ALT_INV_r_add_st0[3][6]~q\ <= NOT \r_add_st0[3][6]~q\;
ALT_INV_r_add_st2(3) <= NOT r_add_st2(3);
\ALT_INV_r_add_st1[0][5]~q\ <= NOT \r_add_st1[0][5]~q\;
\ALT_INV_r_add_st1[1][5]~q\ <= NOT \r_add_st1[1][5]~q\;
\ALT_INV_r_add_st0[0][7]~q\ <= NOT \r_add_st0[0][7]~q\;
\ALT_INV_r_add_st0[1][7]~q\ <= NOT \r_add_st0[1][7]~q\;
\ALT_INV_p_data[0][5]~_Duplicate_1_q\ <= NOT \p_data[0][5]~_Duplicate_1_q\;
\ALT_INV_p_data[0][2]~_Duplicate_1_q\ <= NOT \p_data[0][2]~_Duplicate_1_q\;
\ALT_INV_p_data[1][4]~_Duplicate_1_q\ <= NOT \p_data[1][4]~_Duplicate_1_q\;
\ALT_INV_p_data[1][3]~_Duplicate_1_q\ <= NOT \p_data[1][3]~_Duplicate_1_q\;
\ALT_INV_p_data[2][5]~_Duplicate_1_q\ <= NOT \p_data[2][5]~_Duplicate_1_q\;
\ALT_INV_p_data[2][4]~_Duplicate_1_q\ <= NOT \p_data[2][4]~_Duplicate_1_q\;
\ALT_INV_p_data[2][2]~_Duplicate_1_q\ <= NOT \p_data[2][2]~_Duplicate_1_q\;
\ALT_INV_p_data[2][0]~_Duplicate_1_q\ <= NOT \p_data[2][0]~_Duplicate_1_q\;
\ALT_INV_p_data[3][5]~_Duplicate_1_q\ <= NOT \p_data[3][5]~_Duplicate_1_q\;
\ALT_INV_p_data[3][4]~_Duplicate_1_q\ <= NOT \p_data[3][4]~_Duplicate_1_q\;
\ALT_INV_p_data[3][2]~_Duplicate_1_q\ <= NOT \p_data[3][2]~_Duplicate_1_q\;
\ALT_INV_p_data[3][1]~_Duplicate_1_q\ <= NOT \p_data[3][1]~_Duplicate_1_q\;
\ALT_INV_r_add_st0[2][7]~q\ <= NOT \r_add_st0[2][7]~q\;
\ALT_INV_r_add_st0[3][7]~q\ <= NOT \r_add_st0[3][7]~q\;
ALT_INV_r_add_st2(4) <= NOT r_add_st2(4);
\ALT_INV_p_data[4][5]~_Duplicate_1_q\ <= NOT \p_data[4][5]~_Duplicate_1_q\;
\ALT_INV_p_data[4][2]~_Duplicate_1_q\ <= NOT \p_data[4][2]~_Duplicate_1_q\;
\ALT_INV_r_add_st1[0][6]~q\ <= NOT \r_add_st1[0][6]~q\;
\ALT_INV_r_add_st1[1][6]~q\ <= NOT \r_add_st1[1][6]~q\;
\ALT_INV_r_add_st0[0][8]~q\ <= NOT \r_add_st0[0][8]~q\;
\ALT_INV_r_add_st0[1][8]~q\ <= NOT \r_add_st0[1][8]~q\;
\ALT_INV_r_add_st0[2][8]~q\ <= NOT \r_add_st0[2][8]~q\;
\ALT_INV_r_add_st0[3][8]~q\ <= NOT \r_add_st0[3][8]~q\;
ALT_INV_r_add_st2(5) <= NOT r_add_st2(5);
\ALT_INV_p_data[5][4]~_Duplicate_1_q\ <= NOT \p_data[5][4]~_Duplicate_1_q\;
\ALT_INV_p_data[5][3]~_Duplicate_1_q\ <= NOT \p_data[5][3]~_Duplicate_1_q\;
\ALT_INV_r_add_st1[0][7]~q\ <= NOT \r_add_st1[0][7]~q\;
\ALT_INV_r_add_st1[1][7]~q\ <= NOT \r_add_st1[1][7]~q\;
\ALT_INV_r_add_st0[0][9]~q\ <= NOT \r_add_st0[0][9]~q\;
\ALT_INV_r_add_st0[1][9]~q\ <= NOT \r_add_st0[1][9]~q\;
\ALT_INV_r_add_st0[2][9]~q\ <= NOT \r_add_st0[2][9]~q\;
\ALT_INV_r_add_st0[3][9]~q\ <= NOT \r_add_st0[3][9]~q\;
\ALT_INV_r_add_st0[0][14]~q\ <= NOT \r_add_st0[0][14]~q\;
\ALT_INV_r_add_st0[1][14]~q\ <= NOT \r_add_st0[1][14]~q\;
\ALT_INV_r_add_st0[2][14]~q\ <= NOT \r_add_st0[2][14]~q\;
\ALT_INV_r_add_st0[3][14]~q\ <= NOT \r_add_st0[3][14]~q\;
\ALT_INV_p_data[4][1]~_Duplicate_1DUPLICATE_q\ <= NOT \p_data[4][1]~_Duplicate_1DUPLICATE_q\;
\ALT_INV_p_data[5][5]~_Duplicate_1DUPLICATE_q\ <= NOT \p_data[5][5]~_Duplicate_1DUPLICATE_q\;
\ALT_INV_p_data[5][0]~_Duplicate_1DUPLICATE_q\ <= NOT \p_data[5][0]~_Duplicate_1DUPLICATE_q\;

-- Location: IOOBUF_X62_Y0_N2
\o_data[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \o_data[0]~reg0_q\,
	devoe => ww_devoe,
	o => ww_o_data(0));

-- Location: IOOBUF_X54_Y0_N2
\o_data[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \o_data[1]~reg0_q\,
	devoe => ww_devoe,
	o => ww_o_data(1));

-- Location: IOOBUF_X50_Y0_N59
\o_data[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \o_data[2]~reg0_q\,
	devoe => ww_devoe,
	o => ww_o_data(2));

-- Location: IOOBUF_X62_Y0_N19
\o_data[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \o_data[3]~reg0_q\,
	devoe => ww_devoe,
	o => ww_o_data(3));

-- Location: IOOBUF_X58_Y0_N76
\o_data[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \o_data[4]~reg0_q\,
	devoe => ww_devoe,
	o => ww_o_data(4));

-- Location: IOOBUF_X62_Y0_N53
\o_data[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \o_data[5]~reg0_q\,
	devoe => ww_devoe,
	o => ww_o_data(5));

-- Location: IOIBUF_X52_Y0_N35
\i_clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_clk,
	o => \i_clk~input_o\);

-- Location: CLKCTRL_G7
\i_clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \i_clk~input_o\,
	outclk => \i_clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X50_Y0_N75
\i_rstb~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_rstb,
	o => \i_rstb~input_o\);

-- Location: CLKCTRL_G6
\i_rstb~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \i_rstb~input_o\,
	outclk => \i_rstb~inputCLKENA0_outclk\);

-- Location: IOIBUF_X64_Y0_N1
\i_data[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_data(0),
	o => \i_data[0]~input_o\);

-- Location: LABCELL_X33_Y4_N12
\p_data[0][0]~_Duplicate_1feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_data[0][0]~_Duplicate_1feeder_combout\ = ( \i_data[0]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_i_data[0]~input_o\,
	combout => \p_data[0][0]~_Duplicate_1feeder_combout\);

-- Location: FF_X33_Y4_N14
\p_data[0][0]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[0][0]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[0][0]~_Duplicate_1_q\);

-- Location: FF_X33_Y4_N59
\p_data[1][0]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[0][0]~_Duplicate_1_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[1][0]~_Duplicate_1_q\);

-- Location: FF_X33_Y4_N55
\p_data[2][0]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[1][0]~_Duplicate_1_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[2][0]~_Duplicate_1_q\);

-- Location: LABCELL_X29_Y4_N3
\p_data[3][0]~_Duplicate_1feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_data[3][0]~_Duplicate_1feeder_combout\ = ( \p_data[2][0]~_Duplicate_1_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_p_data[2][0]~_Duplicate_1_q\,
	combout => \p_data[3][0]~_Duplicate_1feeder_combout\);

-- Location: FF_X29_Y4_N5
\p_data[3][0]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[3][0]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[3][0]~_Duplicate_1_q\);

-- Location: FF_X29_Y4_N2
\p_data[4][0]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[3][0]~_Duplicate_1_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[4][0]~_Duplicate_1_q\);

-- Location: FF_X29_Y4_N37
\p_data[5][0]~_Duplicate_1DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[4][0]~_Duplicate_1_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[5][0]~_Duplicate_1DUPLICATE_q\);

-- Location: MLABCELL_X21_Y4_N36
\p_data[6][0]~_Duplicate_1feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_data[6][0]~_Duplicate_1feeder_combout\ = ( \p_data[5][0]~_Duplicate_1DUPLICATE_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_p_data[5][0]~_Duplicate_1DUPLICATE_q\,
	combout => \p_data[6][0]~_Duplicate_1feeder_combout\);

-- Location: FF_X21_Y4_N37
\p_data[6][0]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[6][0]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[6][0]~_Duplicate_1_q\);

-- Location: IOIBUF_X68_Y0_N1
\i_data[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_data(1),
	o => \i_data[1]~input_o\);

-- Location: FF_X33_Y6_N17
\p_data[0][1]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \i_data[1]~input_o\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[0][1]~_Duplicate_1_q\);

-- Location: FF_X33_Y6_N14
\p_data[1][1]~_Duplicate_1DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[0][1]~_Duplicate_1_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[1][1]~_Duplicate_1DUPLICATE_q\);

-- Location: FF_X33_Y4_N38
\p_data[2][1]~_Duplicate_1DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[1][1]~_Duplicate_1DUPLICATE_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[2][1]~_Duplicate_1DUPLICATE_q\);

-- Location: FF_X33_Y4_N40
\p_data[3][1]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[2][1]~_Duplicate_1DUPLICATE_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[3][1]~_Duplicate_1_q\);

-- Location: LABCELL_X33_Y2_N33
\p_data[4][1]~_Duplicate_1feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_data[4][1]~_Duplicate_1feeder_combout\ = ( \p_data[3][1]~_Duplicate_1_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_p_data[3][1]~_Duplicate_1_q\,
	combout => \p_data[4][1]~_Duplicate_1feeder_combout\);

-- Location: FF_X33_Y2_N35
\p_data[4][1]~_Duplicate_1DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[4][1]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[4][1]~_Duplicate_1DUPLICATE_q\);

-- Location: LABCELL_X19_Y2_N39
\p_data[5][1]~_Duplicate_1feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_data[5][1]~_Duplicate_1feeder_combout\ = ( \p_data[4][1]~_Duplicate_1DUPLICATE_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_p_data[4][1]~_Duplicate_1DUPLICATE_q\,
	combout => \p_data[5][1]~_Duplicate_1feeder_combout\);

-- Location: FF_X19_Y2_N41
\p_data[5][1]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[5][1]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[5][1]~_Duplicate_1_q\);

-- Location: FF_X19_Y2_N19
\p_data[6][1]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[5][1]~_Duplicate_1_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[6][1]~_Duplicate_1_q\);

-- Location: IOIBUF_X64_Y0_N18
\i_data[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_data(2),
	o => \i_data[2]~input_o\);

-- Location: LABCELL_X33_Y5_N3
\p_data[0][2]~_Duplicate_1feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_data[0][2]~_Duplicate_1feeder_combout\ = ( \i_data[2]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_i_data[2]~input_o\,
	combout => \p_data[0][2]~_Duplicate_1feeder_combout\);

-- Location: FF_X33_Y5_N5
\p_data[0][2]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[0][2]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[0][2]~_Duplicate_1_q\);

-- Location: LABCELL_X33_Y4_N30
\p_data[1][2]~_Duplicate_1feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_data[1][2]~_Duplicate_1feeder_combout\ = ( \p_data[0][2]~_Duplicate_1_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_p_data[0][2]~_Duplicate_1_q\,
	combout => \p_data[1][2]~_Duplicate_1feeder_combout\);

-- Location: FF_X33_Y4_N32
\p_data[1][2]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[1][2]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[1][2]~_Duplicate_1_q\);

-- Location: FF_X33_Y4_N28
\p_data[2][2]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[1][2]~_Duplicate_1_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[2][2]~_Duplicate_1_q\);

-- Location: LABCELL_X33_Y4_N33
\p_data[3][2]~_Duplicate_1feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_data[3][2]~_Duplicate_1feeder_combout\ = ( \p_data[2][2]~_Duplicate_1_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_p_data[2][2]~_Duplicate_1_q\,
	combout => \p_data[3][2]~_Duplicate_1feeder_combout\);

-- Location: FF_X33_Y4_N34
\p_data[3][2]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[3][2]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[3][2]~_Duplicate_1_q\);

-- Location: LABCELL_X33_Y2_N0
\p_data[4][2]~_Duplicate_1feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_data[4][2]~_Duplicate_1feeder_combout\ = ( \p_data[3][2]~_Duplicate_1_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_p_data[3][2]~_Duplicate_1_q\,
	combout => \p_data[4][2]~_Duplicate_1feeder_combout\);

-- Location: FF_X33_Y2_N2
\p_data[4][2]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[4][2]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[4][2]~_Duplicate_1_q\);

-- Location: MLABCELL_X21_Y2_N57
\p_data[5][2]~_Duplicate_1feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_data[5][2]~_Duplicate_1feeder_combout\ = ( \p_data[4][2]~_Duplicate_1_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_p_data[4][2]~_Duplicate_1_q\,
	combout => \p_data[5][2]~_Duplicate_1feeder_combout\);

-- Location: FF_X21_Y2_N59
\p_data[5][2]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[5][2]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[5][2]~_Duplicate_1_q\);

-- Location: FF_X21_Y2_N14
\p_data[6][2]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[5][2]~_Duplicate_1_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[6][2]~_Duplicate_1_q\);

-- Location: IOIBUF_X72_Y0_N1
\i_data[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_data(3),
	o => \i_data[3]~input_o\);

-- Location: FF_X33_Y6_N56
\p_data[0][3]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \i_data[3]~input_o\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[0][3]~_Duplicate_1_q\);

-- Location: FF_X33_Y6_N31
\p_data[1][3]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[0][3]~_Duplicate_1_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[1][3]~_Duplicate_1_q\);

-- Location: LABCELL_X33_Y4_N3
\p_data[2][3]~_Duplicate_1feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_data[2][3]~_Duplicate_1feeder_combout\ = ( \p_data[1][3]~_Duplicate_1_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_p_data[1][3]~_Duplicate_1_q\,
	combout => \p_data[2][3]~_Duplicate_1feeder_combout\);

-- Location: FF_X33_Y4_N5
\p_data[2][3]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[2][3]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[2][3]~_Duplicate_1_q\);

-- Location: FF_X33_Y4_N1
\p_data[3][3]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[2][3]~_Duplicate_1_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[3][3]~_Duplicate_1_q\);

-- Location: FF_X33_Y4_N10
\p_data[4][3]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[3][3]~_Duplicate_1_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[4][3]~_Duplicate_1_q\);

-- Location: FF_X33_Y4_N8
\p_data[5][3]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[4][3]~_Duplicate_1_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[5][3]~_Duplicate_1_q\);

-- Location: LABCELL_X19_Y4_N15
\p_data[6][3]~_Duplicate_1feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_data[6][3]~_Duplicate_1feeder_combout\ = ( \p_data[5][3]~_Duplicate_1_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_p_data[5][3]~_Duplicate_1_q\,
	combout => \p_data[6][3]~_Duplicate_1feeder_combout\);

-- Location: FF_X19_Y4_N17
\p_data[6][3]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[6][3]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[6][3]~_Duplicate_1_q\);

-- Location: IOIBUF_X54_Y0_N52
\i_data[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_data(4),
	o => \i_data[4]~input_o\);

-- Location: LABCELL_X33_Y6_N39
\p_data[0][4]~_Duplicate_1feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_data[0][4]~_Duplicate_1feeder_combout\ = ( \i_data[4]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_i_data[4]~input_o\,
	combout => \p_data[0][4]~_Duplicate_1feeder_combout\);

-- Location: FF_X33_Y6_N41
\p_data[0][4]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[0][4]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[0][4]~_Duplicate_1_q\);

-- Location: FF_X33_Y6_N4
\p_data[1][4]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[0][4]~_Duplicate_1_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[1][4]~_Duplicate_1_q\);

-- Location: LABCELL_X33_Y4_N21
\p_data[2][4]~_Duplicate_1feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_data[2][4]~_Duplicate_1feeder_combout\ = ( \p_data[1][4]~_Duplicate_1_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_p_data[1][4]~_Duplicate_1_q\,
	combout => \p_data[2][4]~_Duplicate_1feeder_combout\);

-- Location: FF_X33_Y4_N22
\p_data[2][4]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[2][4]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[2][4]~_Duplicate_1_q\);

-- Location: LABCELL_X33_Y4_N51
\p_data[3][4]~_Duplicate_1feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_data[3][4]~_Duplicate_1feeder_combout\ = ( \p_data[2][4]~_Duplicate_1_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_p_data[2][4]~_Duplicate_1_q\,
	combout => \p_data[3][4]~_Duplicate_1feeder_combout\);

-- Location: FF_X33_Y4_N52
\p_data[3][4]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[3][4]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[3][4]~_Duplicate_1_q\);

-- Location: LABCELL_X31_Y2_N39
\p_data[4][4]~_Duplicate_1feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_data[4][4]~_Duplicate_1feeder_combout\ = ( \p_data[3][4]~_Duplicate_1_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_p_data[3][4]~_Duplicate_1_q\,
	combout => \p_data[4][4]~_Duplicate_1feeder_combout\);

-- Location: FF_X31_Y2_N41
\p_data[4][4]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[4][4]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[4][4]~_Duplicate_1_q\);

-- Location: FF_X31_Y2_N26
\p_data[5][4]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[4][4]~_Duplicate_1_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[5][4]~_Duplicate_1_q\);

-- Location: LABCELL_X19_Y4_N33
\p_data[6][4]~_Duplicate_1feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_data[6][4]~_Duplicate_1feeder_combout\ = ( \p_data[5][4]~_Duplicate_1_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_p_data[5][4]~_Duplicate_1_q\,
	combout => \p_data[6][4]~_Duplicate_1feeder_combout\);

-- Location: FF_X19_Y4_N35
\p_data[6][4]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[6][4]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[6][4]~_Duplicate_1_q\);

-- Location: IOIBUF_X58_Y0_N58
\i_data[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_data(5),
	o => \i_data[5]~input_o\);

-- Location: FF_X29_Y4_N8
\p_data[0][5]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \i_data[5]~input_o\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[0][5]~_Duplicate_1_q\);

-- Location: LABCELL_X29_Y4_N57
\p_data[1][5]~_Duplicate_1feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_data[1][5]~_Duplicate_1feeder_combout\ = \p_data[0][5]~_Duplicate_1_q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_p_data[0][5]~_Duplicate_1_q\,
	combout => \p_data[1][5]~_Duplicate_1feeder_combout\);

-- Location: FF_X29_Y4_N59
\p_data[1][5]~_Duplicate_1DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[1][5]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[1][5]~_Duplicate_1DUPLICATE_q\);

-- Location: FF_X29_Y4_N22
\p_data[2][5]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[1][5]~_Duplicate_1DUPLICATE_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[2][5]~_Duplicate_1_q\);

-- Location: MLABCELL_X25_Y4_N21
\p_data[3][5]~_Duplicate_1feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_data[3][5]~_Duplicate_1feeder_combout\ = ( \p_data[2][5]~_Duplicate_1_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_p_data[2][5]~_Duplicate_1_q\,
	combout => \p_data[3][5]~_Duplicate_1feeder_combout\);

-- Location: FF_X25_Y4_N22
\p_data[3][5]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[3][5]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[3][5]~_Duplicate_1_q\);

-- Location: MLABCELL_X25_Y4_N12
\p_data[4][5]~_Duplicate_1feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_data[4][5]~_Duplicate_1feeder_combout\ = ( \p_data[3][5]~_Duplicate_1_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_p_data[3][5]~_Duplicate_1_q\,
	combout => \p_data[4][5]~_Duplicate_1feeder_combout\);

-- Location: FF_X25_Y4_N14
\p_data[4][5]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[4][5]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[4][5]~_Duplicate_1_q\);

-- Location: MLABCELL_X25_Y4_N15
\p_data[5][5]~_Duplicate_1feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_data[5][5]~_Duplicate_1feeder_combout\ = \p_data[4][5]~_Duplicate_1_q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_p_data[4][5]~_Duplicate_1_q\,
	combout => \p_data[5][5]~_Duplicate_1feeder_combout\);

-- Location: FF_X25_Y4_N17
\p_data[5][5]~_Duplicate_1DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[5][5]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[5][5]~_Duplicate_1DUPLICATE_q\);

-- Location: MLABCELL_X21_Y4_N33
\p_data[6][5]~_Duplicate_1feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_data[6][5]~_Duplicate_1feeder_combout\ = ( \p_data[5][5]~_Duplicate_1DUPLICATE_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_p_data[5][5]~_Duplicate_1DUPLICATE_q\,
	combout => \p_data[6][5]~_Duplicate_1feeder_combout\);

-- Location: FF_X21_Y4_N34
\p_data[6][5]~_Duplicate_1DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[6][5]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[6][5]~_Duplicate_1DUPLICATE_q\);

-- Location: FF_X29_Y4_N38
\p_data[5][0]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[4][0]~_Duplicate_1_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[5][0]~_Duplicate_1_q\);

-- Location: FF_X21_Y2_N58
\p_data[5][2]~_Duplicate_1DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[5][2]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[5][2]~_Duplicate_1DUPLICATE_q\);

-- Location: FF_X31_Y2_N25
\p_data[5][4]~_Duplicate_1DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[4][4]~_Duplicate_1_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[5][4]~_Duplicate_1DUPLICATE_q\);

-- Location: FF_X25_Y4_N16
\p_data[5][5]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[5][5]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[5][5]~_Duplicate_1_q\);

-- Location: DSP_X20_Y4_N0
\Add3~8\ : cyclonev_mac
-- pragma translate_off
GENERIC MAP (
	accumulate_clock => "none",
	ax_clock => "0",
	ax_width => 6,
	ay_scan_in_clock => "0",
	ay_scan_in_width => 7,
	ay_use_scan_in => "false",
	az_clock => "none",
	bx_clock => "0",
	bx_width => 6,
	by_clock => "0",
	by_use_scan_in => "false",
	by_width => 7,
	bz_clock => "none",
	coef_a_0 => 0,
	coef_a_1 => 0,
	coef_a_2 => 0,
	coef_a_3 => 0,
	coef_a_4 => 0,
	coef_a_5 => 0,
	coef_a_6 => 0,
	coef_a_7 => 0,
	coef_b_0 => 0,
	coef_b_1 => 0,
	coef_b_2 => 0,
	coef_b_3 => 0,
	coef_b_4 => 0,
	coef_b_5 => 0,
	coef_b_6 => 0,
	coef_b_7 => 0,
	coef_sel_a_clock => "none",
	coef_sel_b_clock => "none",
	delay_scan_out_ay => "false",
	delay_scan_out_by => "false",
	enable_double_accum => "false",
	load_const_clock => "none",
	load_const_value => 0,
	mode_sub_location => 0,
	negate_clock => "none",
	operand_source_max => "input",
	operand_source_may => "input",
	operand_source_mbx => "input",
	operand_source_mby => "input",
	operation_mode => "m18x18_sumof2",
	output_clock => "0",
	preadder_subtract_a => "false",
	preadder_subtract_b => "false",
	result_a_width => 64,
	signed_max => "false",
	signed_may => "false",
	signed_mbx => "false",
	signed_mby => "false",
	sub_clock => "none",
	use_chainadder => "false")
-- pragma translate_on
PORT MAP (
	sub => GND,
	negate => GND,
	aclr => \Add3~8_ACLR_bus\,
	clk => \Add3~8_CLK_bus\,
	ena => \Add3~8_ENA_bus\,
	ax => \Add3~8_AX_bus\,
	ay => \Add3~8_AY_bus\,
	bx => \Add3~8_BX_bus\,
	by => \Add3~8_BY_bus\,
	resulta => \Add3~8_RESULTA_bus\);

-- Location: LABCELL_X27_Y4_N48
\r_add_st0[3][10]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[3][10]~feeder_combout\ = ( \Add3~mac_pl[0][10]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add3~mac_pl[0][10]\,
	combout => \r_add_st0[3][10]~feeder_combout\);

-- Location: FF_X27_Y4_N49
\r_add_st0[3][10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[3][10]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[3][10]~q\);

-- Location: FF_X29_Y4_N1
\p_data[4][0]~_Duplicate_1DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[3][0]~_Duplicate_1_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[4][0]~_Duplicate_1DUPLICATE_q\);

-- Location: FF_X33_Y2_N34
\p_data[4][1]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[4][1]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[4][1]~_Duplicate_1_q\);

-- Location: FF_X33_Y2_N1
\p_data[4][2]~_Duplicate_1DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[4][2]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[4][2]~_Duplicate_1DUPLICATE_q\);

-- Location: FF_X29_Y4_N4
\p_data[3][0]~_Duplicate_1DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[3][0]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[3][0]~_Duplicate_1DUPLICATE_q\);

-- Location: DSP_X32_Y2_N0
\Add2~8\ : cyclonev_mac
-- pragma translate_off
GENERIC MAP (
	accumulate_clock => "none",
	ax_clock => "0",
	ax_width => 6,
	ay_scan_in_clock => "0",
	ay_scan_in_width => 8,
	ay_use_scan_in => "false",
	az_clock => "none",
	bx_clock => "0",
	bx_width => 6,
	by_clock => "0",
	by_use_scan_in => "false",
	by_width => 8,
	bz_clock => "none",
	coef_a_0 => 0,
	coef_a_1 => 0,
	coef_a_2 => 0,
	coef_a_3 => 0,
	coef_a_4 => 0,
	coef_a_5 => 0,
	coef_a_6 => 0,
	coef_a_7 => 0,
	coef_b_0 => 0,
	coef_b_1 => 0,
	coef_b_2 => 0,
	coef_b_3 => 0,
	coef_b_4 => 0,
	coef_b_5 => 0,
	coef_b_6 => 0,
	coef_b_7 => 0,
	coef_sel_a_clock => "none",
	coef_sel_b_clock => "none",
	delay_scan_out_ay => "false",
	delay_scan_out_by => "false",
	enable_double_accum => "false",
	load_const_clock => "none",
	load_const_value => 0,
	mode_sub_location => 0,
	negate_clock => "none",
	operand_source_max => "input",
	operand_source_may => "input",
	operand_source_mbx => "input",
	operand_source_mby => "input",
	operation_mode => "m18x18_sumof2",
	output_clock => "0",
	preadder_subtract_a => "false",
	preadder_subtract_b => "false",
	result_a_width => 64,
	signed_max => "false",
	signed_may => "false",
	signed_mbx => "false",
	signed_mby => "false",
	sub_clock => "none",
	use_chainadder => "false")
-- pragma translate_on
PORT MAP (
	sub => GND,
	negate => GND,
	aclr => \Add2~8_ACLR_bus\,
	clk => \Add2~8_CLK_bus\,
	ena => \Add2~8_ENA_bus\,
	ax => \Add2~8_AX_bus\,
	ay => \Add2~8_AY_bus\,
	bx => \Add2~8_BX_bus\,
	by => \Add2~8_BY_bus\,
	resulta => \Add2~8_RESULTA_bus\);

-- Location: LABCELL_X30_Y4_N48
\r_add_st0[2][10]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[2][10]~feeder_combout\ = ( \Add2~mac_pl[0][10]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add2~mac_pl[0][10]\,
	combout => \r_add_st0[2][10]~feeder_combout\);

-- Location: FF_X30_Y4_N50
\r_add_st0[2][10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[2][10]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[2][10]~q\);

-- Location: LABCELL_X31_Y4_N39
\r_add_st0[2][9]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[2][9]~feeder_combout\ = ( \Add2~mac_pl[0][9]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add2~mac_pl[0][9]\,
	combout => \r_add_st0[2][9]~feeder_combout\);

-- Location: FF_X31_Y4_N40
\r_add_st0[2][9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[2][9]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[2][9]~q\);

-- Location: MLABCELL_X25_Y4_N0
\r_add_st0[3][9]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[3][9]~feeder_combout\ = ( \Add3~mac_pl[0][9]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add3~mac_pl[0][9]\,
	combout => \r_add_st0[3][9]~feeder_combout\);

-- Location: FF_X25_Y4_N1
\r_add_st0[3][9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[3][9]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[3][9]~q\);

-- Location: FF_X25_Y4_N34
\r_add_st0[3][8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \Add3~mac_pl[0][8]\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[3][8]~q\);

-- Location: FF_X31_Y4_N25
\r_add_st0[2][8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \Add2~mac_pl[0][8]\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[2][8]~q\);

-- Location: LABCELL_X31_Y4_N45
\r_add_st0[2][7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[2][7]~feeder_combout\ = ( \Add2~mac_pl[0][7]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add2~mac_pl[0][7]\,
	combout => \r_add_st0[2][7]~feeder_combout\);

-- Location: FF_X31_Y4_N47
\r_add_st0[2][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[2][7]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[2][7]~q\);

-- Location: MLABCELL_X25_Y4_N24
\r_add_st0[3][7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[3][7]~feeder_combout\ = ( \Add3~mac_pl[0][7]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add3~mac_pl[0][7]\,
	combout => \r_add_st0[3][7]~feeder_combout\);

-- Location: FF_X25_Y4_N25
\r_add_st0[3][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[3][7]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[3][7]~q\);

-- Location: LABCELL_X31_Y4_N33
\r_add_st0[2][6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[2][6]~feeder_combout\ = ( \Add2~mac_pl[0][6]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add2~mac_pl[0][6]\,
	combout => \r_add_st0[2][6]~feeder_combout\);

-- Location: FF_X31_Y4_N35
\r_add_st0[2][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[2][6]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[2][6]~q\);

-- Location: LABCELL_X24_Y4_N0
\r_add_st0[3][6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[3][6]~feeder_combout\ = ( \Add3~mac_pl[0][6]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add3~mac_pl[0][6]\,
	combout => \r_add_st0[3][6]~feeder_combout\);

-- Location: FF_X24_Y4_N1
\r_add_st0[3][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[3][6]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[3][6]~q\);

-- Location: FF_X25_Y4_N37
\r_add_st0[3][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \Add3~mac_pl[0][5]\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[3][5]~q\);

-- Location: LABCELL_X31_Y2_N48
\r_add_st0[2][5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[2][5]~feeder_combout\ = ( \Add2~mac_pl[0][5]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add2~mac_pl[0][5]\,
	combout => \r_add_st0[2][5]~feeder_combout\);

-- Location: FF_X31_Y2_N49
\r_add_st0[2][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[2][5]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[2][5]~q\);

-- Location: LABCELL_X31_Y4_N27
\r_add_st0[2][4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[2][4]~feeder_combout\ = ( \Add2~mac_pl[0][4]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add2~mac_pl[0][4]\,
	combout => \r_add_st0[2][4]~feeder_combout\);

-- Location: FF_X31_Y4_N29
\r_add_st0[2][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[2][4]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[2][4]~q\);

-- Location: MLABCELL_X25_Y4_N9
\r_add_st0[3][4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[3][4]~feeder_combout\ = ( \Add3~mac_pl[0][4]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add3~mac_pl[0][4]\,
	combout => \r_add_st0[3][4]~feeder_combout\);

-- Location: FF_X25_Y4_N10
\r_add_st0[3][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[3][4]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[3][4]~q\);

-- Location: LABCELL_X29_Y4_N30
\r_add_st0[3][3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[3][3]~feeder_combout\ = ( \Add3~mac_pl[0][3]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add3~mac_pl[0][3]\,
	combout => \r_add_st0[3][3]~feeder_combout\);

-- Location: FF_X29_Y4_N31
\r_add_st0[3][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[3][3]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[3][3]~q\);

-- Location: FF_X31_Y4_N23
\r_add_st0[2][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \Add2~mac_pl[0][3]\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[2][3]~q\);

-- Location: LABCELL_X30_Y4_N51
\r_add_st0[3][2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[3][2]~feeder_combout\ = ( \Add3~mac_pl[0][2]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add3~mac_pl[0][2]\,
	combout => \r_add_st0[3][2]~feeder_combout\);

-- Location: FF_X30_Y4_N53
\r_add_st0[3][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[3][2]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[3][2]~q\);

-- Location: LABCELL_X31_Y4_N0
\r_add_st0[2][2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[2][2]~feeder_combout\ = ( \Add2~mac_pl[0][2]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add2~mac_pl[0][2]\,
	combout => \r_add_st0[2][2]~feeder_combout\);

-- Location: FF_X31_Y4_N2
\r_add_st0[2][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[2][2]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[2][2]~q\);

-- Location: LABCELL_X30_Y4_N57
\r_add_st0[3][1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[3][1]~feeder_combout\ = ( \Add3~mac_pl[0][1]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add3~mac_pl[0][1]\,
	combout => \r_add_st0[3][1]~feeder_combout\);

-- Location: FF_X30_Y4_N59
\r_add_st0[3][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[3][1]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[3][1]~q\);

-- Location: LABCELL_X31_Y4_N54
\r_add_st0[2][1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[2][1]~feeder_combout\ = ( \Add2~mac_pl[0][1]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add2~mac_pl[0][1]\,
	combout => \r_add_st0[2][1]~feeder_combout\);

-- Location: FF_X31_Y4_N56
\r_add_st0[2][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[2][1]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[2][1]~q\);

-- Location: LABCELL_X31_Y4_N15
\r_add_st0[2][0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[2][0]~feeder_combout\ = ( \Add2~mac_pl[0][0]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add2~mac_pl[0][0]\,
	combout => \r_add_st0[2][0]~feeder_combout\);

-- Location: FF_X31_Y4_N17
\r_add_st0[2][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[2][0]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[2][0]~q\);

-- Location: LABCELL_X30_Y4_N54
\r_add_st0[3][0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[3][0]~feeder_combout\ = ( \Add3~mac_pl[0][0]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add3~mac_pl[0][0]\,
	combout => \r_add_st0[3][0]~feeder_combout\);

-- Location: FF_X30_Y4_N56
\r_add_st0[3][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[3][0]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[3][0]~q\);

-- Location: LABCELL_X30_Y4_N0
\Add5~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add5~61_sumout\ = SUM(( \r_add_st0[3][0]~q\ ) + ( \r_add_st0[2][0]~q\ ) + ( !VCC ))
-- \Add5~62\ = CARRY(( \r_add_st0[3][0]~q\ ) + ( \r_add_st0[2][0]~q\ ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st0[2][0]~q\,
	datad => \ALT_INV_r_add_st0[3][0]~q\,
	cin => GND,
	sumout => \Add5~61_sumout\,
	cout => \Add5~62\);

-- Location: LABCELL_X30_Y4_N3
\Add5~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add5~57_sumout\ = SUM(( \r_add_st0[2][1]~q\ ) + ( \r_add_st0[3][1]~q\ ) + ( \Add5~62\ ))
-- \Add5~58\ = CARRY(( \r_add_st0[2][1]~q\ ) + ( \r_add_st0[3][1]~q\ ) + ( \Add5~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st0[3][1]~q\,
	datad => \ALT_INV_r_add_st0[2][1]~q\,
	cin => \Add5~62\,
	sumout => \Add5~57_sumout\,
	cout => \Add5~58\);

-- Location: LABCELL_X30_Y4_N6
\Add5~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add5~53_sumout\ = SUM(( \r_add_st0[2][2]~q\ ) + ( \r_add_st0[3][2]~q\ ) + ( \Add5~58\ ))
-- \Add5~54\ = CARRY(( \r_add_st0[2][2]~q\ ) + ( \r_add_st0[3][2]~q\ ) + ( \Add5~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st0[3][2]~q\,
	datad => \ALT_INV_r_add_st0[2][2]~q\,
	cin => \Add5~58\,
	sumout => \Add5~53_sumout\,
	cout => \Add5~54\);

-- Location: LABCELL_X30_Y4_N9
\Add5~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add5~49_sumout\ = SUM(( \r_add_st0[2][3]~q\ ) + ( \r_add_st0[3][3]~q\ ) + ( \Add5~54\ ))
-- \Add5~50\ = CARRY(( \r_add_st0[2][3]~q\ ) + ( \r_add_st0[3][3]~q\ ) + ( \Add5~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_r_add_st0[3][3]~q\,
	datad => \ALT_INV_r_add_st0[2][3]~q\,
	cin => \Add5~54\,
	sumout => \Add5~49_sumout\,
	cout => \Add5~50\);

-- Location: LABCELL_X30_Y4_N12
\Add5~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add5~45_sumout\ = SUM(( \r_add_st0[3][4]~q\ ) + ( \r_add_st0[2][4]~q\ ) + ( \Add5~50\ ))
-- \Add5~46\ = CARRY(( \r_add_st0[3][4]~q\ ) + ( \r_add_st0[2][4]~q\ ) + ( \Add5~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st0[2][4]~q\,
	datad => \ALT_INV_r_add_st0[3][4]~q\,
	cin => \Add5~50\,
	sumout => \Add5~45_sumout\,
	cout => \Add5~46\);

-- Location: LABCELL_X30_Y4_N15
\Add5~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add5~41_sumout\ = SUM(( \r_add_st0[2][5]~q\ ) + ( \r_add_st0[3][5]~q\ ) + ( \Add5~46\ ))
-- \Add5~42\ = CARRY(( \r_add_st0[2][5]~q\ ) + ( \r_add_st0[3][5]~q\ ) + ( \Add5~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st0[3][5]~q\,
	datad => \ALT_INV_r_add_st0[2][5]~q\,
	cin => \Add5~46\,
	sumout => \Add5~41_sumout\,
	cout => \Add5~42\);

-- Location: LABCELL_X30_Y4_N18
\Add5~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add5~37_sumout\ = SUM(( \r_add_st0[3][6]~q\ ) + ( \r_add_st0[2][6]~q\ ) + ( \Add5~42\ ))
-- \Add5~38\ = CARRY(( \r_add_st0[3][6]~q\ ) + ( \r_add_st0[2][6]~q\ ) + ( \Add5~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st0[2][6]~q\,
	datad => \ALT_INV_r_add_st0[3][6]~q\,
	cin => \Add5~42\,
	sumout => \Add5~37_sumout\,
	cout => \Add5~38\);

-- Location: LABCELL_X30_Y4_N21
\Add5~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add5~33_sumout\ = SUM(( \r_add_st0[3][7]~q\ ) + ( \r_add_st0[2][7]~q\ ) + ( \Add5~38\ ))
-- \Add5~34\ = CARRY(( \r_add_st0[3][7]~q\ ) + ( \r_add_st0[2][7]~q\ ) + ( \Add5~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_r_add_st0[2][7]~q\,
	datad => \ALT_INV_r_add_st0[3][7]~q\,
	cin => \Add5~38\,
	sumout => \Add5~33_sumout\,
	cout => \Add5~34\);

-- Location: LABCELL_X30_Y4_N24
\Add5~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add5~29_sumout\ = SUM(( \r_add_st0[3][8]~q\ ) + ( \r_add_st0[2][8]~q\ ) + ( \Add5~34\ ))
-- \Add5~30\ = CARRY(( \r_add_st0[3][8]~q\ ) + ( \r_add_st0[2][8]~q\ ) + ( \Add5~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st0[3][8]~q\,
	dataf => \ALT_INV_r_add_st0[2][8]~q\,
	cin => \Add5~34\,
	sumout => \Add5~29_sumout\,
	cout => \Add5~30\);

-- Location: LABCELL_X30_Y4_N27
\Add5~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add5~25_sumout\ = SUM(( \r_add_st0[3][9]~q\ ) + ( \r_add_st0[2][9]~q\ ) + ( \Add5~30\ ))
-- \Add5~26\ = CARRY(( \r_add_st0[3][9]~q\ ) + ( \r_add_st0[2][9]~q\ ) + ( \Add5~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st0[2][9]~q\,
	datad => \ALT_INV_r_add_st0[3][9]~q\,
	cin => \Add5~30\,
	sumout => \Add5~25_sumout\,
	cout => \Add5~26\);

-- Location: LABCELL_X30_Y4_N30
\Add5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add5~1_sumout\ = SUM(( \r_add_st0[3][10]~q\ ) + ( \r_add_st0[2][10]~q\ ) + ( \Add5~26\ ))
-- \Add5~2\ = CARRY(( \r_add_st0[3][10]~q\ ) + ( \r_add_st0[2][10]~q\ ) + ( \Add5~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_r_add_st0[3][10]~q\,
	datac => \ALT_INV_r_add_st0[2][10]~q\,
	cin => \Add5~26\,
	sumout => \Add5~1_sumout\,
	cout => \Add5~2\);

-- Location: FF_X30_Y4_N31
\r_add_st1[1][10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add5~1_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[1][10]~q\);

-- Location: FF_X33_Y4_N37
\p_data[2][1]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[1][1]~_Duplicate_1DUPLICATE_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[2][1]~_Duplicate_1_q\);

-- Location: FF_X33_Y4_N4
\p_data[2][3]~_Duplicate_1DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[2][3]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[2][3]~_Duplicate_1DUPLICATE_q\);

-- Location: FF_X33_Y6_N13
\p_data[1][1]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[0][1]~_Duplicate_1_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[1][1]~_Duplicate_1_q\);

-- Location: FF_X29_Y4_N58
\p_data[1][5]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[1][5]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[1][5]~_Duplicate_1_q\);

-- Location: DSP_X32_Y4_N0
\Add1~8\ : cyclonev_mac
-- pragma translate_off
GENERIC MAP (
	accumulate_clock => "none",
	ax_clock => "0",
	ax_width => 6,
	ay_scan_in_clock => "0",
	ay_scan_in_width => 8,
	ay_use_scan_in => "false",
	az_clock => "none",
	bx_clock => "0",
	bx_width => 6,
	by_clock => "0",
	by_use_scan_in => "false",
	by_width => 7,
	bz_clock => "none",
	coef_a_0 => 0,
	coef_a_1 => 0,
	coef_a_2 => 0,
	coef_a_3 => 0,
	coef_a_4 => 0,
	coef_a_5 => 0,
	coef_a_6 => 0,
	coef_a_7 => 0,
	coef_b_0 => 0,
	coef_b_1 => 0,
	coef_b_2 => 0,
	coef_b_3 => 0,
	coef_b_4 => 0,
	coef_b_5 => 0,
	coef_b_6 => 0,
	coef_b_7 => 0,
	coef_sel_a_clock => "none",
	coef_sel_b_clock => "none",
	delay_scan_out_ay => "false",
	delay_scan_out_by => "false",
	enable_double_accum => "false",
	load_const_clock => "none",
	load_const_value => 0,
	mode_sub_location => 0,
	negate_clock => "none",
	operand_source_max => "input",
	operand_source_may => "input",
	operand_source_mbx => "input",
	operand_source_mby => "input",
	operation_mode => "m18x18_sumof2",
	output_clock => "0",
	preadder_subtract_a => "false",
	preadder_subtract_b => "false",
	result_a_width => 64,
	signed_max => "false",
	signed_may => "false",
	signed_mbx => "false",
	signed_mby => "false",
	sub_clock => "none",
	use_chainadder => "false")
-- pragma translate_on
PORT MAP (
	sub => GND,
	negate => GND,
	aclr => \Add1~8_ACLR_bus\,
	clk => \Add1~8_CLK_bus\,
	ena => \Add1~8_ENA_bus\,
	ax => \Add1~8_AX_bus\,
	ay => \Add1~8_AY_bus\,
	bx => \Add1~8_BX_bus\,
	by => \Add1~8_BY_bus\,
	resulta => \Add1~8_RESULTA_bus\);

-- Location: LABCELL_X31_Y4_N12
\r_add_st0[1][10]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[1][10]~feeder_combout\ = ( \Add1~mac_pl[0][10]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add1~mac_pl[0][10]\,
	combout => \r_add_st0[1][10]~feeder_combout\);

-- Location: FF_X31_Y4_N14
\r_add_st0[1][10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[1][10]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[1][10]~q\);

-- Location: DSP_X32_Y6_N0
\Add0~8\ : cyclonev_mac
-- pragma translate_off
GENERIC MAP (
	accumulate_clock => "none",
	ax_clock => "0",
	ax_width => 6,
	ay_scan_in_clock => "0",
	ay_scan_in_width => 7,
	ay_use_scan_in => "false",
	az_clock => "none",
	bx_clock => "0",
	bx_width => 6,
	by_clock => "0",
	by_use_scan_in => "false",
	by_width => 7,
	bz_clock => "none",
	coef_a_0 => 0,
	coef_a_1 => 0,
	coef_a_2 => 0,
	coef_a_3 => 0,
	coef_a_4 => 0,
	coef_a_5 => 0,
	coef_a_6 => 0,
	coef_a_7 => 0,
	coef_b_0 => 0,
	coef_b_1 => 0,
	coef_b_2 => 0,
	coef_b_3 => 0,
	coef_b_4 => 0,
	coef_b_5 => 0,
	coef_b_6 => 0,
	coef_b_7 => 0,
	coef_sel_a_clock => "none",
	coef_sel_b_clock => "none",
	delay_scan_out_ay => "false",
	delay_scan_out_by => "false",
	enable_double_accum => "false",
	load_const_clock => "none",
	load_const_value => 0,
	mode_sub_location => 0,
	negate_clock => "none",
	operand_source_max => "input",
	operand_source_may => "input",
	operand_source_mbx => "input",
	operand_source_mby => "input",
	operation_mode => "m18x18_sumof2",
	output_clock => "0",
	preadder_subtract_a => "false",
	preadder_subtract_b => "false",
	result_a_width => 64,
	signed_max => "false",
	signed_may => "false",
	signed_mbx => "false",
	signed_mby => "false",
	sub_clock => "none",
	use_chainadder => "false")
-- pragma translate_on
PORT MAP (
	sub => GND,
	negate => GND,
	aclr => \Add0~8_ACLR_bus\,
	clk => \Add0~8_CLK_bus\,
	ena => \Add0~8_ENA_bus\,
	ax => \Add0~8_AX_bus\,
	ay => \Add0~8_AY_bus\,
	bx => \Add0~8_BX_bus\,
	by => \Add0~8_BY_bus\,
	resulta => \Add0~8_RESULTA_bus\);

-- Location: FF_X28_Y4_N2
\r_add_st0[0][10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \Add0~mac_pl[0][10]\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[0][10]~q\);

-- Location: LABCELL_X31_Y4_N9
\r_add_st0[1][9]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[1][9]~feeder_combout\ = ( \Add1~mac_pl[0][9]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add1~mac_pl[0][9]\,
	combout => \r_add_st0[1][9]~feeder_combout\);

-- Location: FF_X31_Y4_N11
\r_add_st0[1][9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[1][9]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[1][9]~q\);

-- Location: LABCELL_X29_Y6_N12
\r_add_st0[0][9]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[0][9]~feeder_combout\ = ( \Add0~mac_pl[0][9]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add0~mac_pl[0][9]\,
	combout => \r_add_st0[0][9]~feeder_combout\);

-- Location: FF_X29_Y6_N13
\r_add_st0[0][9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[0][9]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[0][9]~q\);

-- Location: FF_X29_Y4_N41
\r_add_st0[0][8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \Add0~mac_pl[0][8]\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[0][8]~q\);

-- Location: LABCELL_X29_Y4_N33
\r_add_st0[1][8]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[1][8]~feeder_combout\ = ( \Add1~mac_pl[0][8]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add1~mac_pl[0][8]\,
	combout => \r_add_st0[1][8]~feeder_combout\);

-- Location: FF_X29_Y4_N35
\r_add_st0[1][8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[1][8]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[1][8]~q\);

-- Location: FF_X29_Y6_N7
\r_add_st0[0][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \Add0~mac_pl[0][7]\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[0][7]~q\);

-- Location: LABCELL_X29_Y4_N9
\r_add_st0[1][7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[1][7]~feeder_combout\ = ( \Add1~mac_pl[0][7]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add1~mac_pl[0][7]\,
	combout => \r_add_st0[1][7]~feeder_combout\);

-- Location: FF_X29_Y4_N11
\r_add_st0[1][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[1][7]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[1][7]~q\);

-- Location: LABCELL_X29_Y4_N54
\r_add_st0[1][6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[1][6]~feeder_combout\ = ( \Add1~mac_pl[0][6]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add1~mac_pl[0][6]\,
	combout => \r_add_st0[1][6]~feeder_combout\);

-- Location: FF_X29_Y4_N56
\r_add_st0[1][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[1][6]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[1][6]~q\);

-- Location: LABCELL_X29_Y4_N42
\r_add_st0[0][6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[0][6]~feeder_combout\ = ( \Add0~mac_pl[0][6]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add0~mac_pl[0][6]\,
	combout => \r_add_st0[0][6]~feeder_combout\);

-- Location: FF_X29_Y4_N44
\r_add_st0[0][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[0][6]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[0][6]~q\);

-- Location: FF_X31_Y4_N8
\r_add_st0[1][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \Add1~mac_pl[0][5]\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[1][5]~q\);

-- Location: FF_X29_Y4_N50
\r_add_st0[0][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \Add0~mac_pl[0][5]\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[0][5]~q\);

-- Location: FF_X29_Y4_N53
\r_add_st0[1][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \Add1~mac_pl[0][4]\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[1][4]~q\);

-- Location: FF_X28_Y6_N1
\r_add_st0[0][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \Add0~mac_pl[0][4]\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[0][4]~q\);

-- Location: LABCELL_X31_Y4_N48
\r_add_st0[1][3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[1][3]~feeder_combout\ = ( \Add1~mac_pl[0][3]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add1~mac_pl[0][3]\,
	combout => \r_add_st0[1][3]~feeder_combout\);

-- Location: FF_X31_Y4_N50
\r_add_st0[1][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[1][3]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[1][3]~q\);

-- Location: FF_X29_Y4_N17
\r_add_st0[0][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \Add0~mac_pl[0][3]\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[0][3]~q\);

-- Location: LABCELL_X29_Y4_N18
\r_add_st0[1][2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[1][2]~feeder_combout\ = ( \Add1~mac_pl[0][2]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add1~mac_pl[0][2]\,
	combout => \r_add_st0[1][2]~feeder_combout\);

-- Location: FF_X29_Y4_N19
\r_add_st0[1][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[1][2]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[1][2]~q\);

-- Location: FF_X28_Y4_N53
\r_add_st0[0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \Add0~mac_pl[0][2]\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[0][2]~q\);

-- Location: FF_X29_Y4_N46
\r_add_st0[1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \Add1~mac_pl[0][1]\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[1][1]~q\);

-- Location: MLABCELL_X28_Y4_N57
\r_add_st0[0][1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[0][1]~feeder_combout\ = ( \Add0~mac_pl[0][1]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add0~mac_pl[0][1]\,
	combout => \r_add_st0[0][1]~feeder_combout\);

-- Location: FF_X28_Y4_N59
\r_add_st0[0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[0][1]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[0][1]~q\);

-- Location: MLABCELL_X28_Y4_N48
\r_add_st0[0][0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[0][0]~feeder_combout\ = ( \Add0~mac_pl[0][0]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add0~mac_pl[0][0]\,
	combout => \r_add_st0[0][0]~feeder_combout\);

-- Location: FF_X28_Y4_N50
\r_add_st0[0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[0][0]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[0][0]~q\);

-- Location: MLABCELL_X28_Y4_N54
\r_add_st0[1][0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[1][0]~feeder_combout\ = ( \Add1~mac_pl[0][0]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add1~mac_pl[0][0]\,
	combout => \r_add_st0[1][0]~feeder_combout\);

-- Location: FF_X28_Y4_N56
\r_add_st0[1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[1][0]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[1][0]~q\);

-- Location: MLABCELL_X28_Y4_N0
\Add4~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add4~61_sumout\ = SUM(( \r_add_st0[1][0]~q\ ) + ( \r_add_st0[0][0]~q\ ) + ( !VCC ))
-- \Add4~62\ = CARRY(( \r_add_st0[1][0]~q\ ) + ( \r_add_st0[0][0]~q\ ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st0[0][0]~q\,
	datad => \ALT_INV_r_add_st0[1][0]~q\,
	cin => GND,
	sumout => \Add4~61_sumout\,
	cout => \Add4~62\);

-- Location: MLABCELL_X28_Y4_N3
\Add4~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add4~57_sumout\ = SUM(( \r_add_st0[0][1]~q\ ) + ( \r_add_st0[1][1]~q\ ) + ( \Add4~62\ ))
-- \Add4~58\ = CARRY(( \r_add_st0[0][1]~q\ ) + ( \r_add_st0[1][1]~q\ ) + ( \Add4~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st0[1][1]~q\,
	datad => \ALT_INV_r_add_st0[0][1]~q\,
	cin => \Add4~62\,
	sumout => \Add4~57_sumout\,
	cout => \Add4~58\);

-- Location: MLABCELL_X28_Y4_N6
\Add4~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add4~53_sumout\ = SUM(( \r_add_st0[1][2]~q\ ) + ( \r_add_st0[0][2]~q\ ) + ( \Add4~58\ ))
-- \Add4~54\ = CARRY(( \r_add_st0[1][2]~q\ ) + ( \r_add_st0[0][2]~q\ ) + ( \Add4~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_r_add_st0[1][2]~q\,
	datac => \ALT_INV_r_add_st0[0][2]~q\,
	cin => \Add4~58\,
	sumout => \Add4~53_sumout\,
	cout => \Add4~54\);

-- Location: MLABCELL_X28_Y4_N9
\Add4~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add4~49_sumout\ = SUM(( \r_add_st0[0][3]~q\ ) + ( \r_add_st0[1][3]~q\ ) + ( \Add4~54\ ))
-- \Add4~50\ = CARRY(( \r_add_st0[0][3]~q\ ) + ( \r_add_st0[1][3]~q\ ) + ( \Add4~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st0[1][3]~q\,
	datad => \ALT_INV_r_add_st0[0][3]~q\,
	cin => \Add4~54\,
	sumout => \Add4~49_sumout\,
	cout => \Add4~50\);

-- Location: MLABCELL_X28_Y4_N12
\Add4~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add4~45_sumout\ = SUM(( \r_add_st0[0][4]~q\ ) + ( \r_add_st0[1][4]~q\ ) + ( \Add4~50\ ))
-- \Add4~46\ = CARRY(( \r_add_st0[0][4]~q\ ) + ( \r_add_st0[1][4]~q\ ) + ( \Add4~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st0[1][4]~q\,
	datad => \ALT_INV_r_add_st0[0][4]~q\,
	cin => \Add4~50\,
	sumout => \Add4~45_sumout\,
	cout => \Add4~46\);

-- Location: MLABCELL_X28_Y4_N15
\Add4~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add4~41_sumout\ = SUM(( \r_add_st0[0][5]~q\ ) + ( \r_add_st0[1][5]~q\ ) + ( \Add4~46\ ))
-- \Add4~42\ = CARRY(( \r_add_st0[0][5]~q\ ) + ( \r_add_st0[1][5]~q\ ) + ( \Add4~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st0[1][5]~q\,
	datad => \ALT_INV_r_add_st0[0][5]~q\,
	cin => \Add4~46\,
	sumout => \Add4~41_sumout\,
	cout => \Add4~42\);

-- Location: MLABCELL_X28_Y4_N18
\Add4~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add4~37_sumout\ = SUM(( \r_add_st0[0][6]~q\ ) + ( \r_add_st0[1][6]~q\ ) + ( \Add4~42\ ))
-- \Add4~38\ = CARRY(( \r_add_st0[0][6]~q\ ) + ( \r_add_st0[1][6]~q\ ) + ( \Add4~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_r_add_st0[1][6]~q\,
	datad => \ALT_INV_r_add_st0[0][6]~q\,
	cin => \Add4~42\,
	sumout => \Add4~37_sumout\,
	cout => \Add4~38\);

-- Location: MLABCELL_X28_Y4_N21
\Add4~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add4~33_sumout\ = SUM(( \r_add_st0[1][7]~q\ ) + ( \r_add_st0[0][7]~q\ ) + ( \Add4~38\ ))
-- \Add4~34\ = CARRY(( \r_add_st0[1][7]~q\ ) + ( \r_add_st0[0][7]~q\ ) + ( \Add4~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st0[0][7]~q\,
	datad => \ALT_INV_r_add_st0[1][7]~q\,
	cin => \Add4~38\,
	sumout => \Add4~33_sumout\,
	cout => \Add4~34\);

-- Location: MLABCELL_X28_Y4_N24
\Add4~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add4~29_sumout\ = SUM(( \r_add_st0[1][8]~q\ ) + ( \r_add_st0[0][8]~q\ ) + ( \Add4~34\ ))
-- \Add4~30\ = CARRY(( \r_add_st0[1][8]~q\ ) + ( \r_add_st0[0][8]~q\ ) + ( \Add4~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_r_add_st0[0][8]~q\,
	datac => \ALT_INV_r_add_st0[1][8]~q\,
	cin => \Add4~34\,
	sumout => \Add4~29_sumout\,
	cout => \Add4~30\);

-- Location: MLABCELL_X28_Y4_N27
\Add4~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add4~25_sumout\ = SUM(( \r_add_st0[0][9]~q\ ) + ( \r_add_st0[1][9]~q\ ) + ( \Add4~30\ ))
-- \Add4~26\ = CARRY(( \r_add_st0[0][9]~q\ ) + ( \r_add_st0[1][9]~q\ ) + ( \Add4~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st0[1][9]~q\,
	datad => \ALT_INV_r_add_st0[0][9]~q\,
	cin => \Add4~30\,
	sumout => \Add4~25_sumout\,
	cout => \Add4~26\);

-- Location: MLABCELL_X28_Y4_N30
\Add4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add4~1_sumout\ = SUM(( \r_add_st0[0][10]~q\ ) + ( \r_add_st0[1][10]~q\ ) + ( \Add4~26\ ))
-- \Add4~2\ = CARRY(( \r_add_st0[0][10]~q\ ) + ( \r_add_st0[1][10]~q\ ) + ( \Add4~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st0[1][10]~q\,
	datad => \ALT_INV_r_add_st0[0][10]~q\,
	cin => \Add4~26\,
	sumout => \Add4~1_sumout\,
	cout => \Add4~2\);

-- Location: FF_X28_Y4_N31
\r_add_st1[0][10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add4~1_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[0][10]~q\);

-- Location: FF_X30_Y4_N28
\r_add_st1[1][9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add5~25_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[1][9]~q\);

-- Location: FF_X28_Y4_N28
\r_add_st1[0][9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add4~25_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[0][9]~q\);

-- Location: FF_X28_Y4_N26
\r_add_st1[0][8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add4~29_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[0][8]~q\);

-- Location: FF_X30_Y4_N26
\r_add_st1[1][8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add5~29_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[1][8]~q\);

-- Location: FF_X30_Y4_N22
\r_add_st1[1][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add5~33_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[1][7]~q\);

-- Location: FF_X28_Y4_N22
\r_add_st1[0][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add4~33_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[0][7]~q\);

-- Location: FF_X30_Y4_N19
\r_add_st1[1][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add5~37_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[1][6]~q\);

-- Location: FF_X28_Y4_N19
\r_add_st1[0][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add4~37_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[0][6]~q\);

-- Location: FF_X28_Y4_N16
\r_add_st1[0][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add4~41_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[0][5]~q\);

-- Location: FF_X30_Y4_N17
\r_add_st1[1][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add5~41_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[1][5]~q\);

-- Location: FF_X30_Y4_N13
\r_add_st1[1][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add5~45_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[1][4]~q\);

-- Location: FF_X28_Y4_N13
\r_add_st1[0][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add4~45_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[0][4]~q\);

-- Location: FF_X28_Y4_N10
\r_add_st1[0][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add4~49_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[0][3]~q\);

-- Location: FF_X30_Y4_N11
\r_add_st1[1][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add5~49_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[1][3]~q\);

-- Location: FF_X28_Y4_N8
\r_add_st1[0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add4~53_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[0][2]~q\);

-- Location: FF_X30_Y4_N7
\r_add_st1[1][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add5~53_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[1][2]~q\);

-- Location: FF_X30_Y4_N5
\r_add_st1[1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add5~57_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[1][1]~q\);

-- Location: FF_X28_Y4_N4
\r_add_st1[0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add4~57_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[0][1]~q\);

-- Location: LABCELL_X27_Y4_N57
\r_add_st1[1][0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st1[1][0]~feeder_combout\ = ( \Add5~61_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add5~61_sumout\,
	combout => \r_add_st1[1][0]~feeder_combout\);

-- Location: FF_X27_Y4_N58
\r_add_st1[1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st1[1][0]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[1][0]~q\);

-- Location: FF_X27_Y4_N56
\r_add_st1[0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \Add4~61_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[0][0]~q\);

-- Location: LABCELL_X27_Y4_N0
\Add6~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add6~61_sumout\ = SUM(( \r_add_st1[0][0]~q\ ) + ( \r_add_st1[1][0]~q\ ) + ( !VCC ))
-- \Add6~62\ = CARRY(( \r_add_st1[0][0]~q\ ) + ( \r_add_st1[1][0]~q\ ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st1[1][0]~q\,
	datad => \ALT_INV_r_add_st1[0][0]~q\,
	cin => GND,
	sumout => \Add6~61_sumout\,
	cout => \Add6~62\);

-- Location: LABCELL_X27_Y4_N3
\Add6~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add6~57_sumout\ = SUM(( \r_add_st1[0][1]~q\ ) + ( \r_add_st1[1][1]~q\ ) + ( \Add6~62\ ))
-- \Add6~58\ = CARRY(( \r_add_st1[0][1]~q\ ) + ( \r_add_st1[1][1]~q\ ) + ( \Add6~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st1[1][1]~q\,
	datad => \ALT_INV_r_add_st1[0][1]~q\,
	cin => \Add6~62\,
	sumout => \Add6~57_sumout\,
	cout => \Add6~58\);

-- Location: LABCELL_X27_Y4_N6
\Add6~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add6~53_sumout\ = SUM(( \r_add_st1[1][2]~q\ ) + ( \r_add_st1[0][2]~q\ ) + ( \Add6~58\ ))
-- \Add6~54\ = CARRY(( \r_add_st1[1][2]~q\ ) + ( \r_add_st1[0][2]~q\ ) + ( \Add6~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st1[0][2]~q\,
	datad => \ALT_INV_r_add_st1[1][2]~q\,
	cin => \Add6~58\,
	sumout => \Add6~53_sumout\,
	cout => \Add6~54\);

-- Location: LABCELL_X27_Y4_N9
\Add6~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add6~49_sumout\ = SUM(( \r_add_st1[1][3]~q\ ) + ( \r_add_st1[0][3]~q\ ) + ( \Add6~54\ ))
-- \Add6~50\ = CARRY(( \r_add_st1[1][3]~q\ ) + ( \r_add_st1[0][3]~q\ ) + ( \Add6~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_r_add_st1[0][3]~q\,
	datac => \ALT_INV_r_add_st1[1][3]~q\,
	cin => \Add6~54\,
	sumout => \Add6~49_sumout\,
	cout => \Add6~50\);

-- Location: LABCELL_X27_Y4_N12
\Add6~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add6~45_sumout\ = SUM(( \r_add_st1[0][4]~q\ ) + ( \r_add_st1[1][4]~q\ ) + ( \Add6~50\ ))
-- \Add6~46\ = CARRY(( \r_add_st1[0][4]~q\ ) + ( \r_add_st1[1][4]~q\ ) + ( \Add6~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st1[1][4]~q\,
	datad => \ALT_INV_r_add_st1[0][4]~q\,
	cin => \Add6~50\,
	sumout => \Add6~45_sumout\,
	cout => \Add6~46\);

-- Location: LABCELL_X27_Y4_N15
\Add6~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add6~41_sumout\ = SUM(( \r_add_st1[1][5]~q\ ) + ( \r_add_st1[0][5]~q\ ) + ( \Add6~46\ ))
-- \Add6~42\ = CARRY(( \r_add_st1[1][5]~q\ ) + ( \r_add_st1[0][5]~q\ ) + ( \Add6~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st1[0][5]~q\,
	datad => \ALT_INV_r_add_st1[1][5]~q\,
	cin => \Add6~46\,
	sumout => \Add6~41_sumout\,
	cout => \Add6~42\);

-- Location: LABCELL_X27_Y4_N18
\Add6~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add6~37_sumout\ = SUM(( \r_add_st1[0][6]~q\ ) + ( \r_add_st1[1][6]~q\ ) + ( \Add6~42\ ))
-- \Add6~38\ = CARRY(( \r_add_st1[0][6]~q\ ) + ( \r_add_st1[1][6]~q\ ) + ( \Add6~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st1[1][6]~q\,
	datad => \ALT_INV_r_add_st1[0][6]~q\,
	cin => \Add6~42\,
	sumout => \Add6~37_sumout\,
	cout => \Add6~38\);

-- Location: LABCELL_X27_Y4_N21
\Add6~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add6~33_sumout\ = SUM(( \r_add_st1[0][7]~q\ ) + ( \r_add_st1[1][7]~q\ ) + ( \Add6~38\ ))
-- \Add6~34\ = CARRY(( \r_add_st1[0][7]~q\ ) + ( \r_add_st1[1][7]~q\ ) + ( \Add6~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st1[1][7]~q\,
	datad => \ALT_INV_r_add_st1[0][7]~q\,
	cin => \Add6~38\,
	sumout => \Add6~33_sumout\,
	cout => \Add6~34\);

-- Location: LABCELL_X27_Y4_N24
\Add6~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add6~29_sumout\ = SUM(( \r_add_st1[1][8]~q\ ) + ( \r_add_st1[0][8]~q\ ) + ( \Add6~34\ ))
-- \Add6~30\ = CARRY(( \r_add_st1[1][8]~q\ ) + ( \r_add_st1[0][8]~q\ ) + ( \Add6~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_r_add_st1[0][8]~q\,
	datac => \ALT_INV_r_add_st1[1][8]~q\,
	cin => \Add6~34\,
	sumout => \Add6~29_sumout\,
	cout => \Add6~30\);

-- Location: LABCELL_X27_Y4_N27
\Add6~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add6~25_sumout\ = SUM(( \r_add_st1[0][9]~q\ ) + ( \r_add_st1[1][9]~q\ ) + ( \Add6~30\ ))
-- \Add6~26\ = CARRY(( \r_add_st1[0][9]~q\ ) + ( \r_add_st1[1][9]~q\ ) + ( \Add6~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_r_add_st1[1][9]~q\,
	datad => \ALT_INV_r_add_st1[0][9]~q\,
	cin => \Add6~30\,
	sumout => \Add6~25_sumout\,
	cout => \Add6~26\);

-- Location: LABCELL_X27_Y4_N30
\Add6~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add6~1_sumout\ = SUM(( \r_add_st1[0][10]~q\ ) + ( \r_add_st1[1][10]~q\ ) + ( \Add6~26\ ))
-- \Add6~2\ = CARRY(( \r_add_st1[0][10]~q\ ) + ( \r_add_st1[1][10]~q\ ) + ( \Add6~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st1[1][10]~q\,
	datad => \ALT_INV_r_add_st1[0][10]~q\,
	cin => \Add6~26\,
	sumout => \Add6~1_sumout\,
	cout => \Add6~2\);

-- Location: FF_X27_Y4_N32
\r_add_st2[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add6~1_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_add_st2(10));

-- Location: FF_X21_Y4_N13
\p_data[7][0]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[6][0]~_Duplicate_1_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[7][0]~_Duplicate_1_q\);

-- Location: FF_X19_Y2_N20
\p_data[6][1]~_Duplicate_1DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[5][1]~_Duplicate_1_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[6][1]~_Duplicate_1DUPLICATE_q\);

-- Location: FF_X19_Y2_N16
\p_data[7][1]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[6][1]~_Duplicate_1DUPLICATE_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[7][1]~_Duplicate_1_q\);

-- Location: FF_X21_Y2_N10
\p_data[7][2]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[6][2]~_Duplicate_1_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[7][2]~_Duplicate_1_q\);

-- Location: FF_X19_Y4_N49
\p_data[7][3]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[6][3]~_Duplicate_1_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[7][3]~_Duplicate_1_q\);

-- Location: FF_X19_Y4_N55
\p_data[7][4]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[6][4]~_Duplicate_1_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[7][4]~_Duplicate_1_q\);

-- Location: FF_X21_Y4_N35
\p_data[6][5]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_data[6][5]~_Duplicate_1feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[6][5]~_Duplicate_1_q\);

-- Location: FF_X21_Y4_N43
\p_data[7][5]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \p_data[6][5]~_Duplicate_1_q\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_data[7][5]~_Duplicate_1_q\);

-- Location: DSP_X20_Y2_N0
\Mult8~8\ : cyclonev_mac
-- pragma translate_off
GENERIC MAP (
	accumulate_clock => "none",
	ax_clock => "0",
	ax_width => 7,
	ay_scan_in_clock => "0",
	ay_scan_in_width => 6,
	ay_use_scan_in => "false",
	az_clock => "none",
	bx_clock => "none",
	by_clock => "none",
	by_use_scan_in => "false",
	bz_clock => "none",
	coef_a_0 => 0,
	coef_a_1 => 0,
	coef_a_2 => 0,
	coef_a_3 => 0,
	coef_a_4 => 0,
	coef_a_5 => 0,
	coef_a_6 => 0,
	coef_a_7 => 0,
	coef_b_0 => 0,
	coef_b_1 => 0,
	coef_b_2 => 0,
	coef_b_3 => 0,
	coef_b_4 => 0,
	coef_b_5 => 0,
	coef_b_6 => 0,
	coef_b_7 => 0,
	coef_sel_a_clock => "none",
	coef_sel_b_clock => "none",
	delay_scan_out_ay => "false",
	delay_scan_out_by => "false",
	enable_double_accum => "false",
	load_const_clock => "none",
	load_const_value => 0,
	mode_sub_location => 0,
	negate_clock => "none",
	operand_source_max => "input",
	operand_source_may => "input",
	operand_source_mbx => "input",
	operand_source_mby => "input",
	operation_mode => "m9x9",
	output_clock => "0",
	preadder_subtract_a => "false",
	preadder_subtract_b => "false",
	result_a_width => 64,
	signed_max => "false",
	signed_may => "false",
	signed_mbx => "false",
	signed_mby => "false",
	sub_clock => "none",
	use_chainadder => "false")
-- pragma translate_on
PORT MAP (
	sub => GND,
	negate => GND,
	aclr => \Mult8~8_ACLR_bus\,
	clk => \Mult8~8_CLK_bus\,
	ena => \Mult8~8_ENA_bus\,
	ax => \Mult8~8_AX_bus\,
	ay => \Mult8~8_AY_bus\,
	resulta => \Mult8~8_RESULTA_bus\);

-- Location: FF_X27_Y4_N28
\r_add_st2[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add6~25_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_add_st2(9));

-- Location: FF_X27_Y4_N26
\r_add_st2[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add6~29_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_add_st2(8));

-- Location: FF_X27_Y4_N23
\r_add_st2[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add6~33_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_add_st2(7));

-- Location: FF_X27_Y4_N19
\r_add_st2[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add6~37_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_add_st2(6));

-- Location: FF_X27_Y4_N16
\r_add_st2[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add6~41_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_add_st2(5));

-- Location: FF_X27_Y4_N14
\r_add_st2[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add6~45_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_add_st2(4));

-- Location: FF_X27_Y4_N11
\r_add_st2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add6~49_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_add_st2(3));

-- Location: FF_X27_Y4_N8
\r_add_st2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add6~53_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_add_st2(2));

-- Location: FF_X27_Y4_N5
\r_add_st2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add6~57_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_add_st2(1));

-- Location: FF_X27_Y4_N1
\r_add_st2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add6~61_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_add_st2(0));

-- Location: MLABCELL_X21_Y2_N0
\Add7~62\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add7~62_cout\ = CARRY(( \r_mult[8][0]\ ) + ( r_add_st2(0) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_r_add_st2(0),
	datad => \ALT_INV_r_mult[8][0]\,
	cin => GND,
	cout => \Add7~62_cout\);

-- Location: MLABCELL_X21_Y2_N3
\Add7~58\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add7~58_cout\ = CARRY(( \r_mult[8][1]\ ) + ( r_add_st2(1) ) + ( \Add7~62_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_r_add_st2(1),
	datad => \ALT_INV_r_mult[8][1]\,
	cin => \Add7~62_cout\,
	cout => \Add7~58_cout\);

-- Location: MLABCELL_X21_Y2_N6
\Add7~54\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add7~54_cout\ = CARRY(( \r_mult[8][2]\ ) + ( r_add_st2(2) ) + ( \Add7~58_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_r_add_st2(2),
	datad => \ALT_INV_r_mult[8][2]\,
	cin => \Add7~58_cout\,
	cout => \Add7~54_cout\);

-- Location: MLABCELL_X21_Y2_N9
\Add7~50\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add7~50_cout\ = CARRY(( r_add_st2(3) ) + ( \r_mult[8][3]\ ) + ( \Add7~54_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_mult[8][3]\,
	datad => ALT_INV_r_add_st2(3),
	cin => \Add7~54_cout\,
	cout => \Add7~50_cout\);

-- Location: MLABCELL_X21_Y2_N12
\Add7~46\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add7~46_cout\ = CARRY(( r_add_st2(4) ) + ( \r_mult[8][4]\ ) + ( \Add7~50_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_mult[8][4]\,
	datad => ALT_INV_r_add_st2(4),
	cin => \Add7~50_cout\,
	cout => \Add7~46_cout\);

-- Location: MLABCELL_X21_Y2_N15
\Add7~42\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add7~42_cout\ = CARRY(( r_add_st2(5) ) + ( \r_mult[8][5]\ ) + ( \Add7~46_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_mult[8][5]\,
	datad => ALT_INV_r_add_st2(5),
	cin => \Add7~46_cout\,
	cout => \Add7~42_cout\);

-- Location: MLABCELL_X21_Y2_N18
\Add7~38\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add7~38_cout\ = CARRY(( \r_mult[8][6]\ ) + ( r_add_st2(6) ) + ( \Add7~42_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_r_add_st2(6),
	datad => \ALT_INV_r_mult[8][6]\,
	cin => \Add7~42_cout\,
	cout => \Add7~38_cout\);

-- Location: MLABCELL_X21_Y2_N21
\Add7~34\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add7~34_cout\ = CARRY(( \r_mult[8][7]\ ) + ( r_add_st2(7) ) + ( \Add7~38_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_r_add_st2(7),
	datad => \ALT_INV_r_mult[8][7]\,
	cin => \Add7~38_cout\,
	cout => \Add7~34_cout\);

-- Location: MLABCELL_X21_Y2_N24
\Add7~30\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add7~30_cout\ = CARRY(( \r_mult[8][8]\ ) + ( r_add_st2(8) ) + ( \Add7~34_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_r_add_st2(8),
	datad => \ALT_INV_r_mult[8][8]\,
	cin => \Add7~34_cout\,
	cout => \Add7~30_cout\);

-- Location: MLABCELL_X21_Y2_N27
\Add7~26\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add7~26_cout\ = CARRY(( \r_mult[8][9]\ ) + ( r_add_st2(9) ) + ( \Add7~30_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_r_add_st2(9),
	datad => \ALT_INV_r_mult[8][9]\,
	cin => \Add7~30_cout\,
	cout => \Add7~26_cout\);

-- Location: MLABCELL_X21_Y2_N30
\Add7~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add7~1_sumout\ = SUM(( \r_mult[8][10]\ ) + ( r_add_st2(10) ) + ( \Add7~26_cout\ ))
-- \Add7~2\ = CARRY(( \r_mult[8][10]\ ) + ( r_add_st2(10) ) + ( \Add7~26_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_r_add_st2(10),
	datad => \ALT_INV_r_mult[8][10]\,
	cin => \Add7~26_cout\,
	sumout => \Add7~1_sumout\,
	cout => \Add7~2\);

-- Location: FF_X21_Y2_N32
\r_add_st3[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add7~1_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_add_st3(10));

-- Location: MLABCELL_X21_Y2_N51
\o_data[0]~reg0feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \o_data[0]~reg0feeder_combout\ = r_add_st3(10)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_r_add_st3(10),
	combout => \o_data[0]~reg0feeder_combout\);

-- Location: FF_X21_Y2_N52
\o_data[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \o_data[0]~reg0feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_data[0]~reg0_q\);

-- Location: LABCELL_X29_Y4_N24
\r_add_st0[1][11]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[1][11]~feeder_combout\ = ( \Add1~mac_pl[0][11]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add1~mac_pl[0][11]\,
	combout => \r_add_st0[1][11]~feeder_combout\);

-- Location: FF_X29_Y4_N26
\r_add_st0[1][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[1][11]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[1][11]~q\);

-- Location: LABCELL_X31_Y6_N36
\r_add_st0[0][11]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[0][11]~feeder_combout\ = ( \Add0~mac_pl[0][11]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add0~mac_pl[0][11]\,
	combout => \r_add_st0[0][11]~feeder_combout\);

-- Location: FF_X31_Y6_N38
\r_add_st0[0][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[0][11]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[0][11]~q\);

-- Location: MLABCELL_X28_Y4_N33
\Add4~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add4~5_sumout\ = SUM(( \r_add_st0[0][11]~q\ ) + ( \r_add_st0[1][11]~q\ ) + ( \Add4~2\ ))
-- \Add4~6\ = CARRY(( \r_add_st0[0][11]~q\ ) + ( \r_add_st0[1][11]~q\ ) + ( \Add4~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st0[1][11]~q\,
	datad => \ALT_INV_r_add_st0[0][11]~q\,
	cin => \Add4~2\,
	sumout => \Add4~5_sumout\,
	cout => \Add4~6\);

-- Location: FF_X28_Y4_N35
\r_add_st1[0][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add4~5_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[0][11]~q\);

-- Location: FF_X31_Y4_N44
\r_add_st0[2][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \Add2~mac_pl[0][11]\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[2][11]~q\);

-- Location: FF_X30_Y4_N1
\r_add_st0[3][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \Add3~mac_pl[0][11]\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[3][11]~q\);

-- Location: LABCELL_X30_Y4_N33
\Add5~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add5~5_sumout\ = SUM(( \r_add_st0[3][11]~q\ ) + ( \r_add_st0[2][11]~q\ ) + ( \Add5~2\ ))
-- \Add5~6\ = CARRY(( \r_add_st0[3][11]~q\ ) + ( \r_add_st0[2][11]~q\ ) + ( \Add5~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st0[2][11]~q\,
	datad => \ALT_INV_r_add_st0[3][11]~q\,
	cin => \Add5~2\,
	sumout => \Add5~5_sumout\,
	cout => \Add5~6\);

-- Location: FF_X30_Y4_N34
\r_add_st1[1][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add5~5_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[1][11]~q\);

-- Location: LABCELL_X27_Y4_N33
\Add6~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add6~5_sumout\ = SUM(( \r_add_st1[1][11]~q\ ) + ( \r_add_st1[0][11]~q\ ) + ( \Add6~2\ ))
-- \Add6~6\ = CARRY(( \r_add_st1[1][11]~q\ ) + ( \r_add_st1[0][11]~q\ ) + ( \Add6~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_r_add_st1[0][11]~q\,
	datac => \ALT_INV_r_add_st1[1][11]~q\,
	cin => \Add6~2\,
	sumout => \Add6~5_sumout\,
	cout => \Add6~6\);

-- Location: FF_X27_Y4_N34
\r_add_st2[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add6~5_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_add_st2(11));

-- Location: MLABCELL_X21_Y2_N33
\Add7~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add7~5_sumout\ = SUM(( \r_mult[8][11]\ ) + ( r_add_st2(11) ) + ( \Add7~2\ ))
-- \Add7~6\ = CARRY(( \r_mult[8][11]\ ) + ( r_add_st2(11) ) + ( \Add7~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_r_add_st2(11),
	datad => \ALT_INV_r_mult[8][11]\,
	cin => \Add7~2\,
	sumout => \Add7~5_sumout\,
	cout => \Add7~6\);

-- Location: FF_X21_Y2_N34
\r_add_st3[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add7~5_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_add_st3(11));

-- Location: FF_X22_Y2_N1
\o_data[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => r_add_st3(11),
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_data[1]~reg0_q\);

-- Location: FF_X31_Y2_N58
\r_add_st0[2][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \Add2~mac_pl[0][12]\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[2][12]~q\);

-- Location: MLABCELL_X25_Y4_N45
\r_add_st0[3][12]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[3][12]~feeder_combout\ = ( \Add3~mac_pl[0][12]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add3~mac_pl[0][12]\,
	combout => \r_add_st0[3][12]~feeder_combout\);

-- Location: FF_X25_Y4_N46
\r_add_st0[3][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[3][12]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[3][12]~q\);

-- Location: LABCELL_X30_Y4_N36
\Add5~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add5~9_sumout\ = SUM(( \r_add_st0[3][12]~q\ ) + ( \r_add_st0[2][12]~q\ ) + ( \Add5~6\ ))
-- \Add5~10\ = CARRY(( \r_add_st0[3][12]~q\ ) + ( \r_add_st0[2][12]~q\ ) + ( \Add5~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st0[2][12]~q\,
	datad => \ALT_INV_r_add_st0[3][12]~q\,
	cin => \Add5~6\,
	sumout => \Add5~9_sumout\,
	cout => \Add5~10\);

-- Location: FF_X30_Y4_N37
\r_add_st1[1][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add5~9_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[1][12]~q\);

-- Location: LABCELL_X31_Y6_N21
\r_add_st0[0][12]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[0][12]~feeder_combout\ = ( \Add0~mac_pl[0][12]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add0~mac_pl[0][12]\,
	combout => \r_add_st0[0][12]~feeder_combout\);

-- Location: FF_X31_Y6_N22
\r_add_st0[0][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[0][12]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[0][12]~q\);

-- Location: FF_X29_Y4_N29
\r_add_st0[1][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \Add1~mac_pl[0][12]\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[1][12]~q\);

-- Location: MLABCELL_X28_Y4_N36
\Add4~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add4~9_sumout\ = SUM(( \r_add_st0[1][12]~q\ ) + ( \r_add_st0[0][12]~q\ ) + ( \Add4~6\ ))
-- \Add4~10\ = CARRY(( \r_add_st0[1][12]~q\ ) + ( \r_add_st0[0][12]~q\ ) + ( \Add4~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st0[0][12]~q\,
	datad => \ALT_INV_r_add_st0[1][12]~q\,
	cin => \Add4~6\,
	sumout => \Add4~9_sumout\,
	cout => \Add4~10\);

-- Location: FF_X28_Y4_N37
\r_add_st1[0][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add4~9_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[0][12]~q\);

-- Location: LABCELL_X27_Y4_N36
\Add6~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add6~9_sumout\ = SUM(( \r_add_st1[0][12]~q\ ) + ( \r_add_st1[1][12]~q\ ) + ( \Add6~6\ ))
-- \Add6~10\ = CARRY(( \r_add_st1[0][12]~q\ ) + ( \r_add_st1[1][12]~q\ ) + ( \Add6~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st1[1][12]~q\,
	datad => \ALT_INV_r_add_st1[0][12]~q\,
	cin => \Add6~6\,
	sumout => \Add6~9_sumout\,
	cout => \Add6~10\);

-- Location: FF_X27_Y4_N38
\r_add_st2[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add6~9_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_add_st2(12));

-- Location: MLABCELL_X21_Y2_N36
\Add7~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add7~9_sumout\ = SUM(( \r_mult[8][12]\ ) + ( r_add_st2(12) ) + ( \Add7~6\ ))
-- \Add7~10\ = CARRY(( \r_mult[8][12]\ ) + ( r_add_st2(12) ) + ( \Add7~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_r_add_st2(12),
	datad => \ALT_INV_r_mult[8][12]\,
	cin => \Add7~6\,
	sumout => \Add7~9_sumout\,
	cout => \Add7~10\);

-- Location: FF_X21_Y2_N37
\r_add_st3[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add7~9_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_add_st3(12));

-- Location: LABCELL_X27_Y2_N24
\o_data[2]~reg0feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \o_data[2]~reg0feeder_combout\ = r_add_st3(12)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_r_add_st3(12),
	combout => \o_data[2]~reg0feeder_combout\);

-- Location: FF_X27_Y2_N25
\o_data[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \o_data[2]~reg0feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_data[2]~reg0_q\);

-- Location: FF_X31_Y4_N5
\r_add_st0[1][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \Add1~mac_pl[0][13]\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[1][13]~q\);

-- Location: LABCELL_X31_Y6_N3
\r_add_st0[0][13]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[0][13]~feeder_combout\ = ( \Add0~mac_pl[0][13]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add0~mac_pl[0][13]\,
	combout => \r_add_st0[0][13]~feeder_combout\);

-- Location: FF_X31_Y6_N4
\r_add_st0[0][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[0][13]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[0][13]~q\);

-- Location: MLABCELL_X28_Y4_N39
\Add4~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add4~13_sumout\ = SUM(( \r_add_st0[0][13]~q\ ) + ( \r_add_st0[1][13]~q\ ) + ( \Add4~10\ ))
-- \Add4~14\ = CARRY(( \r_add_st0[0][13]~q\ ) + ( \r_add_st0[1][13]~q\ ) + ( \Add4~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_r_add_st0[1][13]~q\,
	datad => \ALT_INV_r_add_st0[0][13]~q\,
	cin => \Add4~10\,
	sumout => \Add4~13_sumout\,
	cout => \Add4~14\);

-- Location: FF_X28_Y4_N41
\r_add_st1[0][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add4~13_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[0][13]~q\);

-- Location: MLABCELL_X25_Y4_N54
\r_add_st0[3][13]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[3][13]~feeder_combout\ = ( \Add3~mac_pl[0][13]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add3~mac_pl[0][13]\,
	combout => \r_add_st0[3][13]~feeder_combout\);

-- Location: FF_X25_Y4_N55
\r_add_st0[3][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[3][13]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[3][13]~q\);

-- Location: LABCELL_X31_Y2_N30
\r_add_st0[2][13]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[2][13]~feeder_combout\ = ( \Add2~mac_pl[0][13]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add2~mac_pl[0][13]\,
	combout => \r_add_st0[2][13]~feeder_combout\);

-- Location: FF_X31_Y2_N31
\r_add_st0[2][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[2][13]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[2][13]~q\);

-- Location: LABCELL_X30_Y4_N39
\Add5~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add5~13_sumout\ = SUM(( \r_add_st0[2][13]~q\ ) + ( \r_add_st0[3][13]~q\ ) + ( \Add5~10\ ))
-- \Add5~14\ = CARRY(( \r_add_st0[2][13]~q\ ) + ( \r_add_st0[3][13]~q\ ) + ( \Add5~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st0[3][13]~q\,
	datad => \ALT_INV_r_add_st0[2][13]~q\,
	cin => \Add5~10\,
	sumout => \Add5~13_sumout\,
	cout => \Add5~14\);

-- Location: FF_X30_Y4_N40
\r_add_st1[1][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add5~13_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[1][13]~q\);

-- Location: LABCELL_X27_Y4_N39
\Add6~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add6~13_sumout\ = SUM(( \r_add_st1[1][13]~q\ ) + ( \r_add_st1[0][13]~q\ ) + ( \Add6~10\ ))
-- \Add6~14\ = CARRY(( \r_add_st1[1][13]~q\ ) + ( \r_add_st1[0][13]~q\ ) + ( \Add6~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_r_add_st1[0][13]~q\,
	datac => \ALT_INV_r_add_st1[1][13]~q\,
	cin => \Add6~10\,
	sumout => \Add6~13_sumout\,
	cout => \Add6~14\);

-- Location: FF_X27_Y4_N40
\r_add_st2[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add6~13_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_add_st2(13));

-- Location: MLABCELL_X21_Y2_N39
\Add7~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add7~13_sumout\ = SUM(( \r_mult[8][13]\ ) + ( r_add_st2(13) ) + ( \Add7~10\ ))
-- \Add7~14\ = CARRY(( \r_mult[8][13]\ ) + ( r_add_st2(13) ) + ( \Add7~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_r_add_st2(13),
	datad => \ALT_INV_r_mult[8][13]\,
	cin => \Add7~10\,
	sumout => \Add7~13_sumout\,
	cout => \Add7~14\);

-- Location: FF_X21_Y2_N41
\r_add_st3[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add7~13_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_add_st3(13));

-- Location: MLABCELL_X21_Y2_N54
\o_data[3]~reg0feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \o_data[3]~reg0feeder_combout\ = r_add_st3(13)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_r_add_st3(13),
	combout => \o_data[3]~reg0feeder_combout\);

-- Location: FF_X21_Y2_N55
\o_data[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \o_data[3]~reg0feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_data[3]~reg0_q\);

-- Location: LABCELL_X31_Y4_N18
\r_add_st0[1][14]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[1][14]~feeder_combout\ = ( \Add1~mac_pl[0][14]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add1~mac_pl[0][14]\,
	combout => \r_add_st0[1][14]~feeder_combout\);

-- Location: FF_X31_Y4_N20
\r_add_st0[1][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[1][14]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[1][14]~q\);

-- Location: LABCELL_X31_Y6_N6
\r_add_st0[0][14]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[0][14]~feeder_combout\ = ( \Add0~mac_pl[0][14]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add0~mac_pl[0][14]\,
	combout => \r_add_st0[0][14]~feeder_combout\);

-- Location: FF_X31_Y6_N8
\r_add_st0[0][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[0][14]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[0][14]~q\);

-- Location: MLABCELL_X28_Y4_N42
\Add4~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add4~17_sumout\ = SUM(( \r_add_st0[0][14]~q\ ) + ( \r_add_st0[1][14]~q\ ) + ( \Add4~14\ ))
-- \Add4~18\ = CARRY(( \r_add_st0[0][14]~q\ ) + ( \r_add_st0[1][14]~q\ ) + ( \Add4~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st0[1][14]~q\,
	datad => \ALT_INV_r_add_st0[0][14]~q\,
	cin => \Add4~14\,
	sumout => \Add4~17_sumout\,
	cout => \Add4~18\);

-- Location: FF_X28_Y4_N44
\r_add_st1[0][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add4~17_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[0][14]~q\);

-- Location: LABCELL_X31_Y2_N45
\r_add_st0[2][14]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \r_add_st0[2][14]~feeder_combout\ = ( \Add2~mac_pl[0][14]\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add2~mac_pl[0][14]\,
	combout => \r_add_st0[2][14]~feeder_combout\);

-- Location: FF_X31_Y2_N47
\r_add_st0[2][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \r_add_st0[2][14]~feeder_combout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[2][14]~q\);

-- Location: FF_X25_Y4_N49
\r_add_st0[3][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \Add3~mac_pl[0][14]\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st0[3][14]~q\);

-- Location: LABCELL_X30_Y4_N42
\Add5~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add5~17_sumout\ = SUM(( \r_add_st0[3][14]~q\ ) + ( \r_add_st0[2][14]~q\ ) + ( \Add5~14\ ))
-- \Add5~18\ = CARRY(( \r_add_st0[3][14]~q\ ) + ( \r_add_st0[2][14]~q\ ) + ( \Add5~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_r_add_st0[2][14]~q\,
	datac => \ALT_INV_r_add_st0[3][14]~q\,
	cin => \Add5~14\,
	sumout => \Add5~17_sumout\,
	cout => \Add5~18\);

-- Location: FF_X30_Y4_N43
\r_add_st1[1][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add5~17_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[1][14]~q\);

-- Location: LABCELL_X27_Y4_N42
\Add6~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add6~17_sumout\ = SUM(( \r_add_st1[1][14]~q\ ) + ( \r_add_st1[0][14]~q\ ) + ( \Add6~14\ ))
-- \Add6~18\ = CARRY(( \r_add_st1[1][14]~q\ ) + ( \r_add_st1[0][14]~q\ ) + ( \Add6~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_r_add_st1[0][14]~q\,
	datac => \ALT_INV_r_add_st1[1][14]~q\,
	cin => \Add6~14\,
	sumout => \Add6~17_sumout\,
	cout => \Add6~18\);

-- Location: FF_X27_Y4_N44
\r_add_st2[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add6~17_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_add_st2(14));

-- Location: MLABCELL_X21_Y2_N42
\Add7~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add7~17_sumout\ = SUM(( r_add_st2(14) ) + ( GND ) + ( \Add7~14\ ))
-- \Add7~18\ = CARRY(( r_add_st2(14) ) + ( GND ) + ( \Add7~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_r_add_st2(14),
	cin => \Add7~14\,
	sumout => \Add7~17_sumout\,
	cout => \Add7~18\);

-- Location: FF_X21_Y2_N44
\r_add_st3[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add7~17_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_add_st3(14));

-- Location: FF_X21_Y2_N49
\o_data[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => r_add_st3(14),
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_data[4]~reg0_q\);

-- Location: MLABCELL_X28_Y4_N45
\Add4~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add4~21_sumout\ = SUM(( GND ) + ( GND ) + ( \Add4~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \Add4~18\,
	sumout => \Add4~21_sumout\);

-- Location: FF_X28_Y4_N46
\r_add_st1[0][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add4~21_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[0][15]~q\);

-- Location: LABCELL_X30_Y4_N45
\Add5~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add5~21_sumout\ = SUM(( GND ) + ( GND ) + ( \Add5~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \Add5~18\,
	sumout => \Add5~21_sumout\);

-- Location: FF_X30_Y4_N46
\r_add_st1[1][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add5~21_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r_add_st1[1][15]~q\);

-- Location: LABCELL_X27_Y4_N45
\Add6~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add6~21_sumout\ = SUM(( \r_add_st1[1][15]~q\ ) + ( \r_add_st1[0][15]~q\ ) + ( \Add6~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_r_add_st1[0][15]~q\,
	datad => \ALT_INV_r_add_st1[1][15]~q\,
	cin => \Add6~18\,
	sumout => \Add6~21_sumout\);

-- Location: FF_X27_Y4_N47
\r_add_st2[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add6~21_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_add_st2(15));

-- Location: MLABCELL_X21_Y2_N45
\Add7~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add7~21_sumout\ = SUM(( r_add_st2(15) ) + ( GND ) + ( \Add7~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_r_add_st2(15),
	cin => \Add7~18\,
	sumout => \Add7~21_sumout\);

-- Location: FF_X21_Y2_N46
\r_add_st3[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \Add7~21_sumout\,
	clrn => \i_rstb~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_add_st3(15));

-- Location: FF_X21_Y2_N16
\o_data[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => r_add_st3(15),
	clrn => \i_rstb~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_data[5]~reg0_q\);

-- Location: LABCELL_X45_Y21_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


