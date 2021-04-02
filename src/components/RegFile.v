`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Darrian Johnson 
// 
// Create Date: 03/14/2021 01:46:03 PM
// Design Name: 
// Module Name: RegFile
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
module RegFile(
    input enable,clk,
    input [3:0] read_reg1,read_reg2,write_reg,
    input [15:0] write_data,
    output reg [15:0] read_data1,read_data2,
    output reg [15:0] temp
    ); 
    reg [15:0] registers [0:15];    //16 16-bit registers
    integer i;
initial
    begin
        for(i=0;i<16;i=i+1)
            begin
                registers[i] <= 16'b0;
                temp <= 16'b0;
            end
    end
always @ (posedge clk)
    begin
        if(enable) begin
            registers[write_reg] <= write_data;
            temp <= write_data;
        end
        else begin
         //output selected registers
        assign read_data1 = registers[read_reg1];
        assign read_data2 = registers[read_reg2];
        end
    end   
endmodule