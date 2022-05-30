`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2022 05:27:44 PM
// Design Name: 
// Module Name: testbench
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


module testbench();
    reg clear;
    reg start;
    reg clk;
    reg [31:0] a;
    reg [15:0] b;
    wire [31:0] q;
    wire [15:0] r;
    //reg [31:00] regQ;
    //reg [15:00] regR;
    wire busy;
    wire ready;
    wire [4:0] counter;
    initial begin
        clear <= 0;
        start <= 0;
        clk <= 1;
        a <= 32'h4c7f228a;
        b <= 16'h6a0e;
        #5
        start <= 1;
        clear <= 1;
        #10
        start <= 0;
     end
     Divider Divider(clk, clear, start, a, b, q, regQ, regR, busy, ready, counter);
     always begin
        #5;
        clk = ~clk;
     end 
endmodule
