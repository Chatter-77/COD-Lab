`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2024 15:39:36
// Design Name: 
// Module Name: instruction_decode_stage
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


module instruction_decode_stage #(parameter N=32)(instr,reg1,reg2,immi,func3,func7,opcode,wd,regwrite);
input logic [N-1:0] instr,wd;
input logic regwrite;
output logic [N-1:0] reg1,reg2,immi;
output logic [2:0] func3;
output logic [6:0] func7,opcode;
logic [4:0] dec_to_rd,dec_to_rs1,dec_to_rs2;
logic [11:0] dec_signext;
decoder g5 (.instr(instr), .opcode(opcode), .func3(func3), .func7(func7), .rd(dec_to_rd), .rs1(dec_to_rs1), .rs2(dec_to_rs2), .immi(dec_signext));
reg_file g6 (.rs1(dec_to_rs1), .rs2(dec_to_rs2), .rd(dec_to_rd), .reg1(reg1), .reg2(reg2), .wd(wd), .regwrite(regwrite));
sign_extention g7 (.immi(dec_signext), .ext_immi(immi));
endmodule
