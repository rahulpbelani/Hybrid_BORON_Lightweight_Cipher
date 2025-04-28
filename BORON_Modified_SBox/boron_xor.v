module boron_xor (rpo, xor_op);
input [63:0] rpo;
output [63:0] xor_op;

assign xor_op[63:48] = rpo[63:48] ^ rpo[47:32] ^ rpo[15:0];
assign xor_op[47:32] = rpo[47:32] ^ rpo[15:0];
assign xor_op[31:16] = rpo[63:48] ^ rpo[31:16];
assign xor_op[15:0] = rpo[63:48] ^ rpo[31:16] ^ rpo[15:0];

endmodule