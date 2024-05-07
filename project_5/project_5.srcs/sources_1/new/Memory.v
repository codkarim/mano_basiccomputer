`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 01:15:53 AM
// Design Name: 
// Module Name: Memory
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


module memory(
    input clk,
    input J,
    input  [7:0]D ,
    input  [7:0] T,
    input R,W,        // write (actve low) and read active(high)
    input [3:0] AR,  //address regester 4-bit
    input [7:0] datain,
    output reg  [7:0] dataout
    );
    
    operation_selecction W6(.D(D),.J(J));
    Timer W7 (.T(T)); 
    
    Address_Regester U0(.AR(AR));
    assign R = T[1] || (~D[7] && J && T[3]) ||  (T[4] &&(D[0]||D[1]||D[2]||D[6]));
    assign W = (T[4] && (D[3]||D[5])) || (D[6] &&T[6]);      

    reg [7:0] m [15:0] ; //16 memory locatins and 8 word length
    // PC and AR=4_BIT , THE REST OF REGESTERS IS 8_BIT
    initial begin
    
     // MEMORY REFERENCE(DIRECT):-
         m[0]=8'h0a;   //AND
         m[1]=8'h1b;   //ADD
         m[2]=8'h2c;   //LDA
         m[3]=8'h3d;   //STA
         m[4]=8'h4e;   //BUN
         m[5]=8'h5f;   //BSA
         m[6]=8'h60;   //ISZ
         
    //MEMORY REFERENCE(INDIRECT):-
         m[7]=8'h81;   //AND
         m[8]=8'h92;   //ADD
         m[9]=8'ha3;   //LDA
         m[10]=8'hb4;  //STA
         m[11]=8'hc5;  //BUN
         
     // REGESTER REFERENCE   
         m[12]=8'h78;  //CLA
         m[13]=8'h74;  //CMA
         m[14]=8'h72;  //CIR
         m[15]=8'h71;  //CLA
      
     end
    
    always@ (posedge clk)
    begin
        if(W)  //DESTINATION
        begin
           m[AR] = datain;
        end
        if (R)  //SOURCE
        begin
           dataout =  m[AR];
        end
        
     end  
    
  //  assign dataout = R ? temp_data : 'hzz;
    
endmodule
