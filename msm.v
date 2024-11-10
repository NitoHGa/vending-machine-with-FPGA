//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//////////////////////////////////////////////////////////////////////////////////
module msm(clk, edo_LCD, rs,en,rw,dat);  
	input clk;  
	input [3:0]edo_LCD;
	output rs, en, rw;
	output [7:0]dat;	
	
	reg e; 
	reg [7:0] dat; 
	reg rs;   
	reg  [15:0] counter; 
	reg [4:0] current,next; 
	reg clkr; 
	reg [1:0] cnt; 
	
	reg [7:0]A[0:15]; 
	
	always @(posedge clk)	begin 
		counter=counter+1; 
		if(counter==16'h000f)  clkr=~clkr; 
	end 
	
	always @(posedge clkr) begin 
		current=next; 
		case(current) 
			0:   begin  rs<=0;	dat<=8'h30;	next<=1; end 	//Conf 8bit
			1:   begin  rs<=0; 	dat<=8'h0c;	next<=2; end 	//Encendemos pantalla
			2:   begin  rs<=0; 	dat<=8'h6; 	next<=3; end 	// 
			3:   begin  rs<=0; 	dat<=8'h1; 	next<=4; end	//Posiciona en 0 y limpia pantalla
			4:   begin  rs<=1; 	dat<=A[0]; 	next<=5; end 
			5:   begin  rs<=1; 	dat<=A[1];	next<=6; end 
			6:   begin  rs<=1; 	dat<=A[2];	next<=7; end 
			7:   begin  rs<=1; 	dat<=A[3]; 	next<=8; end 
			8:   begin  rs<=1; 	dat<=A[4]; 	next<=9; end 
			9:   begin  rs<=1; 	dat<=A[5]; 	next<=10;end 
			10:  begin  rs<=1;	dat<=A[6]; 	next<=11;end 
			11:  begin  rs<=1; 	dat<=A[7]; 	next<=12;end 
			12:  begin  rs<=1; 	dat<=A[8]; 	next<=13;end 
			13:  begin  rs<=1; 	dat<=A[9]; 	next<=14;end 
			14:  begin  rs<=1; 	dat<=A[10]; next<=15;end 
			15:  begin  rs<=1; 	dat<=A[11]; next<=16;end 
			16:  begin  rs<=1; 	dat<=A[12]; next<=17;end 
			17:  begin  rs<=1; 	dat<=A[13]; next<=18;end 
			18:  begin  rs<=1; 	dat<=A[14]; next<=19;end 
			19:  begin  rs<=1; 	dat<=A[15]; next<=0; end
			default:   next=0; 
		endcase 
	end 
	assign en=clkr; 
	assign rw=0; 
	
	//Caso para LCD
	always@(posedge clk)begin
		case(edo_LCD)
			0: begin
				A[0] 	= " ";
				A[1] 	= "W";
				A[2] 	= "E";
				A[3] 	= "L";
				A[4] 	= "C";
				A[5] 	= "O";
				A[6] 	= "M";
				A[7] 	= "E";
				A[8] 	= "!";
				A[9] 	= " ";
				A[10] = " ";
				A[11] = " ";
				A[12] = " ";
				A[13] = " ";
				A[14] = " ";
				A[15] = " ";
			end
			1: begin
				A[0] 	= " ";
				A[1] 	= "I";
				A[2] 	= "N";
				A[3] 	= "S";
				A[4] 	= "E";
				A[5] 	= "R";
				A[6] 	= "T";
				A[7] 	= " ";
				A[8] 	= "A";
				A[9] 	= " ";
				A[10] = "C";
				A[11] = "O";
				A[12] = "I";
				A[13] = "N";
				A[14] = " ";
				A[15] = " ";
			end
			2: begin
				A[0] 	= " ";
				A[1] 	= "I";
				A[2] 	= "N";
				A[3] 	= "S";
				A[4] 	= "E";
				A[5] 	= "R";
				A[6] 	= "T";
				A[7] 	= "E";
				A[8] 	= "D";
				A[9] 	= " ";
				A[10] = "C";
				A[11] = "O";
				A[12] = "I";
				A[13] = "N";
				A[14] = " ";
				A[15] = " ";
			end
			3: begin
				A[0] 	= "S";
				A[1] 	= "E";
				A[2] 	= "L";
				A[3] 	= "E";
				A[4] 	= "C";
				A[5] 	= "T";
				A[6] 	= " ";
				A[7] 	= "A";
				A[8] 	= " ";
				A[9] 	= "P";
				A[10] = "R";
				A[11] = "O";
				A[12] = "D";
				A[13] = "U";
				A[14] = "C";
				A[15] = "T";
			end
			4: begin //Producto 1
				A[0] 	= " ";
				A[1] 	= " ";
				A[2] 	= "P";
				A[3] 	= "R";
				A[4] 	= "O";
				A[5] 	= "D";
				A[6] 	= "U";
				A[7] 	= "C";
				A[8] 	= "T";
				A[9] 	= " ";
				A[10] = "N";
				A[11] = "o";
				A[12] = " ";
				A[13] = "1";
				A[14] = " ";
				A[15] = " ";
			end
			5: begin //Producto 2
				A[0] 	= " ";
				A[1] 	= " ";
				A[2] 	= "P";
				A[3] 	= "R";
				A[4] 	= "O";
				A[5] 	= "D";
				A[6] 	= "U";
				A[7] 	= "C";
				A[8] 	= "T";
				A[9] 	= " ";
				A[10] = "N";
				A[11] = "o";
				A[12] = " ";
				A[13] = "2";
				A[14] = " ";
				A[15] = " ";
			end
			6: begin //Producto 3
				A[0] 	= " ";
				A[1] 	= " ";
				A[2] 	= "P";
				A[3] 	= "R";
				A[4] 	= "O";
				A[5] 	= "D";
				A[6] 	= "U";
				A[7] 	= "C";
				A[8] 	= "T";
				A[9] 	= " ";
				A[10] = "N";
				A[11] = "o";
				A[12] = " ";
				A[13] = "3";
				A[14] = " ";
				A[15] = " ";
			end
			7: begin //Producto 4
				A[0] 	= " ";
				A[1] 	= " ";
				A[2] 	= "P";
				A[3] 	= "R";
				A[4] 	= "O";
				A[5] 	= "D";
				A[6] 	= "U";
				A[7] 	= "C";
				A[8] 	= "T";
				A[9] 	= " ";
				A[10] = "N";
				A[11] = "o";
				A[12] = " ";
				A[13] = "4";
				A[14] = " ";
				A[15] = " ";
			end
			8: begin //Producto 5
				A[0] 	= " ";
				A[1] 	= " ";
				A[2] 	= "P";
				A[3] 	= "R";
				A[4] 	= "O";
				A[5] 	= "D";
				A[6] 	= "U";
				A[7] 	= "C";
				A[8] 	= "T";
				A[9] 	= " ";
				A[10] = "N";
				A[11] = "o";
				A[12] = " ";
				A[13] = "5";
				A[14] = " ";
				A[15] = " ";
			end
			9: begin //Producto 6
				A[0] 	= " ";
				A[1] 	= " ";
				A[2] 	= "P";
				A[3] 	= "R";
				A[4] 	= "O";
				A[5] 	= "D";
				A[6] 	= "U";
				A[7] 	= "C";
				A[8] 	= "T";
				A[9] 	= " ";
				A[10] = "N";
				A[11] = "o";
				A[12] = " ";
				A[13] = "6";
				A[14] = " ";
				A[15] = " ";
			end
			10: begin //Press A
				A[0] 	= " ";
				A[1] 	= "P";
				A[2] 	= "R";
				A[3] 	= "E";
				A[4] 	= "S";
				A[5] 	= "S";
				A[6] 	= " ";
				A[7] 	= "A";
				A[8] 	= " ";
				A[9] 	= "O";
				A[10] = "R";
				A[11] = " ";
				A[12] = "W";
				A[13] = "A";
				A[14] = "I";
				A[15] = "T";
			end
			11: begin
				A[0] 	= "S";
				A[1] 	= "E";
				A[2] 	= "L";
				A[3] 	= "E";
				A[4] 	= "C";
				A[5] 	= "T";
				A[6] 	= "E";
				A[7] 	= "D";
				A[8] 	= " ";
				A[9] 	= "P";
				A[10] = "R";
				A[11] = "O";
				A[12] = "D";
				A[13] = "U";
				A[14] = "C";
				A[15] = "T";
			end
			12: begin
				A[0] 	= "W";
				A[1] 	= "A";
				A[2] 	= "I";
				A[3] 	= "T";
				A[4] 	= " ";
				A[5] 	= "A";
				A[6] 	= " ";
				A[7] 	= "P";
				A[8] 	= "R";
				A[9] 	= "O";
				A[10] = "D";
				A[11] = "U";
				A[12] = "C";
				A[13] = "T";
				A[14] = " ";
				A[15] = " ";
			end
			13: begin
				A[0] 	= "T";
				A[1] 	= "A";
				A[2] 	= "K";
				A[3] 	= "E";
				A[4] 	= " ";
				A[5] 	= "A";
				A[6] 	= " ";
				A[7] 	= "P";
				A[8] 	= "R";
				A[9] 	= "O";
				A[10] = "D";
				A[11] = "U";
				A[12] = "C";
				A[13] = "T";
				A[14] = " ";
				A[15] = " ";
			end
			14: begin
				A[0] 	= "P";
				A[1] 	= "R";
				A[2] 	= "O";
				A[3] 	= "D";
				A[4] 	= "U";
				A[5] 	= "C";
				A[6] 	= "T";
				A[7] 	= " ";
				A[8] 	= "T";
				A[9] 	= "A";
				A[10] = "K";
				A[11] = "E";
				A[12] = "N";
				A[13] = " ";
				A[14] = " ";
				A[15] = " ";
			end
			15: begin
				A[0] 	= "S";
				A[1] 	= "E";
				A[2] 	= "E";
				A[3] 	= " ";
				A[4] 	= "Y";
				A[5] 	= "O";
				A[6] 	= "U";
				A[7] 	= " ";
				A[8] 	= "L";
				A[9] 	= "A";
				A[10] = "T";
				A[11] = "T";
				A[12] = "E";
				A[13] = "R";
				A[14] = " ";
				A[15] = " ";
			end
		endcase
	end
endmodule
