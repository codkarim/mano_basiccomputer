`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2024 11:28:52 PM
// Design Name: 
// Module Name: processor_reg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module processor_reg(
    input CLK,
    input J, 
    input  [3:0] B,
    input  [7:0]D ,
    input  [7:0] T,
    input LD,CLR,
    input [7:0] datain,
    output  reg [7:0] AC);
      
    ALU u3(.datain(datain));
      
    operation_selecction w0(.D(D),.J(J),.B(B));
    Timer w1 (.T(T));   
 
     assign LD = (T[5] && (D[0] || D [1] || D[2] ) ) || ((D[7] && ~J && T[3]) &&(B[0] || B[1] || B[2] ) ) ;
 
    assign CLR= (D[7] && ~J && T[3]) && B[3] ;
 
    initial AC<=0;
    
    always @(posedge CLK) begin

        if(LD) begin
            AC <= datain;
         end
		if(CLR) begin
		   AC <= 0;
		end
		
	end        
endmodule
