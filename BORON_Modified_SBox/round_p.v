module round_p (bso, rpo);
input [63:0] bso;
output [63:0] rpo;
wire [15:0] a,b,c,d;

assign d ={bso[54:48],bso[63:55]};
assign c ={bso[40:32],bso[47:41]};
assign b ={bso[27:16],bso[31:28]};
assign a ={bso[14:0],bso[15]};

assign rpo = {d, c, b, a};

endmodule