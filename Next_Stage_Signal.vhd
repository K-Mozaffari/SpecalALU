
		 library IEEE; 
		 use IEEE.STD_LOGIC_1164.all; 
		 use work.package_6541.all;
		USE ieee.numeric_std.ALL;
 
		  
		ENTITY Next_Stage_Signal IS  

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
		 END  Next_Stage_Signal ;  
		 
ARCHITECTURE structural OF Next_Stage_Signal IS 
		BEGIN

		
y2_p    <= ( (y2_n AND y1 ) AND (y0 OR (LSB_n AND C2_n)));
y1_p	<= (((y2_n AND (y1_n AND y0)) OR ((y2_n AND (y1 AND y0_n))AND (LSB OR( LSB_n AND C2))) OR (y2 AND (y1_n AND (y0_n AND C8_n))))) ;
y0_p	<=((y2_n AND y0_n)AND (y1_n OR (y1 AND (LSB OR (LSB_n AND C2)))));
		 END structural;
