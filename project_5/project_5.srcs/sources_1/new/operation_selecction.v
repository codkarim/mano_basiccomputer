`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2024 09:55:07 PM
// Design Name: 
// Module Name: operation_selecction
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


module operation_selecction(
input [7:0] IR,
input [7:0] T,
input [3:0] SC,
output reg [7:0]D,
output reg J,
output reg [3:0] B 
    );
     
  Instruction_Regester w3(.IR(IR));
  Timer w4(.T(T));  
  Seqence_counter w5 (.SC(SC));
  
    initial D <=0;
    
    always @(SC) begin
    
      if (T[2])begin  
               J<=IR[7];
      end         
      case(IR[6:4])  // Choose The Operation By Decoder
               3'B000: D =8'h01;    //D0
               3'B001: D =8'h02;    //D1
               3'B010: D =8'h04;    //D2
               3'B011: D =8'h08;    //D3
               3'B100: D =8'h10;    //D4
               3'B101: D =8'h20;    //D5
               3'B110: D =8'h40;    //D6
               3'B111: D =8'h80;    //D7           
     endcase
     case(IR[3:0])  // Choose The Operation By Decoder
                    3'B000: B =8'h01;    //B0
                    3'B001: B =8'h02;    //B1
                    3'B010: B =8'h04;    //B2
                    3'B011: B =8'h08;    //B3
     endcase
     
    end
    
    
    
endmodule
