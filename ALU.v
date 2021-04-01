`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2021 03:53:09 PM
// Design Name: 
// Module Name: ALU
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
module ALU(
    input [15:0] in1,in2,
    input [1:0] alu_op,
    output reg [15:0] alu_result,
    output reg zero
    );
    wire [16:0] temp;

    //ALU Opcodes
    localparam ADD = 2'b00;                                                                                                                                                                                                                                                                                                                                                                                                                                         
    localparam SUB = 2'b01;
    localparam AND = 2'b10;
    localparam OR = 2'b11;
always @ (*) 
    begin
        case(alu_op)
            ADD: alu_result = in1 + in2;   //ADD
            SUB: alu_result = in1 - in2;   //SUB
            AND: alu_result = in1 & in2;   //AND
             OR: alu_result = in1 | in2;   //OR
             default: alu_result = in1 + in2; //default
        endcase
        if(alu_result == 0)
            zero = 1'b1;
        else
            zero = 1'b0;    
    end
endmodule