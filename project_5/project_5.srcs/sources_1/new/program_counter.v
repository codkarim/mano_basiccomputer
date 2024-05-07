`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2024 10:49:01 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter(
    input CLK,
    input  [7:0]D ,
    input  [7:0] T,
    input  LD,INR,
    input  [3:0] datain,
    output reg [3:0] PC  );
     
    operation_selecction q8(.D(D))    ;
    Timer q9 (.T(T));
    assign LD=(D[4]&&T[4]) || (D[5]&&T[5]);    
    assign INR =T[1] || (D[6]&&T[6]);
    initial PC <=0;

    always @(posedge CLK) begin

        if(LD) begin
            PC <= datain;
         end
	
		if(INR) begin
			PC<= PC + 1;
	    end
	
	end
endmodule
