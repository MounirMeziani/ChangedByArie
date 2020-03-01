LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY Encoder IS
PORT(
--Signal Encoder:
R0_out : IN STD_LOGIC;
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

--Data Multiplexer:
--R0_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--R1_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--R2_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--R3_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--R4_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--R5_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--R6_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--R7_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--R8_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--R9_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--R10_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--R11_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--R12_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--R13_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--R14_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--R15_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--HI_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--LO_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--Z_HI_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--Z_low_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--PC_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--MDR_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--In_port_busmuxin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--C_signextended : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
);
END Encoder;


ARCHITECTURE description OF Encoder IS

BEGIN

encoder : process(R0_out, R1_out, R2_out,R3_out ,R4_out,R5_out,R6_out, R7_out,R8_out,R9_out,R10_out, R11_out,R12_out,R13_out,R14_out,R15_out, MDR_out ,HI_out, LO_out, Z_high_out, PC_out, C_out)
begin

			if R0_out = '1' then
				s<="00000";
			elsif R1_out = '1' then
				s<="00001";
			elsif R2_out = '1' then
			   s<="00010";
			elsif R3_out = '1' then
			   s<="00011";
			elsif R4_out = '1' then
				s<="00100";
			elsif R5_out = '1' then
				s<="00101";
			elsif R6_out = '1'  then
				s<="00110";
			elsif R7_out = '1' then
				s<="00111";
			elsif R8_out = '1' then
				s<="01000";
			elsif R9_out = '1' then
				s<="01001";
			elsif R10_out = '1' then
				s<="01010";
			elsif R11_out = '1' then
				s<="01011";
			elsif R12_out = '1' then
				s<="01100";
			elsif R13_out = '1' then
			   s<="01101";
			elsif R14_out = '1' then
				s<="01110";
			elsif R15_out = '1' then
				s<="01111";
			elsif HI_out = '1' then
				s<="10000";
			elsif LO_out = '1' then
				s<="10001";
			elsif Z_high_out = '1' then
				s<="10010";
			elsif Z_low_out = '1' then
				s<="10011";
			elsif PC_out = '1' then
				s<="10100";
			elsif MDR_out  = '1' then
				s<="10101";
			elsif In_port_out = '1' then
				s<="10110";
			elsif C_out = '1' then
				s<="10111";
			else
				s<="11111";
			end if;
			
end process;

END description;

