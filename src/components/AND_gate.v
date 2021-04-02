`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2021 11:10:48 PM
// Design Name: 
// Module Name: AND_gate
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
module AND_gate(
    input a, b,
    output reg y
    );
always @ (a or b) 
    begin
        if(a == 1'b1 && b == 1'b1) begin
            y = 1'b1;    
        end
        else
            y = 1'b0;
    end    
endmodule