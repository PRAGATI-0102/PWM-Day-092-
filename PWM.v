`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2023 11:24:22 PM
// Design Name: 
// Module Name: PWM
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


module PWM(
    input clk, rst, 
    output reg dout
    );
 
    parameter period = 10;
    integer count;
    integer ton;
    reg nc;
     
    always@(posedge clk)
    begin
         if(rst == 1'b1)
            begin
             count <= 0;
             ton   <= 0;
             nc  <= 1'b0;
            end   
         else 
           begin
                if(count <= ton) 
                  begin
                      count <= count + 1;
                      dout  <= 1'b1;
                      nc  <= 1'b0;
                  end
                else if (count < period)
                  begin
                      count <= count + 1;
                      dout <= 1'b0;
                      nc <= 1'b0;
                  end
                else
                   begin
                       nc  <= 1'b1;
                       count <= 0;
                   end
           end
    end
     
    always@(posedge clk)
    begin
         if(rst == 1'b0) 
         begin 
             if(nc == 1'b1)
                begin
                    if(ton < period)
                       ton <= ton + 1;
                    else
                       ton <= 0;
                end
         end   
    end
    
endmodule
