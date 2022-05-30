`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2022 02:28:24 PM
// Design Name: 
// Module Name: sub
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


module sub(input[16:0] r, input[16:0] b, input clk, output reg [16:0] ans);
    always @(*) begin
        ans = r - b;
    end
endmodule
