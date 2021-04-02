`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2021 03:10:29 PM
// Design Name: 
// Module Name: Top_Level
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
module Top_Level(
//top-level signals
    input rst,clk,
    input [15:0] instruction,
    output [15:0] reg_temp,
    output [15:0] pcout_temp,
    output [15:0] wd_temp
    );
//Control unit wire 
    wire Branch,Mem2Reg,MemRead,MemWrite,AluSrc,RegWrite;
    wire [1:0] AluOp;
//Mux 1 to PC input wire    
    wire [15:0] Mux1ToPC;
//Mux1 enable wire
    wire AndOut;    
//Mux 2 to ALU input wire   
    wire [15:0] Mux2ToALU;    
//Mux 3 write data wire
    wire [15:0] Mux3ToReg;
//PC output wire
    wire [15:0] PCtoProgram;    
//RegFile wires
    wire [15:0] RD1, RD2;
//ImmGen wires
    wire [15:0] Imm_out;
//ALU wires
    wire Zero;    
    wire [15:0] AluResult;    
//Adder output wires
    wire [15:0] Adder1Out, Adder2Out;
//Data Memory output wire    
    wire [15:0] ReadDataMem;

PC PC(
.rst(rst),.clk(clk),
.PC_in(Mux1ToPC),
.PC_out(Mux1ToPC)
//.pcout_temp(pcout_temp)
);

ImmGen ImmGen(
.clk(clk),
.imm_in(instruction [15:12]),
.out(Imm_out)
);

Adders Adder(
.clk(clk),
.rst(rst),
.a(PCtoProgram),
.b(Imm_out),
.out1(Adder1Out),
.out2(Adder2Out)
);

Control_Unit Control(
.opcode (instruction [3:0]),
.alu_op(AluOp),
.branch(Branch),
.mem2reg(Mem2Reg),
.mem_read(MemRead),
.mem_write(MemWrite),
.alu_src(AluSrc),
.reg_write(RegWrite)
);

RegFile RegFile(
.enable(RegWrite),
.clk(clk),
.read_reg1(instruction [11:8]),
.read_reg2(instruction [15:12]),
.write_reg(instruction [7:4]),
.write_data(Mux3toReg),
.read_data1(RD1),
.read_data2(RD2),
.temp(reg_temp)
);

Mux Mux2(
.a(RD2),
.b(Imm_out),
.sel(AluSrc),
.out(Mux2ToALU)
);

ALU ALU(
.in1(RD1),
.in2(Mux2ToALU),
.alu_op(AluOp),
.alu_result(AluResult),
.zero(Zero)
);

AND_gate AND1(
.a(Branch),
.b(Zero),
.y(AndOut)
);

Mux Mux1(
.a(Adder1Out),
.b(Adder2Out),
.sel(AndOut),
.out(Mux1ToPC),
.mux_temp(pcout_temp)
);

Data_Memory DataMem(
.clk(clk),
.address(AluResult),
.WD(RD2),
.RD(ReadDataMem),
.mR(MemRead),
.mW(MemWrite)
);

Mux Mux3(
.a(AluResult),
.b(ReadDataMem),
.sel(Mem2Reg),
.out(Mux3ToReg),
.mux_temp(wd_temp)
);    
endmodule