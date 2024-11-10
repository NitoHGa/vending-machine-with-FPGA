//////////////////////////////////////////////////////////////////////////////////
// @Author: Codelectronics
// Maquina expendedora
//////////////////////////////////////////////////////////////////////////////////
module selPWM(
	input clk,			// Señal de reloj
	input [2:0]edo_LCD,
	input at_Teclado,
	output pwm_Motor
 );	 

	//Contador para de pwm de los motores
	reg [19:0] pwm_Servo;
   always@(posedge clk) pwm_Servo <= (pwm_Servo < 500_000) ? pwm_Servo + 1 : 0;	
	
	
 endmodule