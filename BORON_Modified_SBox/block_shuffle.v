
module block_shuffle (so, bso);
input [15:0] so;
output [15:0] bso;

assign bso[3:0] = so[11:8];
assign bso[7:4] = so[15:12];
assign bso[11:8] = so[3:0];
assign bso[15:12] = so[7:4];

endmodule
