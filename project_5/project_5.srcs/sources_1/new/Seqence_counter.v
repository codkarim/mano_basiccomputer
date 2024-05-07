`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2024 11:36:35 PM
// Design Name: 
// Module Name: Seqence_counter
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


module Seqence_counter(
    input CLK,
    input  [7:0]D ,
    input  [7:0] T,
    input INR,CLR,
    output reg [3:0]SC);

    operation_selecction q6(.D(D))    ;
    Timer q7 (.T(T));
    
    assign CLR= (T[5] &&(D[0]||D[1]||D[2]||D[5])) || (T[4] && (D[3]||D[4])) || (T[6]&&D[6]) || (D[7]&&T[3]) ; 
    assign INR = ~CLR;  
    initial SC <=0;
    always @(posedge CLK) begin

    if(CLR) begin
		   SC <= 0;
	end	
	if(INR)begin
		   SC<= SC + 1;
	end
	
	end        
endmodule
