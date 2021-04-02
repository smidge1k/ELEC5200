`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2021 07:44:42 PM
// Design Name: 
// Module Name: PC
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
module PC(
    input rst,clk,
    input [15:0] PC_in,
    output reg [15:0] PC_out,
    output reg [15:0] pcout_temp
    );
initial
    begin
        PC_out <= 16'b0000_0000_0000_0000;
        pcout_temp <= 16'b0000_0000_0000_0000;
    end
always @ (PC_in)
    begin
        if(rst) 
            begin
                PC_out <= 16'b0000_0000_0000_0000;
                pcout_temp <= 16'b0000_0000_0000_0000;
            end    
        else if(clk) 
            begin 
                PC_out <= PC_in;
                pcout_temp <= PC_in;
            end
            $display("PC=%b",PC_out);    
    end 
endmodule