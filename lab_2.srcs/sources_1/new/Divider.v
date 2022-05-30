`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2022 09:33:12 PM
// Design Name: 
// Module Name: Divider
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


module Divider(
    input clk, 
    input clear,
    input start,
    input [31:0] a,
    input [15:0] b,
    input [15:0] q,
    
    output reg [31:0] regQ,
    output reg [15:0] regR,
    output reg busy,
    output reg ready,
    output reg [4:0] counter
    );
    reg [15:0] regB;
    
    wire [16:0] subtractorA = {regR, regQ[31]};
    wire [16:0] subtractorB = {1'b0, regB};
    wire [16:0] subOut;
    sub sub(subtractorA, subtractorB, subOut);
    
    wire [15:0] new_r = {regR, regQ[31]};
    wire [15:0] mux1Out;
    mux_1 mux_1(subOut,new_r,mux1Out);
    
    wire [15:0] new_q = {q, subOut[16]};
    wire [15:0] mux2Out;
    mux_2 mux_2(new_q, mux2Out);
    
    always @(posedge clk)
    begin
        if (clear == 0)
        begin
            regB <= 0;
            regQ <= 0;
            regR <= 0;
            ready <= 0;
            busy <= 0;
            counter <= 0;
        end
        if (start == 1)
        begin
            regB <= b;
            regQ <= a;
            regR <= 0;
            ready <= 0;
            busy <= 1;
            counter <= 0;
        end
        if (busy == 1)
        begin
            counter <= counter + 1;
            regB <= b;
            regQ <= mux2Out;
            regR <= mux1Out;
            if (counter == 31)
            begin
                busy <= 0;
                ready <= 1;  
            end       
        end
    end
endmodule
