//////////////////////////////////////////////////////////////////////////////////
// @Author: Codelectronics
// Maquina expendedora
//////////////////////////////////////////////////////////////////////////////////
module Maquina_expendedora(
	input 	clk,			// Señal de reloj
	input 	btn,
	input 	fin,
	output 	rw,rs,en,
	output 	[7:0]dat,
	output 	[3:0]columnas,
	input 	[3:0]filas,
	output 	[3:0]motorPasos,
	output 	[5:0]pwm_Motor
 );	 
	// Variables internas
	//wire time_3s;
	wire [3:0]edo_LCD;
	wire [3:0]Tecla;
	wire [2:0]sel_motor;
	//Declaracion de instancias
	machine_edo U1(.clk(clk), .btn(btn), .Tecla(Tecla), 
						.fin(fin), .edo_LCD(edo_LCD), .sel_motor(sel_motor));
	msm	U2(.edo_LCD(edo_LCD), .clk(clk), .rs(rs), .rw(rw), .en(en), .dat(dat));
	teclado U3(.clk(clk), .columnas(columnas), .filas(filas), .btn_pres(Tecla));
	motores U4(.clk(clk), .motorPasos(motorPasos), .pwm_Motor(pwm_Motor), .sel_motor(sel_motor), .Tecla(Tecla), .edo_LCD(edo_LCD));
endmodule