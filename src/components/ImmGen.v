`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2021 04:55:17 PM
// Design Name: 
// Module Name: ImmGen
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
module ImmGen(
    input clk,
    input [3:0] imm_in,
    output reg [15:0] out 
    );
    wire [3:0] imm;
    assign imm = imm_in;
//sign extension of input assigned to output
always @ (*)
    begin
        out [15:0] <= {{12{imm[3]}}, imm[3:0]};        
    end 
endmodule