---

--Designing an arithmetic unit to comute A*B+1 (n-bit )based on "shift and add" method

-----
Library IEEE; 
use IEEE.STD_LOGIC_1164.all; 
use work.Package_6541.all; 

		  
ENTITY Multiplier_Z IS  
	Generic (
		n :integer:=16;
		ADD:integer:=2 -- 
		);
	PORT	( 
		Clk		:	IN 	std_logic;
		St		:	IN 	std_logic;
		Clr		:	IN	std_logic;
		A,B		:	IN  std_logic_vector(n-1 	downto 0); 
		Z_int		:	OUT std_logic_vector(2*n 	downto 2 );
		Z_Fr		:	OUT std_logic_vector(1   	downto 0 );
		End_Flag	:	OUT	std_LOGIC
		        );
END  Multiplier_Z;  

ARCHITECTURE structural OF Multiplier_Z IS  
		SIGNAL one_cmd:std_logic:='0';--- 
		SIGNAL Rout_A,Rin_C,Rout_A_m,Rout_B:std_logic_vector(n-1 downto 0):=(others=>'0');
SIGNAL  Rout_C,Cout_Rin_C :std_logic_vector(n  downto 0):=(others=>'0');
		SIGNAL End_Flag_s,c8,cout,Ld_cmd,Sh_cmd,Add_cmd,select_cmd : std_logic:='0';
SIGNAL z_signal:std_logic_vector(2*n downto 0);
SIGNAL GND:STD_LOGIC_VECTOR(n-1 DOWNTO 0):=(OTHERS=>'0');
	
BEGIN

	Controler	:Control_Unit  GENERIC MAP (n) PORT MAP (Clk,St,Clr,Rout_B(0),one_cmd,select_cmd,Ld_cmd,Add_cmd,Sh_cmd,End_Flag);

---Register A
	REG_Multiplicand:Reg_P		GENERIC MAP (n) PORT MAP (Clk,Ld_cmd,Clr,A,Rout_A);	
---3 types  of Adder
carry_ripple :IF ADD=1 GENERATE
		Adder	:RCA 		GENERIC MAP (n) PORT MAP (Rout_A_m,Rout_C(n-1 downto 0),one_cmd,Rin_C,cout); 	
	
	END GENERATE carry_ripple;	
Look_Ahead_adder:IF ADD=2 GENERATE
		Adder	: Carry_Look_Ahead		GENERIC MAP (n) PORT MAP (Rout_A_m,Rout_C(n-1 downto 0),one_cmd,Rin_C,cout); 	
	
	END GENERATE Look_Ahead_adder;	
Manchester_adder :IF ADD=3 GENERATE
		Adder	:Manchester 	GENERIC MAP (n) PORT MAP (Rout_A_m,Rout_C(n-1 downto 0),one_cmd,Rin_C,cout); 	
	
	END GENERATE Manchester_adder;	
 
	
MUXPLUS4: MUX2TO1_n GENERIC MAP(n) PORT MAP (Rout_A,GND,select_cmd,Rout_A_m); 
 		
---- register result of Adder
Cout_Rin_C<=(cout&Rin_C);

	REG_Result_ADD	:Shift_Reg_R 	GENERIC MAP (n+1) PORT MAP (Clk,Add_cmd,Sh_cmd,Clr,'0',Cout_Rin_C,Rout_C);

	REG_Multiplier	:Shift_Reg_R 	GENERIC MAP (n) PORT MAP (Clk,Ld_cmd,Sh_cmd,Clr,Rout_C(0),B,Rout_B);	---Register B

 Z_signal<= Rout_C &Rout_B;
Z_int<=Z_signal(2*n downto 2);
Z_Fr<=Z_signal(1 downto 0);
		 END structural;
