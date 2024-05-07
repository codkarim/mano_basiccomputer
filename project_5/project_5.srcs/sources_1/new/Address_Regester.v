`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2024 11:10:59 PM
// Design Name: 
// Module Name: Address_Regester
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


module Address_Regester(
    input CLK,
    input  [7:0]D ,
    input J,
    input  [7:0] T,
    input LD,INR,
    input [3:0] datain,
    output reg [3:0] AR  );
     
        
    operation_selecction q4(.D(D),.J(J))    ;
    Timer q5 (.T(T));    
    assign LD =T[0] || T[2] || (~D[7] && J && T[3]);
    assign INR = (D[5] && T[4]) ;    
    initial AR <=0;    
    
    always @(posedge CLK) begin

        if(LD) begin
              AR <= datain;
        end
	
		 if(INR)begin
			   AR<= AR + 1;
	     end

    end
endmodule
