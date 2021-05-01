library IEEE;
use IEEE.STD_LOGIC_1164.ALL;






package Package_6541 IS 


----------------------------------CONSTANTS---------------------
CONSTANT n:INTEGER:=8;
---CONSTANT L_n:INTEGER:=integer(ceil(log2(real(n))));
CONSTANT ADD:INTEGER:=1;---Rippel Carry Adder 1, Carry look ahead adder 3

				


COMPONENT HA    
		   PORT( 
		        A,B		:	IN  std_logic;  
		        S,Cout	:	OUT std_logic
		         );  
END  COMPONENT;
		 
COMPONENT FA 
			   PORT( 
		        A,B		:	IN  std_logic;  
		        Cin		:	IN	std_logic;
		        Sout	:	OUT std_logic;
		        Cout	:	OUT	std_logic
		         );  
END  COMPONENT;
		 	 

		  
COMPONENT RCA    
			GENERIC (
				n:INTEGER 
				);
		   PORT( 
		        A,B		:	IN  std_logic_vector(n-1 DOWNTO 0); 
		        Cin 	:	IN  std_logic;
		        Sout	:	OUT std_logic_vector(n-1 DOWNTO 0); 
		        Cout	:	OUT std_logic
		         );  
END COMPONENT    ; 
COMPONENT mux2to1  

	port (
		din0 : in std_logic;
		din1 : in std_logic;
		sel  : in std_logic;
		dout : out std_logic

	);
end COMPONENT;

COMPONENT CSkA_Block   
			GENERIC (
				n:INTEGER:=4
				);
		   PORT( 
		        A,B		:	IN  std_logic_vector(n-1 DOWNTO 0); 
		        Cin 	:	IN  std_logic;
		        Sout	:	OUT std_logic_vector(n-1 DOWNTO 0); 
		        Cout	:	OUT std_logic
		         );  
END  COMPONENT;

COMPONENT DFF   
		  
		   PORT( 
			Clk		:	IN 	std_logic;
				Ld		:	IN	std_logic;
				Rst		:	IN 	std_logic:='0';
				Din		:	IN 	std_logic:='0';
				Q_out	:	OUT	std_logic:='0';
				Qn_out	:	OUT	std_logic:='1'
		          );
END  COMPONENT;

COMPONENT mux2to1_n  is
GENERIC (
		n:INTEGER:=4
		);
		
	port (
		din0 : in std_logic_vector(n-1 downto 0):=(others=>'0');
		din1 : in std_logic_vector(n-1 downto 0):=(others=>'0');
		sel  : in std_logic;
		dout : out std_logic_vector(n-1 downto 0):=(others=>'0')

	);
end COMPONENT ;

COMPONENT Reg_P   
		GENERIC (
				n:INTEGER:=8
		);
		   PORT( 
				Clk		:	IN 	std_logic:='0';
				Ld		:	IN	std_logic:='0';
				Rst		:	IN	std_logic:='0';
				D		:	IN 	std_logic_vector(n-1 downto 0):=(others=>'0');
				Q		:	OUT	std_logic_vector(n-1 downto 0):=(others=>'0')

		        );
		        
END  COMPONENT;

COMPONENT Shift_Reg_R   
		GENERIC (
				n:INTEGER:=2
		);
		 
		   PORT( 
				Clk		:	IN 	std_logic:='0';
				Ld		:	IN 	std_logic:='0';
				Sh		:	IN 	std_logic:='0';
				Rst		:	IN	std_logic:='0';
				D_First	:	IN	std_logic:='0';
				REG_in	:	IN 	std_logic_vector(n-1 downto 0):=(others=>'0');
				Q		:	OUT	std_logic_vector(n-1 downto 0):=(others=>'0')

		        );
		     
		        
END  COMPONENT;

		  
COMPONENT Control_Unit IS  
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
END  COMPONENT ; 
		 
COMPONENT Control_Signal 
			PORT(   
				LSB		:IN 	std_logic;
				LSB_n		:IN 	std_logic;
				y2		:IN		std_logic;
				y2_n		:IN		std_logic;
				y1		:IN		std_logic;
				y1_n		:IN		std_logic;
				y0		:IN		std_logic;
				y0_n		:IN		std_logic;
				C2		:IN		std_logic;
				C2_n		:IN		std_logic;								
				C8		:IN		std_logic;
				C8_n		:IN		std_logic;
				Count_cmd	:OUT	std_logic;
				One_cmd		:OUT	std_logic;
				Select_cmd	:OUT	std_logic;
				Load_cmd	:OUT 	std_logic;
				Add_cmd		:OUT 	std_logic;
				Shift_cmd	:OUT 	std_logic
		         );
END  COMPONENT ; 
COMPONENT Next_Stage_Signal    

		   PORT( 
				LSB			:IN 	std_logic;
				LSB_n		:IN 	std_logic;
				y2			:IN		std_logic;
				y2_n		:IN		std_logic;
				y1			:IN		std_logic;
				y1_n		:IN		std_logic;
				y0			:IN		std_logic;
				y0_n		:IN		std_logic;
				C2			:IN		std_logic;
				C2_n		:IN		std_logic;
				C8			:IN		std_logic;
				C8_n		:IN		std_logic;
				y2_p		:OUT	std_logic;
				y1_p		:OUT	std_logic;
				y0_p		:OUT	std_logic

		         );  
 END  COMPONENT ; 

COMPONENT Counter_n    
			GENERIC (
			n:integer:=8

			);
		   PORT( 
				Clk		:IN 	std_logic;
				Count_cmd	:IN 	std_logic;
				Rst		:IN 	std_logic;
				C2		:OUT	std_logic;
				C8		:OUT	std_logic
		         );  
END  COMPONENT ;
COMPONENT Multiplier_Z    
	Generic (
		n :integer:=8;
		ADD:integer:=1
		);
	PORT	( 
		Clk		:	IN 	std_logic;
		St		:	IN 	std_logic;
		Clr		:	IN	std_logic;
		A,B		:	IN  std_logic_vector(n-1 	downto 0);  
		Z		:	OUT std_logic_vector(2*n	downto 0 );
		End_Flag	:	OUT	std_LOGIC
		        );
END  COMPONENT; 


COMPONENT Gi    
		   PORT( 
		        A,B	:	IN  std_logic; 
		        G 	:	OUT  std_logic
		         );  
 END  COMPONENT ;  
		 
		 
COMPONENT Pi     

		   PORT( 
		        A,B	:	IN  std_logic; 
		        P 	:	OUT  std_logic
		         );  
 END  COMPONENT ;  
		 
COMPONENT SUMi    

		   PORT( 
		        P,C	:	IN  std_logic; 
		        S	:	OUT  std_logic
		         );  
END  COMPONENT ;

  
 COMPONENT Ci_p    

		   PORT( 
		        G,P,C	:	IN  std_logic; 
		        Cp	:	OUT  std_logic
		         );  
 END  COMPONENT ;
 
COMPONENT Manchester  
			GENERIC (
				n:INTEGER:=4
				);
		   PORT( 
		        A,B	:	IN  std_logic_vector(n-1 DOWNTO 0):=(others=>'0'); 
		        Cin 	:	IN  std_logic:='0';
		        Sout	:	OUT std_logic_vector(n-1 DOWNTO 0):=(others=>'0'); 
		        Cout	:	OUT std_logic:='0'
		         );  
END  component ; 

COMPONENT Carry_Look_Ahead   
			GENERIC (
				n:INTEGER:=4
				);
		   PORT( 
		        A,B	:	IN  std_logic_vector(n-1 DOWNTO 0):=(others=>'0'); 
		        Cin 	:	IN  std_logic:='0';
		        Sout	:	OUT std_logic_vector(n-1 DOWNTO 0):=(others=>'0'); 
		        Cout	:	OUT std_logic:='0'
		         );  
END  COMPONENT ; 
		 
COMPONENT OR_series    
		GENERIC(
				n:INTEGER:=4
				);

		   PORT( 
				Input	:IN 	std_logic_vector(n-1 DOWNTO 0);
				Output	:OUT	std_logic
		         );  
 END  COMPONENT ;
COMPONENT AND_series    
		GENERIC(
				n:INTEGER:=4
				);

		   PORT( 
				Input	:IN 	std_logic_vector(n-1 DOWNTO 0);
				Output	:OUT	std_logic
		         );  
END  COMPONENT ; 
END PACKAGE;




 
 

	





