-- and datapath_tb.vhd file: <This is the filename>
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- entity declaration only; no definition here
ENTITY datapathROR_tb IS
END ENTITY datapathROR_tb;

-- Architecture of the testbench with the signal names
ARCHITECTURE datapathROR_tb_arch OF datapathROR_tb IS


SIGNAL PCout_tb, Zlowout_tb, MDRout_tb, R0out_tb, R1out_tb, R2out_tb, R3out_tb, R4out_tb, R5out_tb, 
	R6out_tb, R7out_tb, R8out_tb, R9out_tb, R10out_tb, R11out_tb, R12out_tb, R13out_tb, R14out_tb,
	R15out_tb, HIout_tb, LOout_tb, Zhighout_tb, Cout_tb, Clear_tb, R0in_tb, R1in_tb, R3in_tb, R6in_tb, 
	R7in_tb, R8in_tb, R9in_tb, R10in_tb, R11in_tb, R12in_tb, R13in_tb, R14in_tb, R15in_tb, HIin_tb, LOin_tb,
	In_portout_tb, X_CLA_tb, ADD_op_tb, SUB_op_tb, AND_op_tb, OR_op_tb, SHR_op_tb, SHL_opL_tb, ROR_op_tb, ROL_op_tb, 
	MUL_op_tb, DIV_op_tb, NEG_op_tb, NOT_op_tb, IncPC_op_tb : std_logic;
SIGNAL MARin_tb, Zin_tb, PCin_tb, MDRin_tb, IRin_tb, Yin_tb: std_logic;
SIGNAL Read_mem_tb, R5in_tb, R2in_tb, R4in_tb: std_logic; 
SIGNAL X_CSign_tb, X_inPort_tb : std_logic_vector (31 downto 0);
SIGNAL Clock_tb: std_logic;
SIGNAL Mdatain_tb : std_logic_vector (31 downto 0);

SIGNAL R5contents_tb : std_logic_vector (31 downto 0);
SIGNAL BusMuxOut_tb : std_logic_vector (31 downto 0);


--SIGNAL InterOUT_tb :  STD_LOGIC_VECTOR(31 DOWNTO 0);

TYPE State IS (default, Reg_load1a, Reg_load1b, Reg_load2a, Reg_load2b, Reg_load3a, Reg_load3b, T0, T1,
	T2, T3, T4, T5);
SIGNAL Present_state: State := default;
 
 
 -- component instantiation of the datapath
COMPONENT datapath
	PORT (
		PCout, Zlowout, MDRout, R2out,R4out: in std_logic;
		MARin, Zin, PCin, MDRin, IRin, Yin, R0out, R1out, R3out, R5out, 
			R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out,
			R15out, HIout, LOout, Zhighout, Cout, Clear, R0in, R1in, R3in, R6in, 
			R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, HIin, LOin,
			In_portout, X_CLA, ADD_op, SUB_op, AND_op, OR_op, SHR_op, SHL_opL, ROR_op, ROL_op, 
			MUL_op, DIV_op, NEG_op, NOT_op, IncPC_op : in std_logic;
		
	   Read_mem, R5in, R2in, R4in: in std_logic;
		
		Clock: in Std_logic;
		Mdatain, X_inPort: in std_logic_vector (31 downto 0);
		X_CSign: in std_logic_vector (31 downto 0);
		
		--InterOUT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		
		BusMuxOut : out std_logic_vector (31 downto 0);
		R5contents : out std_logic_vector (31 downto 0)

		);
END COMPONENT datapath;


BEGIN --begin for architecture

	Datapath_1 : datapath
	--port mapping: between the dut and the testbench signals
	PORT MAP (
		PCout => PCout_tb,
		Zlowout => Zlowout_tb,
		MDRout => MDRout_tb,
		R2out => R2out_tb,
		R4out => R4out_tb,
		MARin => MARin_tb,
		Zin => Zin_tb,
		PCin => PCin_tb,
		MDRin => MDRin_tb,
		IRin => IRin_tb,
		Yin => Yin_tb,
		Read_mem => Read_mem_tb,
		R2in => R2in_tb,
		R4in => R4in_tb,
		R5in => R5in_tb,
		Clock => Clock_tb,
		Mdatain => Mdatain_tb,
		--InterOUT => InterOUT_tb,
		
		R0out => R0out_tb,
		R1out =>R1out_tb,
		R3out =>R3out_tb,
		R5out =>R5out_tb,
		R6out =>R6out_tb,
		R7out =>R7out_tb,
		R8out => R8out_tb,
		R9out => R9out_tb, 
		R10out => R10out_tb,
		R11out => R11out_tb,
		R12out => R12out_tb,
		R13out => R13out_tb,
		R14out => R14out_tb,
		R15out => R15out_tb,
		HIout => HIout_tb,
		LOout => LOout_tb,
		Zhighout => Zhighout_tb,
		Cout => Cout_tb,
		Clear => Clear_tb,
		R0in => R0in_tb,
		R1in => R1in_tb,
		R3in => R3in_tb,
		R6in => R6in_tb,
		R7in => R7in_tb,
		R8in => R8in_tb,
		R9in => R9in_tb,
		R10in => R10in_tb,
		R11in => R11in_tb,
		R12in => R12in_tb,
		R13in => R13in_tb,
		R14in => R14in_tb,
		R15in => R15in_tb,
		HIin => HIin_tb,
		LOin => LOin_tb,
		In_portout => In_portout_tb,
		X_CLA => X_CLA_tb,
		ADD_op => ADD_op_tb,
		SUB_op => SUB_op_tb,
		AND_op => AND_op_tb,
		OR_op => OR_op_tb,
		SHR_op => SHR_op_tb,
		SHL_opL => SHL_opL_tb,
		ROR_op => ROR_op_tb,
		ROL_op => ROL_op_tb,
		MUL_op => MUL_op_tb,
		DIV_op => DIV_op_tb,
		NEG_op => NEG_op_tb,
		NOT_op => NOT_op_tb,
		IncPC_op => IncPC_op_tb,
		X_CSign => X_CSign_tb,
		X_inPort => X_inPort_tb,
		BusMuxOut => BusMuxOut_tb,
		R5contents => R5contents_tb
		);

	--add test logic here
	
	
	Clock_process: PROCESS IS
	BEGIN
		Clock_tb <= '1', '0' after 15ns;
		Wait for 30ns;
	END PROCESS Clock_process;


	PROCESS (Clock_tb) IS -- finite state machine
	BEGIN
		IF (rising_edge (Clock_tb)) THEN -- if clock rising-edge
			CASE Present_state IS
				WHEN Default =>
					Present_state <= Reg_load1a;
				WHEN Reg_load1a =>
					Present_state <= Reg_load1b;
				WHEN Reg_load1b =>
					Present_state <= Reg_load2a;
				WHEN Reg_load2a =>
					Present_state <= Reg_load2b;
				WHEN Reg_load2b =>
					Present_state <= Reg_load3a;
				WHEN Reg_load3a =>
					Present_state <= Reg_load3b;
				WHEN Reg_load3b =>
					Present_state <= T0;
				WHEN T0 =>
					Present_state <= T1;
				WHEN T1 =>
					Present_state <= T2;
				WHEN T2 =>
					Present_state <= T3;
				WHEN T3 =>
					Present_state <= T4;
				WHEN T4 =>
					Present_state <= T5;
				WHEN OTHERS =>
			END CASE;
		END IF;
	END PROCESS;

	
	PROCESS (Present_state) IS -- do the required job in each state
	BEGIN
		CASE Present_state IS -- assert the required signals in each clock cycle
			WHEN Default =>
				PCout_tb <= '0'; Zlowout_tb <= '0'; MDRout_tb <= '0'; -- initialize the signals
				R2out_tb <= '0'; R4out_tb <= '0'; MARin_tb <= '0'; Zin_tb <= '0';
				PCin_tb <='0'; MDRin_tb <= '0'; IRin_tb <= '0'; Yin_tb <= '0';
				IncPC_op_tb <= '0'; Read_mem_tb <= '0';
				R2in_tb <= '0'; R4in_tb <= '0'; R5in_tb <= '0'; Mdatain_tb <= x"00000000"; IRin_tb <= '0';

			WHEN Reg_load1a =>
				Mdatain_tb <= x"00000001", x"00000000" after 35ns;
				Read_mem_tb <= '0', '1' after 10ns, '0' after 35ns; -- the first zero is there for completeness
				MDRin_tb <= '0', '1' after 10ns, '0' after 35ns;
				
			WHEN Reg_load1b =>
				R2in_tb <= '1' after 10ns, '0' after 35ns; -- initialize R2 with the value $22
				MDRout_tb <= '1' after 10ns, '0' after 35ns;
				
			WHEN Reg_load2a =>
				Mdatain_tb <= x"00000022", x"00000000" after 35ns;
				Read_mem_tb <='0', '1' after 10ns, '0' after 35ns;
				MDRin_tb <= '1' after 10ns, '0' after 35ns;
				
			WHEN Reg_load2b =>
				MDRout_tb <= '1' after 10ns, '0' after 35ns;
				R4in_tb <= '1' after 10ns, '0' after 35ns; -- initialize R4 with the value $24
				
			WHEN Reg_load3a =>
				Mdatain_tb <= x"00000026", x"00000000" after 35ns;
				Read_mem_tb <= '1' after 10ns, '0' after 35ns;
				MDRin_tb <= '1' after 10ns, '0' after 35ns;
				
			WHEN Reg_load3b =>
				MDRout_tb <= '1' after 10ns, '0' after 35ns;
				R5in_tb <= '1' after 10ns, '0' after 35ns; -- initialize R5 with the value $26
				
			WHEN T0 => -- see if you need to de-assert these signals
				PCout_tb <= '1' after 10ns, '0' after 35ns; 
				MARin_tb <= '1' after 10ns, '0' after 35ns; 
				IncPC_op_tb <= '1' after 10ns, '0' after 35ns; 
				Zin_tb <= '1' after 10ns, '0' after 35ns;
			
			WHEN T1 =>
				Zlowout_tb <= '1' after 10ns, '0' after 35ns; 
				PCin_tb <= '1' after 10ns, '0' after 35ns; 
				Read_mem_tb <= '1' after 10ns, '0' after 35ns; 
				MDRin_tb <= '1' after 10ns, '0' after 35ns;
				Mdatain_tb <= x"4A920000", x"00000000" after 35ns; -- CHANGE opcode
			
			WHEN T2 =>
				MDRout_tb <= '1' after 10ns, '0' after 35ns;
				IRin_tb <= '1' after 10ns, '0' after 35ns;
			
			WHEN T3 =>
				R8out_tb <= '1' after 10ns, '0' after 35ns; 
				Yin_tb <= '1' after 10ns, '0' after 35ns;
			
			WHEN T4 =>
				R10out_tb <= '1' after 10ns, '0' after 35ns; 
				ROR_op_tb <= '1', '0' after 35ns; --CHANGE OP
				Zin_tb <= '1' after 10ns, '0' after 35ns; 
			
			WHEN T5 =>
				Zlowout_tb <= '1', '0' after 35ns; 
				R5in_tb <= '1', '0' after 35ns;
			WHEN OTHERS =>
		END CASE;
	END PROCESS;
END ARCHITECTURE datapathROR_tb_arch;