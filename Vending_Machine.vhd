LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Note:
--		Rp 0			=	“000”
--		Rp 1000		=	“001”
--		RP 2000		=	”010″
--		Rp 50000		=	“011”
--		Rp 10000		=	“100”
--		Rp 20000		=	“101”
--		RP 50000		=	”110″
--		Rp 100000	=	"111"
--		Harga Barang : @Rp 5000

ENTITY Vending_Machine IS
	PORT
	(
		CLOCK			: 	IN		STD_LOGIC;
		RESET			: 	IN		STD_LOGIC;
		IN_MONEY		: 	IN		STD_LOGIC_VECTOR	(2 DOWNTO 0);
		THING			: 	OUT	STD_LOGIC;
		OUT_MONEY_1	: 	OUT	STD_LOGIC_VECTOR	(2 DOWNTO 0);
		OUT_MONEY_2	:	OUT	STD_LOGIC_VECTOR	(2 DOWNTO 0);
		OUT_MONEY_3	: 	OUT	STD_LOGIC_VECTOR	(2 DOWNTO 0);
		OUT_MONEY_4	:	OUT	STD_LOGIC_VECTOR	(2 DOWNTO 0);
		OUT_MONEY_5	: 	OUT	STD_LOGIC_VECTOR	(2 DOWNTO 0);
		OUT_MONEY_6	:	OUT	STD_LOGIC_VECTOR	(2 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE VM OF Vending_Machine IS

	TYPE STATE_TYPE IS
		(
			IDLE, MONEY_IN,
			IN_1, IN_2, IN_3, IN_4, IN_5,
			IN_6, IN_7, IN_8, IN_9, IN_10,
			IN_11, IN_12, IN_13, IN_14, IN_20,
			IN_21, IN_22, IN_23, IN_24, IN_50,
			IN_51, IN_52, IN_53, IN_54, IN_100,
			IN_101, IN_102, IN_103, IN_104);
	SIGNAL CURRENT_STATE, NEXT_STATE: STATE_TYPE;

BEGIN

	Machine_State : PROCESS(CLOCK,RESET)
	BEGIN
		IF(RESET = '1') THEN
			CURRENT_STATE <= IDLE;
		ELSIF(CLOCK'EVENT AND CLOCK = '1') THEN
			CURRENT_STATE <= NEXT_STATE;
		END IF;
	END PROCESS;
	
	FSM : PROCESS(CURRENT_STATE,IN_MONEY)
	BEGIN
		CASE CURRENT_STATE IS
			
			WHEN IDLE => --STATE RESET OR IDLE
				THING <= '0';
				OUT_MONEY_1 <= "000";
				OUT_MONEY_2 <= "000";
				OUT_MONEY_3 <= "000";
				OUT_MONEY_4 <= "000";
				OUT_MONEY_5	<=	"000";
				OUT_MONEY_6	<=	"000";
				NEXT_STATE <= MONEY_IN;
			
			WHEN MONEY_IN =>
				IF(IN_MONEY = "000")THEN		--INSERT RP 0
					THING <= '0';
					NEXT_STATE <= MONEY_IN;
				ELSIF(IN_MONEY = "001")THEN	--INSERT 1000
					THING <= '0';
					NEXT_STATE <= IN_1;
				ELSIF(IN_MONEY = "010")THEN	--INSERT 2000
					THING <= '0';
					NEXT_STATE <= IN_2;
				ELSIF(IN_MONEY = "011")THEN	--INSERT 5000
					THING <= '0';
					NEXT_STATE <= IN_5;
				ELSIF(IN_MONEY = "100")THEN	--INSERT 10000
					THING <= '0';
					NEXT_STATE <= IN_10;
				ELSIF(IN_MONEY = "101")THEN	--INSERT 20000
					THING <= '0';
					NEXT_STATE <= IN_20;
				ELSIF(IN_MONEY = "110")THEN	--INSERT 50000
					THING <= '0';
					NEXT_STATE <= IN_50;
				ELSIF(IN_MONEY = "111")THEN 	--INSERT 100000
					THING <= '0';
					NEXT_STATE <= IN_100;
				END IF;
			
			WHEN IN_1 =>
				IF(IN_MONEY = "000") THEN		--INSERT Rp 0					(1000)
					THING <= '0';
					NEXT_STATE <= IN_1;
				ELSIF(IN_MONEY = "001") THEN	--INSERT Rp 1000		LAGI	(2000)
					THING <= '0';
					NEXT_STATE <= IN_2;
				ELSIF(IN_MONEY = "010") THEN	--INSERT Rp 2000		LAGI	(3000)
					THING <= '0';
					NEXT_STATE <= IN_3;
				ELSIF(IN_MONEY = "011") THEN	--INSERT Rp 5000		LAGI	(6000)
					THING <= '0';
					NEXT_STATE <= IN_6;
				ELSIF(IN_MONEY = "100") THEN	--INSERT Rp 10000		LAGI	(11000)
					THING <= '0';
					NEXT_STATE <= IN_11;
				ELSIF(IN_MONEY = "101") THEN	--INSERT Rp 20000		LAGI	(21000)
					THING <= '0';
					NEXT_STATE <= IN_21;
				ELSIF(IN_MONEY = "110") THEN	--INSERT Rp 50000		LAGI	(51000)
					THING <= '0';
					NEXT_STATE <= IN_51;
				ELSIF(IN_MONEY = "111") THEN	--INSERT Rp 100000	LAGI	(101000)
					THING <= '0';
					NEXT_STATE <= IN_101;
				END IF;
				
			WHEN IN_2 =>
				IF(IN_MONEY = "000") THEN		--INSERT Rp 0					(2000)
					THING <= '0';
					NEXT_STATE <= IN_2;
				ELSIF(IN_MONEY = "001") THEN	--INSERT Rp 1000		LAGI	(3000)
					THING <= '0';
					NEXT_STATE <= IN_3;
				ELSIF(IN_MONEY = "010") THEN	--INSERT Rp 2000		LAGI	(4000)
					THING <= '0';
					NEXT_STATE <= IN_4;
				ELSIF(IN_MONEY = "011") THEN	--INSERT Rp 5000		LAGI	(7000)
					THING <= '0';
					NEXT_STATE <= IN_7;
				ELSIF(IN_MONEY = "100") THEN	--INSERT Rp 10000		LAGI	(12000)
					THING <= '0';
					NEXT_STATE <= IN_12;
				ELSIF(IN_MONEY = "101") THEN	--INSERT Rp 20000		LAGI	(22000)
					THING <= '0';
					NEXT_STATE <= IN_22;
				ELSIF(IN_MONEY = "110") THEN	--INSERT Rp 50000		LAGI	(52000)
					THING <= '0';
					NEXT_STATE <= IN_52;
				ELSIF(IN_MONEY = "111") THEN	--INSERT Rp 100000	LAGI	(102000)
					THING <= '0';
					NEXT_STATE <= IN_102;
				END IF;
				
			WHEN IN_3 =>
				IF(IN_MONEY = "000") THEN		--INSERT Rp 0					(3000)
					THING <= '0';
					NEXT_STATE <= IN_3;
				ELSIF(IN_MONEY = "001") THEN	--INSERT Rp 1000		LAGI	(4000)
					THING <= '0';
					NEXT_STATE <= IN_4;
				ELSIF(IN_MONEY = "010") THEN	--INSERT Rp 2000		LAGI	(5000)
					THING <= '0';
					NEXT_STATE <= IN_5;
				ELSIF(IN_MONEY = "011") THEN	--INSERT Rp 5000		LAGI	(8000)
					THING <= '0';
					NEXT_STATE <= IN_8;
				ELSIF(IN_MONEY = "100") THEN	--INSERT Rp 10000		LAGI	(13000)
					THING <= '0';
					NEXT_STATE <= IN_13;
				ELSIF(IN_MONEY = "101") THEN	--INSERT Rp 20000		LAGI	(23000)
					THING <= '0';
					NEXT_STATE <= IN_23;
				ELSIF(IN_MONEY = "110") THEN	--INSERT Rp 50000		LAGI	(53000)
					THING <= '0';
					NEXT_STATE <= IN_53;
				ELSIF(IN_MONEY = "111") THEN	--INSERT Rp 100000	LAGI	(103000)
					THING <= '0';
					NEXT_STATE <= IN_103;
				END IF;
				
			WHEN IN_4 =>
				IF(IN_MONEY = "000") THEN		--INSERT Rp 0					(4000)
					THING <= '0';
					NEXT_STATE <= IN_4;
				ELSIF(IN_MONEY = "001") THEN	--INSERT Rp 1000		LAGI	(5000)
					THING <= '0';
					NEXT_STATE <= IN_5;
				ELSIF(IN_MONEY = "010") THEN	--INSERT Rp 2000		LAGI	(6000)
					THING <= '0';
					NEXT_STATE <= IN_6;
				ELSIF(IN_MONEY = "011") THEN	--INSERT Rp 5000		LAGI	(9000)
					THING <= '0';
					NEXT_STATE <= IN_9;
				ELSIF(IN_MONEY = "100") THEN	--INSERT Rp 10000		LAGI	(14000)
					THING <= '0';
					NEXT_STATE <= IN_14;
				ELSIF(IN_MONEY = "101") THEN	--INSERT Rp 20000		LAGI	(24000)
					THING <= '0';
					NEXT_STATE <= IN_24;
				ELSIF(IN_MONEY = "110") THEN	--INSERT Rp 50000		LAGI	(54000)
					THING <= '0';
					NEXT_STATE <= IN_54;
				ELSIF(IN_MONEY = "111") THEN	--INSERT Rp 100000	LAGI	(104000)
					THING <= '0';
					NEXT_STATE <= IN_104;
				END IF;
				
			

			WHEN IN_5 =>
				THING <= '1';
				OUT_MONEY_1 <= "000";
				OUT_MONEY_2 <= "000";
				OUT_MONEY_3 <= "000";
				OUT_MONEY_4 <= "000";
				OUT_MONEY_5 <= "000";
				OUT_MONEY_6 <= "000";
				NEXT_STATE <= MONEY_IN;
			
			WHEN IN_6 =>
				THING <= '1';
				OUT_MONEY_1 <= "000";
				OUT_MONEY_2 <= "000";
				OUT_MONEY_3 <= "000";
				OUT_MONEY_4 <= "000";
				OUT_MONEY_5 <= "000";
				OUT_MONEY_6 <= "001";
				NEXT_STATE <= MONEY_IN;
				
			WHEN IN_7 =>
				THING <= '1';
				OUT_MONEY_1 <= "000";
				OUT_MONEY_2 <= "000";
				OUT_MONEY_3 <= "000";
				OUT_MONEY_4 <= "000";
				OUT_MONEY_5 <= "000";
				OUT_MONEY_6 <= "010";
				NEXT_STATE <= MONEY_IN;
			
			WHEN IN_8 =>
				THING <= '1';
				OUT_MONEY_1 <= "000";
				OUT_MONEY_2 <= "000";
				OUT_MONEY_3 <= "000";
				OUT_MONEY_4 <= "000";
				OUT_MONEY_5 <= "010";
				OUT_MONEY_6 <= "001";
				NEXT_STATE <= MONEY_IN;
			
			WHEN IN_9 =>
				THING <= '1';
				OUT_MONEY_1 <= "000";
				OUT_MONEY_2 <= "000";
				OUT_MONEY_3 <= "000";
				OUT_MONEY_4 <= "000";
				OUT_MONEY_5 <= "010";
				OUT_MONEY_6 <= "010";
				NEXT_STATE <= MONEY_IN;
			
			WHEN IN_10 =>
				THING <= '1';
				OUT_MONEY_1 <= "000";
				OUT_MONEY_2 <= "000";
				OUT_MONEY_3 <= "000";
				OUT_MONEY_4 <= "000";
				OUT_MONEY_5 <= "000";
				OUT_MONEY_6 <= "011";
				NEXT_STATE <= MONEY_IN;
			
			WHEN IN_11 =>
				THING <= '1';
				OUT_MONEY_1 <= "000";
				OUT_MONEY_2 <= "000";
				OUT_MONEY_3 <= "000";
				OUT_MONEY_4 <= "000";
				OUT_MONEY_5 <= "001";
				OUT_MONEY_6 <= "011";
				NEXT_STATE <= MONEY_IN;
				
			WHEN IN_12 =>
				THING <= '1';
				OUT_MONEY_1 <= "000";
				OUT_MONEY_2 <= "000";
				OUT_MONEY_3 <= "000";
				OUT_MONEY_4 <= "000";
				OUT_MONEY_5 <= "010";
				OUT_MONEY_6 <= "011";
				NEXT_STATE <= MONEY_IN;
				
			WHEN IN_13 =>
				THING <= '1';
				OUT_MONEY_1 <= "000";
				OUT_MONEY_2 <= "000";
				OUT_MONEY_3 <= "000";
				OUT_MONEY_4 <= "001";
				OUT_MONEY_5 <= "010";
				OUT_MONEY_6 <= "011";
				NEXT_STATE <= MONEY_IN;
				
			WHEN IN_14 =>
				THING <= '1';
				OUT_MONEY_1 <= "000";
				OUT_MONEY_2 <= "000";
				OUT_MONEY_3 <= "000";
				OUT_MONEY_4 <= "010";
				OUT_MONEY_5 <= "010";
				OUT_MONEY_6 <= "011";
				NEXT_STATE <= MONEY_IN;
			
			WHEN IN_20 =>
				THING <= '1';
				OUT_MONEY_1 <= "000";
				OUT_MONEY_2 <= "000";
				OUT_MONEY_3 <= "000";
				OUT_MONEY_4 <= "000";
				OUT_MONEY_5 <= "011";
				OUT_MONEY_6 <= "100";
				NEXT_STATE <= MONEY_IN;
			
			WHEN IN_21 =>
				THING <= '1';
				OUT_MONEY_1 <= "000";
				OUT_MONEY_2 <= "000";
				OUT_MONEY_3 <= "000";
				OUT_MONEY_4 <= "001";
				OUT_MONEY_5 <= "011";
				OUT_MONEY_6 <= "100";
				NEXT_STATE <= MONEY_IN;
				
			WHEN IN_22 =>
				THING <= '1';
				OUT_MONEY_1 <= "000";
				OUT_MONEY_2 <= "000";
				OUT_MONEY_3 <= "000";
				OUT_MONEY_4 <= "010";
				OUT_MONEY_5 <= "011";
				OUT_MONEY_6 <= "100";
				NEXT_STATE <= MONEY_IN;
				
			WHEN IN_23 =>
				THING <= '1';
				OUT_MONEY_1 <= "000";
				OUT_MONEY_2 <= "000";
				OUT_MONEY_3 <= "001";
				OUT_MONEY_4 <= "010";
				OUT_MONEY_5 <= "011";
				OUT_MONEY_6 <= "100";
				NEXT_STATE <= MONEY_IN;
				
			WHEN IN_24 =>
				THING <= '1';
				OUT_MONEY_1 <= "000";
				OUT_MONEY_2 <= "000";
				OUT_MONEY_3 <= "010";
				OUT_MONEY_4 <= "010";
				OUT_MONEY_5 <= "011";
				OUT_MONEY_6 <= "100";
				NEXT_STATE <= MONEY_IN;
			
			WHEN IN_50 =>
				THING <= '1';
				OUT_MONEY_1 <= "000";
				OUT_MONEY_2 <= "000";
				OUT_MONEY_3 <= "000";
				OUT_MONEY_4 <= "011";
				OUT_MONEY_5 <= "101";
				OUT_MONEY_6 <= "101";
				NEXT_STATE <= MONEY_IN;
				
			WHEN IN_51 =>
				THING <= '1';
				OUT_MONEY_1 <= "000";
				OUT_MONEY_2 <= "000";
				OUT_MONEY_3 <= "001";
				OUT_MONEY_4 <= "011";
				OUT_MONEY_5 <= "101";
				OUT_MONEY_6 <= "101";
				NEXT_STATE <= MONEY_IN;
				
			WHEN IN_52 =>
				THING <= '1';
				OUT_MONEY_1 <= "000";
				OUT_MONEY_2 <= "000";
				OUT_MONEY_3 <= "010";
				OUT_MONEY_4 <= "011";
				OUT_MONEY_5 <= "101";
				OUT_MONEY_6 <= "101";
				NEXT_STATE <= MONEY_IN;
				
			WHEN IN_53 =>
				THING <= '1';
				OUT_MONEY_1 <= "000";
				OUT_MONEY_2 <= "001";
				OUT_MONEY_3 <= "010";
				OUT_MONEY_4 <= "011";
				OUT_MONEY_5 <= "101";
				OUT_MONEY_6 <= "101";
				NEXT_STATE <= MONEY_IN;
				
			WHEN IN_54 =>
				THING <= '1';
				OUT_MONEY_1 <= "000";
				OUT_MONEY_2 <= "010";
				OUT_MONEY_3 <= "010";
				OUT_MONEY_4 <= "011";
				OUT_MONEY_5 <= "101";
				OUT_MONEY_6 <= "101";
				NEXT_STATE <= MONEY_IN;
				
			WHEN IN_100 =>
				THING <= '1';
				OUT_MONEY_1 <= "000";
				OUT_MONEY_2 <= "000";
				OUT_MONEY_3 <= "011";
				OUT_MONEY_4 <= "101";
				OUT_MONEY_5 <= "101";
				OUT_MONEY_6 <= "110";
				NEXT_STATE <= MONEY_IN;
			
			WHEN IN_101 =>
				THING <= '1';
				OUT_MONEY_1 <= "000";
				OUT_MONEY_2 <= "001";
				OUT_MONEY_3 <= "011";
				OUT_MONEY_4 <= "101";
				OUT_MONEY_5 <= "101";
				OUT_MONEY_6 <= "110";
				NEXT_STATE <= MONEY_IN;
				
			WHEN IN_102 =>
				THING <= '1';
				OUT_MONEY_1 <= "000";
				OUT_MONEY_2 <= "010";
				OUT_MONEY_3 <= "011";
				OUT_MONEY_4 <= "101";
				OUT_MONEY_5 <= "101";
				OUT_MONEY_6 <= "110";
				NEXT_STATE <= MONEY_IN;
				
			WHEN IN_103 =>
				THING <= '1';
				OUT_MONEY_1 <= "001";
				OUT_MONEY_2 <= "010";
				OUT_MONEY_3 <= "011";
				OUT_MONEY_4 <= "101";
				OUT_MONEY_5 <= "101";
				OUT_MONEY_6 <= "110";
				NEXT_STATE <= MONEY_IN;
				
			WHEN IN_104 =>
				THING <= '1';
				OUT_MONEY_1 <= "010";
				OUT_MONEY_2 <= "010";
				OUT_MONEY_3 <= "011";
				OUT_MONEY_4 <= "101";
				OUT_MONEY_5 <= "101";
				OUT_MONEY_6 <= "110";
				NEXT_STATE <= MONEY_IN;
 
		END CASE;
	END PROCESS FSM;
END VM;
