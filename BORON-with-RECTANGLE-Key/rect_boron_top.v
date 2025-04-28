module boron_top (clk, plain_txt, key_in, cipher_txt, select, count1, reset);
input [63:0] plain_txt;
input [127:0] key_in;
input clk, select, reset;
output reg [63:0] cipher_txt;
wire [127:0] final_key,mux_out_key;
wire [63:0] so, xor_op, rpo, bso; 
wire [63:0] si;
wire [63:0] Ki;
wire [4:0] count;
output [4:0] count1;
reg [63:0]mux_out;
wire rc4, rc3, rc2, rc1, rc0;
assign count1 = count;


always @(posedge clk)
begin
mux_out = select ? plain_txt : xor_op;

if (count==5'b11000)
begin	
	cipher_txt = final_key[63:0] ^ xor_op;
end
else
begin
	cipher_txt = xor_op;
end
end
assign si = mux_out ^ Ki;

rect_counter c2 (clk, reset, count, rc4, rc3, rc2, rc1, rc0);
key_rect k1 (key_in, final_key, mux_out_key, count, clk, select, Ki);

boronSbox s1 (si[3], si[2], si[1], si[0], so[3], so[2], so[1], so[0]);
boronSbox s2 (si[7], si[6], si[5], si[4], so[7], so[6], so[5], so[4]);
boronSbox s3 (si[11], si[10], si[9], si[8], so[11], so[10], so[9], so[8]);
boronSbox s4 (si[15], si[14], si[13], si[12], so[15], so[14], so[13], so[12]);
boronSbox s5 (si[19], si[18], si[17], si[16], so[19], so[18], so[17], so[16]);
boronSbox s6 (si[23], si[22], si[21], si[20], so[23], so[22], so[21], so[20]);
boronSbox s7 (si[27], si[26], si[25], si[24], so[27], so[26], so[25], so[24]);
boronSbox s8 (si[31], si[30], si[29], si[28], so[31], so[30], so[29], so[28]);
boronSbox s9 (si[35], si[34], si[33], si[32], so[35], so[34], so[33], so[32]);
boronSbox s10 (si[39], si[38], si[37], si[36], so[39], so[38], so[37], so[36]);
boronSbox s11 (si[43], si[42], si[41], si[40], so[43], so[42], so[41], so[40]);
boronSbox s12 (si[47], si[46], si[45], si[44], so[47], so[46], so[45], so[44]);
boronSbox s13 (si[51], si[50], si[49], si[48], so[51], so[50], so[49], so[48]);
boronSbox s14 (si[55], si[54], si[53], si[52], so[55], so[54], so[53], so[52]);
boronSbox s15 (si[59], si[58], si[57], si[56], so[59], so[58], so[57], so[56]);
boronSbox s16 (si[63], si[62], si[61], si[60], so[63], so[62], so[61], so[60]);

/////////////Block Shuffle////////////////

block_shuffle b1 (so[15:0], bso[15:0]);
block_shuffle b2 (so[31:16], bso[31:16]);
block_shuffle b3 (so[47:32], bso[47:32]);
block_shuffle b4 (so[63:48], bso[63:48]);

///////////////Round permutation////////////

round_p r1 (bso, rpo);  ///////round permutation////////////
boron_xor r2 (rpo, xor_op);  //////xor operation////////

//assign cipher_txt = mux_out_key ^ xor_op;


endmodule
