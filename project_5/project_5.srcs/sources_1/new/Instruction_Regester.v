`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2024 10:38:29 PM
// Design Name: 
// Module Name: Instruction_Regester
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


module Instruction_Regester(
    input CLK,
    input  [7:0]D ,
    input  [7:0] T,
    input LD,
    input [7:0] datain,
    output  reg [7:0]IR);
    
    operation_selecction q2(.D(D))    ;
    Timer q3 (.T(T));  
    assign LD = T[1];
    
    initial IR <=0;
    
    	always @(posedge CLK)
    begin
        
         if(LD) begin
            IR <= datain;  //IR IS DESTINATION
         end
    end    
    
    
endmodule
