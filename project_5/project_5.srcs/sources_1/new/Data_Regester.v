`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2024 11:22:10 PM
// Design Name: 
// Module Name: Data_Regester
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


module Data_Regester(
    input CLK,
    input  [7:0]D ,
    input  [7:0] T,
    input LD,INR,
    input [7:0] datain,
    output  reg [7:0] DR);
 
       
    operation_selecction q6(.D(D))    ;
    Timer q7 (.T(T));  
      
    assign LD =T[4] &&(D[0]||D[1]||D[2]||D[6]);
    assign INR = D[6] && T[5];
    
    initial DR <=0;

always @(posedge CLK) begin

         if(LD) begin
             DR <= datain;
         end
         
	     if(INR) begin
			DR<= DR + 1;
		 end
	end    
endmodule
