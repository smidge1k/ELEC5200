`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2021 06:39:49 PM
// Design Name: 
// Module Name: ImmGen_tb
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
module ImmGen_tb;
//inputs
reg clk;
reg [3:0] imm_in;
//outputs
wire [15:0] out;

ImmGen UUT(.clk(clk),.imm_in(imm_in),.out(out));
    initial
        begin
            clk = 0;
            forever
            #5 clk = ~clk;
        end
    initial
        begin
            imm_in = 4'd0;
        end
    initial
        begin
            #6 imm_in = 4'b0111;
            #12 imm_in = 4'b1111;
            #3  imm_in = 4'b1110;
        end        
endmodule