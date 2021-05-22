`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2015 05:55:40 PM
// Design Name: 
// Module Name: control
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

//operations 
//0: add
//1: compare
//2: load 
//3: print 
//4: load immediate 
//5: branch_not_equal 

module control(
    input [31:0] instr, 
    output reg reg_write, 
    output reg alu_mux_ctrl, 
    //output mem_read, 
    //output mem_write, 
    output reg branch_mux, 
    output reg alu_op,
//    output reg [3:0] rs, 
//    output reg [3:0] rt, 
//    output reg [3:0] rd,
    output reg [15:0] data,  
    output reg print_signal
    );
    
    wire [3:0] op; 
    assign op = instr [31-:4]; 
    always @ (*) 
        case (op) 
            4'd0: begin 
                alu_op <= 0; 
                alu_mux_ctrl <= 1; //indicates the value to ALU should come from the register 
                reg_write <= 1;
                branch_mux <= 0; 
                print_signal <= 0; 
            end 
            4'd1: begin 
                alu_op <= 1; 
                alu_mux_ctrl <= 1; //indicates the value to ALU should come from the register
                reg_write <= 1; 
                branch_mux <= 0; 
                print_signal <= 0;
            end 
            4'd2: begin 
                alu_op <= 0;
                alu_mux_ctrl <= 0; //indicates the value to ALU should come from imm_data        
                reg_write <= 1; 
                branch_mux <= 0; 
                print_signal <= 0;
            end 
            4'd3: begin 
                alu_op <= 0; 
//                rs <= (instr & 32'h00F00000) >> 20; 
                print_signal <= 1; 
                branch_mux <= 0; 
            end
            4'd4: begin 
                alu_op <= 0; 
                alu_mux_ctrl <= 0; //indicates the value to the ALU should come from imm_data
                reg_write <= 1; 
                data <= instr [15:0]; 
                branch_mux <= 0; 
                print_signal <= 0;
            end 
            4'd5: begin 
                reg_write <= 0; 
                alu_op <= 1; //diff
                alu_mux_ctrl <= 1; 
                data <= instr [15:0];
                branch_mux <= 1; 
                print_signal <= 0;
            end  
        endcase     
endmodule
