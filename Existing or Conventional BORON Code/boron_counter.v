module counter (clk,reset,count);
  input clk;
  input reset;
  output reg [4:0]count;
  
  always @(posedge clk)
    begin
      if(reset)
        count<=5'b00000;
      else
        count<=count+5'b00001;
    end
endmodule

