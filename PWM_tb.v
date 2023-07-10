`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2023 11:28:58 PM
// Design Name: 
// Module Name: PWM_tb
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


module PWM_tb();

    reg clk, rst;
    wire dout;
    
        PWM dut(
        .clk(clk),
        .rst(rst),
        .dout(dout)
    );
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        rst = 1'b1; // Apply reset
        #20;
        rst = 1'b0; // Release reset
        #1000;
        $finish;
    end
   
    always @(posedge clk) begin
        $display("dout: %b", dout);
    end

endmodule
