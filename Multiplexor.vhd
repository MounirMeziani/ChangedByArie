LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY Multiplexor IS
Port(
R0_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
R1_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
R2_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
R3_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
R4_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
R5_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
R6_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
R7_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
R8_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
R9_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
R10_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
R11_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
R12_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
R13_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
R14_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
R15_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
HI_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
LO_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
Z_HI_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
Z_low_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
MDR_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
PC_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
C_signextended: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
In_port_busmuxin: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
BusMuxOut: out std_LOGIC_VECTOR (31 downto 0);

a: IN STD_LOGIC_vector(4 downto 0)
);
END entity Multiplexor;


ARCHITECTURE description OF Multiplexor IS
BEGIN
	 
busmux : process(R0_busmuxin,R1_busmuxin,R2_busmuxin,R3_busmuxin,R4_busmuxin,R5_busmuxin,
						R6_busmuxin,R7_busmuxin,R8_busmuxin,R9_busmuxin,R10_busmuxin,R11_busmuxin,
						R12_busmuxin,R13_busmuxin,R14_busmuxin,R15_busmuxin,HI_busmuxin,LO_busmuxin
						,Z_HI_busmuxin,Z_low_busmuxin,PC_busmuxin,MDR_busmuxin,In_port_busmuxin,C_signextended,a)
begin
			
		CASE a IS
			when "00000"	=>	BusMuxOut <= R0_busmuxin;
			when "00001"	=>	BusMuxOut <= R1_busmuxin;
			when "00010"	=>	BusMuxOut <= R2_busmuxin;
			when "00011"	=>	BusMuxOut <= R3_busmuxin;
			when "00100"	=>	BusMuxOut <= R4_busmuxin;
			when "00101"	=>	BusMuxOut <= R5_busmuxin;
			when "00110"	=>	BusMuxOut <= R6_busmuxin;
			when "00111"	=>	BusMuxOut <= R7_busmuxin;
			when "01000"	=>	BusMuxOut <= R8_busmuxin;
			when "01001"	=>	BusMuxOut <= R9_busmuxin;
			when "01010"	=>	BusMuxOut <= R10_busmuxin;
			when "01011"	=>	BusMuxOut <= R11_busmuxin;
			when "01100"	=>	BusMuxOut <= R12_busmuxin;
			when "01101"	=>	BusMuxOut <= R13_busmuxin;
			when "01110"	=>	BusMuxOut <= R14_busmuxin;
			when "01111"	=>	BusMuxOut <= R15_busmuxin;
			when "10000"	=>	BusMuxOut <= HI_busmuxin;
			when "10001"	=>	BusMuxOut <= LO_busmuxin;
			when "10010"	=>	BusMuxOut <= Z_HI_busmuxin;
			when "10011"	=>	BusMuxOut <= Z_low_busmuxin;
			when "10100"	=>	BusMuxOut <= PC_busmuxin;
			when "10101"	=>	BusMuxOut <= MDR_busmuxin;
			when "10110"	=>	BusMuxOut <= In_port_busmuxin;
			when "10111"	=>	BusMuxOut <= C_signextended;
			when "11111"	=> BusMuxOut <= x"00000000";
			when others		=> 
		END CASE;
end process;
	 
END description;
