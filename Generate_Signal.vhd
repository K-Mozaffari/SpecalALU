
		 library IEEE; 
		 use IEEE.STD_LOGIC_1164.all; 
		 use work.package_6541.all;
		USE ieee.numeric_std.ALL;
 
		  
		ENTITY Control_Signal IS  

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
		 END  Control_Signal ;  
		 
		 ARCHITECTURE structural OF Control_Signal IS  
		SIGNAL Com :std_logic;
		BEGIN

Load_cmd	<=	y2_n AND( y1_n AND (y0 ));
Add_cmd		<=	(y2_n and (y1 and y0) );
Com		<=	((y2 AND y1_n ) AND y0_n);
One_cmd		<= ((y2_n and (y1 and y0)) and 	C2);
Select_cmd	<=(y2_n and (y1 and y0))and 	(LSB_n AND C2);
Shift_cmd	<=	Com;
Count_cmd	<=	Com;
		 END structural;
