`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 10:33:22 AM
// Design Name: 
// Module Name: Enncoder
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


module Encoder(
 input [7:0] Xe,
 output [2:0] S
    );
    
     assign S =
         (Xe[7] == 1'b1) ? 3'b111:
         (Xe[6] == 1'b1) ? 3'b110:
         (Xe[5] == 1'b1) ? 3'b101:
         (Xe[4] == 1'b1) ? 3'b100:
         (Xe[3] == 1'b1) ? 3'b011:
         (Xe[2] == 1'b1) ? 3'b010:
         (Xe[1] == 1'b1) ? 3'b001:
         (Xe[0] == 1'b1) ? 3'b000: 3'bxxx; // 3'bxxx  if none of this happened s= xxx which that willnot happen because it must be one of them

    
    


endmodule
