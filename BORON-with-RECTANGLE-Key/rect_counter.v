module rect_counter (clk, reset, count, rc4, rc3, rc2, rc1, rc0);
  input clk;
  input reset;
  output reg [4:0]count;
  output reg rc4, rc3, rc2, rc1, rc0;
  
  always @(posedge clk)
  begin
    if (reset)
	begin
		count<=5'b00000;
		rc4<=1'b0;
		rc3<=1'b0;
		rc2<=1'b0;
		rc1<=1'b0;
		rc0<=1'b1;
	end
	else
	begin
		rc4<=rc3;
		rc3<=rc2;
		rc2<=rc1;
		rc1<=rc0;
		rc0<=rc4^rc2;
		count <= count + 1'b1;
	end
  end
 
endmodule


