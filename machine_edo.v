//////////////////////////////////////////////////////////////////////////////////
// @Author: Codelectronics 
// 
//////////////////////////////////////////////////////////////////////////////////
module machine_edo(
	input clk,			 						//Relojs
	input btn, fin,	//Interruptores
	input [3:0]Tecla,
	output reg [2:0]sel_motor,
	output reg [3:0]edo_LCD
	);
	//
	
	//Maquina de estados para cambio de manesajes
	reg time_3s;
	reg [31:0]counter_3s;
	reg enable;
	//Inicializamos variables
	initial begin
		edo_LCD = 0;					//Iniciamos en el estado 0 para la LCD
		time_3s = 0;
		sel_motor = 0;
	end
	//Bloque de instrucciones para la maquina de estados
	always@(posedge clk) begin
		//Control del contador para cambios automaticos
		if (enable == 1) begin
			time_3s <= 0;
			if (counter_3s == 150_000_000) begin
				time_3s <= 1;
				counter_3s <= 0;
			end
			else begin
				time_3s <= 0;
				counter_3s <= counter_3s + 1;
			end
		end
		else begin time_3s <= 0; end
		//Control para los cambios no automaticos
		case(edo_LCD)
			0: begin								//Bienvenidos
				if(time_3s == 1) begin
					enable = 0;
					edo_LCD = 1;				//Mandamos al estado 1
				end
				else begin
					enable = 1;
					edo_LCD = 0;
				end
			end
			1: begin								//Inserte una moneda
				if(btn == 0) begin
					edo_LCD = 2;				//Mandamos al estado 2
				end
				else begin
					edo_LCD = 1;
				end
			end 
			2: begin								//Moneda insertada
				if(time_3s == 1) begin
					enable = 0;
					edo_LCD = 3;				//Mandamos al estado 3
				end
				else begin
					enable = 1;
					edo_LCD = 2;
				end
			end
			3: begin								//Seleccione un producto
				case(Tecla)
					4'b1110: begin edo_LCD = 4; end//Producto 1
					4'b1101: begin edo_LCD = 5; end//Producto 2
					4'b1100: begin edo_LCD = 6; end//Producto 3
					default: begin edo_LCD = 3; end//Seleccione un producto
				endcase
			end
			4: begin	//Producto 1
				if(time_3s == 1) begin
					enable = 0;
					edo_LCD = 10;
					sel_motor <= 3'b001; //Motor 1 encendido
				end
				else begin
					enable = 1;
					edo_LCD = 4;
				end
			end
			5: begin	//Producto 2
				if(time_3s == 1) begin
					enable = 0;
					edo_LCD = 10;
					sel_motor <= 3'b010; //Motor 2 encendido
				end
				else begin
					enable = 1;
					edo_LCD = 5;
				end
			end
			6: begin	//Producto 3
				if(time_3s == 1) begin
					enable = 0;
					edo_LCD = 10;
					sel_motor <= 3'b011; //Motor 3 encendido
				end
				else begin
					enable = 1;
					edo_LCD = 6;
				end
			end
			7: begin	//Producto 4
				if(time_3s == 1) begin
					enable = 0;
					edo_LCD = 10;
					sel_motor <= 3'b100; //Motor 4 encendido
				end
				else begin
					enable = 1;
					edo_LCD = 7;
				end
			end
			8: begin	//Producto 5
				if(time_3s == 1) begin
					enable = 0;
					edo_LCD = 10;
					sel_motor <= 3'b101; //Motor 5 encendido
				end
				else begin
					enable = 1;
					edo_LCD = 8;
				end
			end
			9: begin	//Producto 6
				if(time_3s == 1) begin
					enable = 0;
					edo_LCD = 10;
					sel_motor <= 3'b110; //Motor 2 encendido
				end
				else begin
					enable = 1;
					edo_LCD = 9;
				end
			end
			10: begin		//Presione A o espere
				if(Tecla == 4'b1011) edo_LCD = 11;
				else begin
					if(time_3s == 1) begin
						enable = 0;	
						edo_LCD = 3;				//Mandamos al estado 3
					end
					else begin
						enable = 1;
						edo_LCD = 10;
					end
				end
			end
			11: begin //Producto seleccionado
				if(time_3s == 1) begin
					enable = 0;
					edo_LCD = 12;
				end
				else begin
					enable = 1;
					edo_LCD = 11;
				end
			end
			12: begin								//Espere su producto
				if(time_3s == 1) begin
					
					enable = 0;
					edo_LCD = 13;		
				end
				else begin
					enable = 1;
					edo_LCD = 12;
				end
			end
			13: begin								//Recoja su producto
				if(fin == 0) begin
					edo_LCD = 14;		
				end
				else begin
					edo_LCD = 13;	
				end
			end
			14: begin
				if(fin == 1)  begin
					if(time_3s == 1) begin
						enable = 0;
						edo_LCD = 15;			
					end
					else begin
						enable = 1;
						edo_LCD = 14;
					end				//Producto recojido
				end
			end
			15: begin								//Adios
				if(time_3s == 1) begin
					enable = 0;
					edo_LCD = 0;				//Mandamos al estado 0
				end
				else begin
					enable = 1;
					edo_LCD = 15;
				end
			end
		endcase
	end
endmodule
 