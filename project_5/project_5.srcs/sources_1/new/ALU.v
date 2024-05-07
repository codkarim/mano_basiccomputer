`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 07:39:56 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [7:0]DR,
    input  [7:0]AC,
    input AND,ADD, LDA, CMA,CIR,CIL,
    output reg E,
    output reg [7:0]datain);   // DataIN TO AC
    
    wire [7:0]shr;
    wire [7:0]shl;
    
  Data_Regester u1(.DR(DR));
  processor_reg u2(.AC(AC));  
  
  initial E<=0;
    
    always@ *begin
    
    if (AND)begin
    datain = AC & DR;
    end 
    
    if (ADD) begin
    {E,datain} = AC+DR;  
    end
    
   if (LDA)begin
   datain = DR;
    end 
    
   if (CMA)begin
        datain = ~AC ;
   end
   
   if (CIR)begin
       datain = AC>>>1;
       
       datain[7]=E;
       E<=datain[0];
      
   end
   
   if (CIL)begin
       datain = AC<<<1;
       datain[0] <= E;
        E <= datain[7]; 
   end    
    
    end
 assign  shr = (CIR ? 8'hff :8'b0);
endmodule
