`timescale 1 ns / 1 ns

module ALU_control(funct, cnrl, out);

input [5:0] funct;
input [5:0] cnrl;
output [3:0] out;
reg [3:0] out;

always @(funct, cnrl)
begin
	case(cnrl)
	3'b000:out=4'b0010;
	3'b001:out=4'b0110;
	3'b010:
		case(funct)
		6'b001001:out=4'b0010;
		6'b100000:out=4'b0010;
		6'b100001:out=4'b0010;
		6'b100010:out=4'b0110;
		6'b100011:out=4'b0110;
		6'b100100:out=4'b0000;
		6'b100101:out=4'b0001;
		6'b100110:out=4'b0011;
		6'b100111:out=4'b0100;
		6'b000000:out=4'b1000;
		6'b000100:out=4'b1001;
		6'b000010:out=4'b1010;
		6'b000110:out=4'b1011;
		6'b000011:out=4'b1100;
		6'b000111:out=4'b1101;
		6'b101001:out=4'b0101;
		6'b101010:out=4'b0111;
		default: out=4'bxxxx;
		endcase
	3'b011:out=4'b0111;
	3'b100:out=4'b0000;
	3'b101:out=4'b0001;
	3'b110:out=4'b0011;
	default: out=4'bxxxx;
	endcase
end
endmodule