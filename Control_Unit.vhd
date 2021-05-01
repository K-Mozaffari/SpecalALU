
		 library IEEE; 
		 use IEEE.STD_LOGIC_1164.all; 
		 use work.package_6541.all;
		USE ieee.numeric_std.ALL;
 
		  
		ENTITY Control_Unit IS  
				GENERIC (
				n:integer:=3
				);

		   PORT( 
				Clk			:IN 	std_logic;
				Start_cmd	:IN 	std_logic;
				Rst			:IN 	std_logic;
				LSB			:IN 	std_logic;
				One_cmd		:OUT	std_logic;
				Select_cmd	:OUT	std_logic;
				Load_cmd	:OUT 	std_logic;
				Add_cmd		:OUT 	std_logic;
				Shift_cmd	:OUT 	std_logic;
				End_Flag	:OUT 	std_logic

		         );  
		 END  Control_Unit ;  
		 
		 ARCHITECTURE structural OF Control_Unit IS  
			SIGNAL y2,y2_n,y1,y1_n,y0,y0_n,C2,C8,LSB_n,y2_p,y1_p,y0_p,Count_cmd :std_logic:='0';
			SIGNAL C8_n,C2_n,VDD:std_logic:='1';


			BEGIN
	LSB_n<=NOT(LSB);
	C2_n<=NOT(C2);
	C8_n<=NOT(C8);
		
Generate_Signal: Control_Signal PORT MAP(
					LSB			,
					LSB_n		,
					y2			,
					y2_n		,
					y1			,
					y1_n		,
					y0			,
					y0_n		,
					C2			,
					C2_n		,
					C8			,
					C8_n		,
					Count_cmd	,	
					One_cmd		,
					Select_cmd	,
					Load_cmd	,
					Add_cmd		,
					Shift_cmd	
					);
-------------------------------------------------------
Next_Stage: Next_Stage_Signal    PORT	MAP( 
					LSB			,
					LSB_n		,
					y2			,
					y2_n		,
					y1			,
					y1_n		,
					y0			,
					y0_n		,
					C2			,
					C2_n		,
					C8			,
					C8_n		,
					y2_p		,
					y1_p		,
					y0_p		 
					);
------------------------------------------------------
G2_DFF:DFF PORT MAP (Clk,Start_cmd,Rst,y2_p,y2,y2_n);
G1_DFF:DFF PORT MAP (Clk,Start_cmd,Rst,y1_p,y1,y1_n);
G0_DFF:DFF PORT MAP (Clk,Start_cmd,Rst,y0_p,y0,y0_n);
---------Counter
G_Counter: Counter_n GENERIC MAP(n) PORT MAP (
			Clk	,
				Count_cmd,
				Rst	 ,
				C2	 ,
				C8	
		         );  	
		         

End_Flag<=(C8_n AND y2_n )and (y1_n and y0_n);

		 

		 END structural;
