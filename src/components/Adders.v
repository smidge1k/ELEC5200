`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2021 12:24:41 PM
// Design Name: 
// Module Name: Adder1
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
module Adders(
    input rst, clk,
    input [15:0] a, b,
    output reg [15:0] out1, out2    
);
always @ (*)
    begin
        if(rst) begin
            out1 <= 16'h0000;
            out2 <= 16'h0000;
        end
        else if (clk)
            begin
                out1 <= a + 1'b1;
                out2 <= a + b;
            end
    end
endmodule