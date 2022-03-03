/* A 32bit ALU.
 *
 * Author: Bradley Gathers
 * Date: 3/3/2022
*/
module alu32(a,b,opCode,out,S);

	// I/O and Parameters
	parameter N = 32;

	input [N-1:0] a,b;                
	input [4:0] opCode;
	output [N-1:0] out; 
	output [3:0] S;
	 
	reg [N-1:0] ALU_Result;
	wire [N-2:0] tmpA = a[N-2:0];
	wire [N-2:0] tmpB = b[N-2:0];
	
	//Statuses
	wire co, neg, over, zero;
	
	// Assign Statements for Statuses
	assign neg = a[N-1] ^ b[N-1]; // Negative
	assign co = ALU_Result[N-1];  // Carryout
	assign over = ((a[N-1] & b[N-1]) | (~a[N-1] & ~b[N-1])); // Overflow
	assign zero = (ALU_Result[N-2:0] == 0) ? 1'b1 : 1'b0; // Zero
	assign S = {co, neg, over, zero};
	
	// Output Assignment
	assign out = {neg, ALU_Result[N-2:0]}; // ALU out
	
	always @(*) begin
		case(opCode)
			4'b0000: ALU_Result = tmpA + tmpB;    // Addition
			4'b0001: ALU_Result = tmpA - tmpB;    // Subtraction
			4'b0010: ALU_Result = tmpA ^ tmpB;    // Logical xor 
			4'b0011: ALU_Result = tmpA & tmpB;    // Logical and 
			4'b0100: ALU_Result = tmpA | tmpB;    // Logical or
			4'b0101: ALU_Result = ~(tmpA | tmpB); // Logical nor
			4'b0110: ALU_Result = tmpA<<tmpB;     // Logical shift left
			4'b0111: ALU_Result = tmpA>>tmpB;     // Logical shift right
			default: ALU_Result = tmpA + tmpB;    // Default is add 
		endcase
	end
endmodule