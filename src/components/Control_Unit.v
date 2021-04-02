`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Darrian Johnson 
// 
// Create Date: 03/14/2021 05:19:12 PM
// Design Name: 
// Module Name: Control_Unit
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
module Control_Unit(
    input [3:0] opcode,
    output reg [1:0] alu_op,
    output reg branch,mem2reg,mem_read,mem_write,
               alu_src,reg_write
    );
always @ (*)
    begin
        case(opcode)
            4'b0000:    //plus
                begin
                     branch = 1'b0;
                     mem2reg = 1'b0;
                     mem_read = 1'b0;
                     mem_write = 1'b0;
                     alu_src = 1'b0;
                     alu_op = 2'b00;
                     reg_write = 1'b1;
                end
            4'b0001:    //min
                begin
                     branch = 1'b0;
                     mem2reg = 1'b0;
                     mem_read = 1'b0;
                     mem_write = 1'b0;
                     alu_src = 1'b0;
                     alu_op = 2'b01;
                     reg_write = 1'b1;
                end
            4'b0010:    //and
                begin
                     branch = 1'b0;
                     mem2reg = 1'b0;
                     mem_read = 1'b0;
                     mem_write = 1'b0;
                     alu_src = 1'b0;
                     alu_op = 2'b10;
                     reg_write = 1'b1;
                end
            4'b0011:    //or
                begin
                     branch = 1'b0;
                     mem2reg = 1'b0;
                     mem_read = 1'b0;
                     mem_write = 1'b0;
                     alu_src = 1'b0;
                     alu_op = 2'b11;
                     reg_write = 1'b1;
                end
            4'b0100:    //ldw
                begin
                     branch = 1'b0;
                     mem2reg = 1'b1;
                     mem_read = 1'b1;
                     mem_write = 1'b0;
                     alu_src = 1'b1;
                     alu_op = 2'b00;
                     reg_write = 1'b1;
                end
            4'b0101:    //stw
                begin
                     branch = 1'b0;
                     mem2reg = 1'b1;
                     mem_read = 1'b0;
                     mem_write = 1'b1;
                     alu_src = 1'b1;
                     alu_op = 2'b00;
                     reg_write = 1'b0;
                end
            4'b0110:    //plusi
                begin
                     branch = 1'b0;
                     mem2reg = 1'b0;
                     mem_read = 1'b0;
                     mem_write = 1'b0;
                     alu_src = 1'b1;
                     alu_op = 2'b00;
                     reg_write = 1'b1;
                end                
            4'b0111:    //lui
                begin
                     branch = 1'b0;
                     mem2reg = 1'b0;
                     mem_read = 1'b0;
                     mem_write = 1'b0;
                     alu_src = 1'b0;
                     alu_op = 2'bxx;
                     reg_write = 1'b0;
                end
            4'b1000:    //beq
                begin
                     branch = 1'b1;
                     mem2reg = 1'bx;
                     mem_read = 1'b0;
                     mem_write = 1'b0;
                     alu_src = 1'b0;
                     alu_op = 2'b01;
                     reg_write = 1'b0;
                end
            4'b1001:    //bne
                begin
                     branch = 1'b1;
                     mem2reg = 1'bx;
                     mem_read = 1'b0;
                     mem_write = 1'b0;
                     alu_src = 1'b0;
                     alu_op = 2'b01;
                     reg_write = 1'b0;
                end
            4'b1010:    //bgt
                begin
                     branch = 1'b1;
                     mem2reg = 1'bx;
                     mem_read = 1'b0;
                     mem_write = 1'b0;
                     alu_src = 1'b0;
                     alu_op = 2'b01;
                     reg_write = 1'b0;
                end
            4'b1011:    //blt
                begin
                     branch = 1'b1;
                     mem2reg = 1'bx;
                     mem_read = 1'b0;
                     mem_write = 1'b0;
                     alu_src = 1'b0;
                     alu_op = 2'b01;
                     reg_write = 1'b0;
                end
            4'b1100:    //bge
                begin
                     branch = 1'b1;
                     mem2reg = 1'bx;
                     mem_read = 1'b0;
                     mem_write = 1'b0;
                     alu_src = 1'b0;
                     alu_op = 2'b01;
                     reg_write = 1'b0;
                end
            4'b1101:    //blte
                begin
                     branch = 1'b1;
                     mem2reg = 1'bx;
                     mem_read = 1'b0;
                     mem_write = 1'b0;
                     alu_src = 1'b0;
                     alu_op = 2'b01;
                     reg_write = 1'b0;
                end
            4'b1110:    //jmp
                begin
                     branch = 1'b1;
                     mem2reg = 1'b1;
                     mem_read = 1'b0;
                     mem_write = 1'b0;
                     alu_src = 1'bx;
                     alu_op = 2'bxx;
                     reg_write = 1'b0;
                end
            4'b1111:    //stop
                begin
                     branch = 1'b0;
                     mem2reg = 1'b0;
                     mem_read = 1'b0;
                     mem_write = 1'b0;
                     alu_src = 1'b0;
                     alu_op = 2'bxx;
                     reg_write = 1'b0;
                end                                                                                                                                                                                                                                    
        endcase
    end
endmodule