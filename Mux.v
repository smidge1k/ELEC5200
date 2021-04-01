`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Darrian Johnson 
// 
// Create Date: 03/14/2021 12:40:05 PM
// Design Name: 
// Module Name: Mux1
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
module Mux(
    input [15:0] a,b,
    input wire sel,
    output reg [15:0] out,
    output reg [15:0] mux_temp
    ); 
always @ (a or b or sel)
    begin
        case (sel)
            1'b0: begin out = a; mux_temp = a; end
            1'b1: begin out = b; mux_temp = b; end
        endcase        
    end
endmodule