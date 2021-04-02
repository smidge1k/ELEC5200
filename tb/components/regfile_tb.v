`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Darrian Johnson 
// 
// Create Date: 03/15/2021 10:33:25 PM
// Design Name: 
// Module Name: regfile2_tb
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
module regfile_tb;
//inputs
reg clk,enable;//rst;
reg [3:0] read_reg1,read_reg2,write_reg;
reg [15:0] write_data; 
//outputs
wire [15:0] read_data1,read_data2;

RegFile UUT(.clk(clk),
            .enable(enable),
            .read_reg1(read_reg1),
            .read_reg2(read_reg2),
            .write_reg(write_reg),
            .write_data(write_data),
            .read_data1(read_data1),
            .read_data2(read_data2));
initial
    begin
        clk = 0;
        enable = 0;
        //rst = 0;
        forever
        #5 clk = ~clk;
    end
   initial
     begin
        write_reg = 1;
        enable = 1;
        write_data = 10;
        #20;
        write_reg = 2;
        enable = 1;
        write_data = 15;
        #20;
        write_reg = 3;
        enable = 1;
        write_data = 20;
        #20;
        read_reg1 = 1;
        enable = 0;
        #20;
        read_reg1 = 2;
        read_reg2 = 3;
        #20;
        read_reg1 = 1;
        write_reg = 1;
        enable = 1;
        write_data = 30;
        #20;
    end
endmodule