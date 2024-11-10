module teclado(
   input clk,
   input [3:0] filas,
   output reg [3:0] columnas,
   output reg [3:0] btn_pres
);

   reg [1:0] count;
	reg [2:0]edo;
	initial btn_pres = 4'b1111;
   always @(posedge clk) begin
		count <= (count == 3)? 0: count + 1;
      // Asignación de columnas
      case(count)
         0: columnas <= 4'b1110;
         1: columnas <= 4'b1101;
         2: columnas <= 4'b1011;
         3: columnas <= 4'b0111;
      endcase

		case(columnas)
			4'b1110: begin
				if(filas==4'b1110) edo<=0;
				if(filas==4'b1101) edo<=1;
				if(filas==4'b1011) edo<=2;
				if(filas==4'b0111) edo<=3;
			end
			4'b1101: begin
				if(filas==4'b1110) edo<=4;
				if(filas==4'b1101) edo<=5;
				if(filas==4'b1011) edo<=6;
			end
			default: edo<=7;
		endcase
		case(edo)
			0: btn_pres <= 4'b1110;
			1: btn_pres <= 4'b1101; 
			2: btn_pres <= 4'b1100;
			3: btn_pres <= 4'b1011;//
			4: btn_pres <= 4'b1010;
			5: btn_pres <= 4'b1001;
			6: btn_pres <= 4'b1000;
			default: btn_pres <= 4'b1111;
		endcase
   end
endmodule
