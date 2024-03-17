`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:52:57 01/10/2024 
// Design Name: 
// Module Name:    Inst_Decoder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Inst_Decoder(op_code,funct,Write_Reg,ALU_OP,w_r_s,imm_s,rt_imm_s,Mem_Write,wr_data_s,PC_s,ZF);
input [5:0]op_code;
input [5:0]funct;
input ZF;
output reg[2:0]ALU_OP;
output reg Write_Reg;//寄存器写控制信号
output reg [1:0]wr_data_s;
output reg imm_s;//立即数的位扩展控制信号
output reg rt_imm_s;//R型指令、I型指令的第二位操作数控制信号（R型指令为rt，I型为imm）
output reg Mem_Write;//主存写控制信号
output reg [1:0]w_r_s;
output reg [1:0]PC_s;
always@(*)
	begin	
			Write_Reg=1;
			ALU_OP=3'b100;
			wr_data_s=0;
			imm_s=0;
			rt_imm_s=0;
			Mem_Write=0;
			w_r_s=0;
			PC_s = 0;
				if(op_code==6'b000000)//R型指令
					begin 
						case(funct)
						6'b100000:begin ALU_OP=3'b100; end
						6'b100010:begin ALU_OP=3'b101; end
						6'b100100:begin ALU_OP=3'b000;end
						6'b100101:begin ALU_OP=3'b001;end
						6'b100110:begin ALU_OP=3'b010;end
						6'b100111:begin ALU_OP=3'b011;end
						6'b101011:begin ALU_OP=3'b110;end
						6'b000100:begin ALU_OP=3'b111;end
						6'b001000:begin Write_Reg=0;Mem_Write=0;PC_s = 2'b01; end
						endcase 
					end
				else
					begin
						case(op_code)//I、J型指令
							6'b001000:begin w_r_s=2'b01;imm_s=1;rt_imm_s=1;ALU_OP=3'b100;end  
							6'b001100:begin w_r_s=2'b01;rt_imm_s=1;ALU_OP=3'b000; end  
							6'b001110:begin w_r_s=2'b01;rt_imm_s=1;ALU_OP=3'b010;end  
							6'b001011:begin w_r_s=2'b01;rt_imm_s=1;ALU_OP=3'b110; end  
							6'b100011:begin w_r_s=2'b01;imm_s=1;rt_imm_s=1;wr_data_s=2'b01;ALU_OP=3'b100; end  
							6'b101011:begin imm_s=1;rt_imm_s=1;ALU_OP=3'b100;Write_Reg=0;Mem_Write=1; end  
							6'b000100:begin ALU_OP=3'b101;PC_s = (ZF)?2'b10:2'b00; Write_Reg = 1'b0;end  
							6'b000101:begin ALU_OP=3'b101;PC_s = (ZF)?2'b00:2'b10; Write_Reg = 1'b0;end  
							6'b000010:begin Write_Reg=0;PC_s = 2'b11; end  
							6'b000011:begin w_r_s=2'b10;wr_data_s=2'b10;PC_s = 2'b11; end  
					endcase
				end
			end
endmodule

