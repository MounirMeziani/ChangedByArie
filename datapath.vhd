

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY datapath IS 
	PORT
	(
		PCout :  IN  STD_LOGIC;
		R0out :  IN  STD_LOGIC;
		R1out :  IN  STD_LOGIC;
		R2out :  IN  STD_LOGIC;
		R3out :  IN  STD_LOGIC;
		R4out :  IN  STD_LOGIC;
		R5out :  IN  STD_LOGIC;
		R6out :  IN  STD_LOGIC;
		R7out :  IN  STD_LOGIC;
		R8out :  IN  STD_LOGIC;
		R9out :  IN  STD_LOGIC;
		R10out :  IN  STD_LOGIC;
		R11out :  IN  STD_LOGIC;
		R12out :  IN  STD_LOGIC;
		R13out :  IN  STD_LOGIC;
		R14out :  IN  STD_LOGIC;
		R15out :  IN  STD_LOGIC;
		HIout :  IN  STD_LOGIC;
		LOout :  IN  STD_LOGIC;
		Zhighout :  IN  STD_LOGIC;
		Zlowout :  IN  STD_LOGIC;
		MDRout :  IN  STD_LOGIC;
		Cout :  IN  STD_LOGIC;
		PCin :   IN STD_LOGIC;
		Clear :  IN  STD_LOGIC;
		Clock :  IN  STD_LOGIC;
		R0in :  IN  STD_LOGIC;
		R1in :  IN  STD_LOGIC;
		R2in :  IN  STD_LOGIC;
		R3in :  IN  STD_LOGIC;
		R4in :  IN  STD_LOGIC;
		R5in :  IN  STD_LOGIC;
		R6in :  IN  STD_LOGIC;
		R7in :  IN  STD_LOGIC;
		R8in :  IN  STD_LOGIC;
		R9in :  IN  STD_LOGIC;
		R10in :  IN  STD_LOGIC;
		R11in :  IN  STD_LOGIC;
		R12in :  IN  STD_LOGIC;
		R13in :  IN  STD_LOGIC;
		R14in :  IN  STD_LOGIC;
		R15in :  IN  STD_LOGIC;
		HIin :  IN  STD_LOGIC;
		LOin :  IN  STD_LOGIC;
		Yin :  IN  STD_LOGIC;
		Zin :  IN  STD_LOGIC;
		MDRin :  IN  STD_LOGIC;
		Read_mem :  IN  STD_LOGIC;
		IRin :  IN  STD_LOGIC;
		MARin :  IN  STD_LOGIC;
		In_portout :  IN  STD_LOGIC;
		X_CLA :  IN  STD_LOGIC;
		ADD_op :  IN  STD_LOGIC;
		SUB_op :  IN  STD_LOGIC;
		AND_op :  IN  STD_LOGIC;
		OR_op :  IN  STD_LOGIC;
		SHR_op :  IN  STD_LOGIC;
		SHL_opL :  IN  STD_LOGIC;
		ROR_op :  IN  STD_LOGIC;
		ROL_op :  IN  STD_LOGIC;
		MUL_op :  IN  STD_LOGIC;
		DIV_op :  IN  STD_LOGIC;
		NEG_op :  IN  STD_LOGIC;
		NOT_op :  IN  STD_LOGIC;
		IncPC_op :  IN  STD_LOGIC;
		Mdatain :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		X_CSign :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		X_inPort :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		X_out1 :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		X_out2 :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		X_Result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		
		BusMuxOut : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		R5contents : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END datapath;

ARCHITECTURE bdf_type OF datapath IS 

COMPONENT register32
	PORT(ld : IN STD_LOGIC;
		 clr : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 d : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT register64
	PORT(ld : IN STD_LOGIC;
		 clr : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 d : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END COMPONENT;

COMPONENT encoder
	PORT(R0_out : IN STD_LOGIC;
		 R1_out : IN STD_LOGIC;
		 R2_out : IN STD_LOGIC;
		 R3_out : IN STD_LOGIC;
		 R4_out : IN STD_LOGIC;
		 R5_out : IN STD_LOGIC;
		 R6_out : IN STD_LOGIC;
		 R7_out : IN STD_LOGIC;
		 R8_out : IN STD_LOGIC;
		 R9_out : IN STD_LOGIC;
		 R10_out : IN STD_LOGIC;
		 R11_out : IN STD_LOGIC;
		 R12_out : IN STD_LOGIC;
		 R13_out : IN STD_LOGIC;
		 R14_out : IN STD_LOGIC;
		 R15_out : IN STD_LOGIC;
		 HI_out : IN STD_LOGIC;
		 LO_out : IN STD_LOGIC;
		 Z_high_out : IN STD_LOGIC;
		 Z_low_out : IN STD_LOGIC;
		 PC_out : IN STD_LOGIC;
		 MDR_out : IN STD_LOGIC;
		 In_port_out : IN STD_LOGIC;
		 C_out : IN STD_LOGIC;
		 s : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT GPRegisterblock
	PORT(R0_in : IN STD_LOGIC;
		 R1_in : IN STD_LOGIC;
		 R2_in : IN STD_LOGIC;
		 R3_in : IN STD_LOGIC;
		 R4_in : IN STD_LOGIC;
		 R5_in : IN STD_LOGIC;
		 R6_in : IN STD_LOGIC;
		 R7_in : IN STD_LOGIC;
		 R8_in : IN STD_LOGIC;
		 R9_in : IN STD_LOGIC;
		 R10_in : IN STD_LOGIC;
		 R11_in : IN STD_LOGIC;
		 R12_in : IN STD_LOGIC;
		 R13_in : IN STD_LOGIC;
		 R14_in : IN STD_LOGIC;
		 R15_in : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 clr : IN STD_LOGIC;
		 d : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R0_busmuxin : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R10_busmuxin : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R11_busmuxin : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R12_busmuxin : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R13_busmuxin : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R14_busmuxin : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R15_busmuxin : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R1_busmuxin : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R2_busmuxin : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R3_busmuxin : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R4_busmuxin : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R5_busmuxin : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R6_busmuxin : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R7_busmuxin : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R8_busmuxin : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R9_busmuxin : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		 
	);
END COMPONENT;

COMPONENT mdmux
	PORT(mem_read : IN STD_LOGIC;
		 bus_mux_out : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 mem_data_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 mem_mux_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT ALU
	PORT(ADD : IN STD_LOGIC;
		 SUB : IN STD_LOGIC;
		 ANDop : IN STD_LOGIC;
		 ORop : IN STD_LOGIC;
		 SHR : IN STD_LOGIC;
		 SHL : IN STD_LOGIC;
		 ROTR : IN STD_LOGIC;
		 ROTL : IN STD_LOGIC;
		 MUL : IN STD_LOGIC;
		 DIV : IN STD_LOGIC;
		 NEG : IN STD_LOGIC;
		 NOTop : IN STD_LOGIC;
		 IncPC : IN STD_LOGIC;
		 claADD : IN STD_LOGIC;
		 Ain : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Bin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Zout : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END COMPONENT;

COMPONENT multiplexor
	PORT(a : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 C_signextended : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 HI_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In_port_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 LO_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 MDR_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 PC_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R0_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R10_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R11_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R12_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R13_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R14_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R15_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R1_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R2_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R3_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R4_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R5_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R6_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R7_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R8_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R9_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Z_HI_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Z_low_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxOut : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	q :  STD_LOGIC_VECTOR(63 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_33 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(63 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_23 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_24 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_25 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_26 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_27 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_28 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_29 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_30 :  STD_LOGIC_VECTOR(31 DOWNTO 0);


BEGIN 



b2v_Mux_1 : multiplexor
PORT MAP(a => SYNTHESIZED_WIRE_10,
		 C_signextended => X_CSign,
		 HI_busmuxin => SYNTHESIZED_WIRE_11,
		 In_port_busmuxin => X_inPort,
		 LO_busmuxin => SYNTHESIZED_WIRE_12,
		 MDR_busmuxin => SYNTHESIZED_WIRE_13,
		 PC_busmuxin => SYNTHESIZED_WIRE_14,
		 R0_busmuxin => SYNTHESIZED_WIRE_15,
		 R10_busmuxin => SYNTHESIZED_WIRE_16,
		 R11_busmuxin => SYNTHESIZED_WIRE_17,
		 R12_busmuxin => SYNTHESIZED_WIRE_18,
		 R13_busmuxin => SYNTHESIZED_WIRE_19,
		 R14_busmuxin => SYNTHESIZED_WIRE_20,
		 R15_busmuxin => SYNTHESIZED_WIRE_21,
		 R1_busmuxin => SYNTHESIZED_WIRE_22,
		 R2_busmuxin => SYNTHESIZED_WIRE_23,
		 R3_busmuxin => SYNTHESIZED_WIRE_24,
		 R4_busmuxin => SYNTHESIZED_WIRE_25,
		 R5_busmuxin => SYNTHESIZED_WIRE_26,
		 R6_busmuxin => SYNTHESIZED_WIRE_27,
		 R7_busmuxin => SYNTHESIZED_WIRE_28,
		 R8_busmuxin => SYNTHESIZED_WIRE_29,
		 R9_busmuxin => SYNTHESIZED_WIRE_30,
		 Z_HI_busmuxin => q(63 DOWNTO 32),
		 Z_low_busmuxin => q(31 DOWNTO 0),
		 BusMuxOut => SYNTHESIZED_WIRE_33
		 );

		 

b2v_HI : register32
PORT MAP(ld => HIin,
		 clr => Clear,
		 clk => Clock,
		 d => SYNTHESIZED_WIRE_33,
		 q => SYNTHESIZED_WIRE_11);


b2v_inst : register64
PORT MAP(ld => Zin,
		 clr => Clear,
		 clk => Clock,
		 d => SYNTHESIZED_WIRE_1,
		 q => q);


b2v_inst1 : encoder
PORT MAP(R0_out => R0out,
		 R1_out => R1out,
		 R2_out => R2out,
		 R3_out => R3out,
		 R4_out => R4out,
		 R5_out => R5out,
		 R6_out => R6out,
		 R7_out => R7out,
		 R8_out => R8out,
		 R9_out => R9out,
		 R10_out => R10out,
		 R11_out => R11out,
		 R12_out => R12out,
		 R13_out => R13out,
		 R14_out => R14out,
		 R15_out => R15out,
		 HI_out => HIout,
		 LO_out => LOout,
		 Z_high_out => Zhighout,
		 Z_low_out => Zlowout,
		 PC_out => PCout,
		 MDR_out => MDRout,
		 In_port_out => In_portout,
		 C_out => Cout,
		 s => SYNTHESIZED_WIRE_10);


b2v_inst11 : gpregisterblock
PORT MAP(R0_in => R0in,
		 R1_in => R1in,
		 R2_in => R2in,
		 R3_in => R3in,
		 R4_in => R4in,
		 R5_in => R5in,
		 R6_in => R6in,
		 R7_in => R7in,
		 R8_in => R8in,
		 R9_in => R9in,
		 R10_in => R10in,
		 R11_in => R11in,
		 R12_in => R12in,
		 R13_in => R13in,
		 R14_in => R14in,
		 R15_in => R15in,
		 clk => Clock,
		 clr => Clear,
		 d => SYNTHESIZED_WIRE_33,
		 R0_busmuxin => SYNTHESIZED_WIRE_15,
		 R10_busmuxin => SYNTHESIZED_WIRE_22,
		 R11_busmuxin => SYNTHESIZED_WIRE_23,
		 R12_busmuxin => SYNTHESIZED_WIRE_24,
		 R13_busmuxin => SYNTHESIZED_WIRE_25,
		 R14_busmuxin => SYNTHESIZED_WIRE_26,
		 R15_busmuxin => SYNTHESIZED_WIRE_27,
		 R1_busmuxin => SYNTHESIZED_WIRE_28,
		 R2_busmuxin => SYNTHESIZED_WIRE_29,
		 R3_busmuxin => SYNTHESIZED_WIRE_30,
		 R4_busmuxin => SYNTHESIZED_WIRE_16,
		 R5_busmuxin => SYNTHESIZED_WIRE_17,
		 R6_busmuxin => SYNTHESIZED_WIRE_18,
		 R7_busmuxin => SYNTHESIZED_WIRE_19,
		 R8_busmuxin => SYNTHESIZED_WIRE_20,
		 R9_busmuxin => SYNTHESIZED_WIRE_21);


b2v_inst20 : mdmux
PORT MAP(mem_read => Read_mem,
		 bus_mux_out => SYNTHESIZED_WIRE_33,
		 mem_data_in => Mdatain,
		 mem_mux_out => SYNTHESIZED_WIRE_9);


b2v_inst9 : ALU
PORT MAP(ADD => ADD_op,
		 SUB => SUB_op,
		 ANDop => AND_op,
		 ORop => OR_op,
		 SHR => SHR_op,
		 SHL => SHL_opL,
		 ROTR => ROR_op,
		 ROTL => ROL_op,
		 MUL => MUL_op,
		 DIV => DIV_op,
		 NEG => NEG_op,
		 NOTop => NOT_op,
		 IncPC => IncPC_op,
		 claADD => X_CLA,
		 Ain => SYNTHESIZED_WIRE_33,
		 Bin => SYNTHESIZED_WIRE_5,
		 Zout => SYNTHESIZED_WIRE_1);


b2v_IR : register32
PORT MAP(ld => IRin,
		 clr => Clear,
		 clk => Clock,
		 d => SYNTHESIZED_WIRE_33,
		 q => X_out1);


b2v_LO : register32
PORT MAP(ld => LOin,
		 clr => Clear,
		 clk => Clock,
		 d => SYNTHESIZED_WIRE_33,
		 q => SYNTHESIZED_WIRE_12);


b2v_MAR : register32
PORT MAP(ld => MARin,
		 clr => Clear,
		 clk => Clock,
		 d => SYNTHESIZED_WIRE_33,
		 q => X_out2);


b2v_MDR : register32
PORT MAP(ld => MDRin,
		 clr => Clear,
		 clk => Clock,
		 d => SYNTHESIZED_WIRE_9,
		 q => SYNTHESIZED_WIRE_13);



b2v_PC : register32
PORT MAP(
		 ld => PCin,
		 clr => Clear,
		 clk => Clock,
		 d => SYNTHESIZED_WIRE_33,
		 q => SYNTHESIZED_WIRE_14);


b2v_Y : register32
PORT MAP(
		 ld => Yin,
		 clr => Clear,
		 clk => Clock,
		 d => SYNTHESIZED_WIRE_33,
		 q => SYNTHESIZED_WIRE_5);

busMuxOut <= SYNTHESIZED_WIRE_33;
R5contents <= SYNTHESIZED_WIRE_17;
END bdf_type;

