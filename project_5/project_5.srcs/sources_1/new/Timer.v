`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2024 10:02:39 PM
// Design Name: 
// Module Name: Timer
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


module Timer(

    input [3:0] SC,
    output reg [7:0] T);
    
    Seqence_counter w8(.SC(SC));
     initial T <=0;
   
      always @* begin
      
        case(SC[2:0])  // Choose The Operation By Decoder 3*8
                 3'B000: T =8'h01;    //T0
                 3'B001: T =8'h02;    //T1
                 3'B010: T =8'h04;    //T2
                 3'B011: T =8'h08;    //T3
                 3'B100: T =8'h10;    //T4
                 3'B101: T =8'h20;    //T5
                 3'B110: T =8'h40;    //T6
                 3'B111: T =8'h80;    //T7
      endcase
    end
    
endmodule
