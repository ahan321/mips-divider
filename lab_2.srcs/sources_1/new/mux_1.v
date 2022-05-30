`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2022 02:28:24 PM
// Design Name: 
// Module Name: mux_1
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


module mux_1(input [16:0] sub, input [16:0] saved, output reg [16:0] result);
    always @(*) begin
        if (sub < 0) begin
            result = saved;
        end
        else begin
            result = sub;
        end
    end
endmodule
