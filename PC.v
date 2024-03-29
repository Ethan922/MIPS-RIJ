`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:51:51 01/10/2024 
// Design Name: 
// Module Name:    PC 
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
module PC(clk,rst,Inst_code,PC_s,R_Data_A,address,PC,imm_data,PC_new);
input clk,rst;
input [1:0]PC_s;//PC四种来源的控制信号
input [31:0]R_Data_A;
input [25:0]address;
input [31:0]imm_data;
output reg[31:0]PC;
output [31:0]PC_new;
initial
	PC = 32'h0000_0000;
output [31:0]Inst_code;
assign PC_new = PC +4;
ROM rom(
  .clka(clk), // input clka
  .addra(PC[7:2]), // input [5 : 0] addra
  .douta(Inst_code) // output [31 : 0] douta
);
always@(negedge clk or posedge rst)
	begin
		if(rst)
			begin PC <= 32'h0000_0000; end
		else
		begin
			case (PC_s)   
				2'b00:	PC <= PC_new;//PC自增
				2'b01:	PC  <= R_Data_A;//R型跳转指令	
				2'b10:   PC <= PC_new + (imm_data<<2);	//I型跳转指令
				2'b11:	PC  <= {PC_new[31:28],address,2'b00};//J型跳转指令（页面寻址）
			endcase
		end
	end
endmodule


