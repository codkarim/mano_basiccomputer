`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 12:11:24 PM
// Design Name: 
// Module Name: BUS
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


module BUS(
    input  [7:0]D ,
    input J,
    input  [7:0] T,
    input [7:0]X,
    output [2:0] S);
 
    
    operation_selecction q0(.D(D),.J(J))    ;
    Timer q1 (.T(T));

// SOURCE

assign X[0] = 0  ;  // Nothing
assign X[1] =  (D[4]&&T[4]) || (D[5]&&T[5]);  // AR  
assign X[2] =   T[0] || (D[5]&&T[4]); //PC
assign X[3] =   (D[2]&&T[5]) || (D[6]&&T[6]);  //DR
assign X[4] =   D[3]&&T[4]; // AC
assign X[5] =   T[2];  // IR
assign X[6] =   0;   //TR
assign X[7] =     T[1] || (~D[7] && J && T[3]) ||  (T[4] &&(D[0]||D[1]||D[2]||D[6]));  //MEMORY 



assign S =
         (X[7] == 1'b1) ? 3'b111:
         (X[6] == 1'b1) ? 3'b110:
         (X[5] == 1'b1) ? 3'b101:
         (X[4] == 1'b1) ? 3'b100:
         (X[3] == 1'b1) ? 3'b011:
         (X[2] == 1'b1) ? 3'b010:
         (X[1] == 1'b1) ? 3'b001:
         (X[0] == 1'b1) ? 3'b000: 3'bxxx;  
        
endmodule
