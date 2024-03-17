`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:56:49 01/10/2024 
// Design Name: 
// Module Name:    ALU 
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
module ALU(OF,ZF,ALU_OP,A,B,F);
input [2:0]ALU_OP;
input [31:0]A,B;
output reg[31:0]F;
reg C32;
output reg OF=0;
output reg ZF=0;
always @(ALU_OP or A or B)
 begin
	case(ALU_OP)
			 3'b000:F<=A&B;
			 3'b001:F<=A|B;
			 3'b010:F<=A^B;
			 3'b011:F<=A~^B;
			 3'b100:{C32,F}<=A+B;
			 3'b101:{C32,F}<=A-B;
			 3'b110:begin if(A<B)  F<=32'h0000_0001;else F<=32'h0000_0000;end
			 3'b111:begin F<=B<<A;end
	endcase
	if(F==32'h0000_0000)	
			ZF<=1;
	else
			ZF<=0;
	OF=C32^F[31]^A[31]^B[31];	
	end
endmodule

