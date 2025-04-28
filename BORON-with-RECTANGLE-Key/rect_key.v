module key_rect (key_in, final_key, mux_out_key, count, clk, select, Ki);
  input [127:0]key_in;
  input clk,select;
  input [4:0]count;
  output reg [127:0] mux_out_key;
  output [63:0] Ki;
  output [127:0]final_key;
  
  wire [127:0]new_key;
  wire [31:0] array [3:0];
  wire [31:0] shift_array [3:0];
  wire [31:0] sbox_array [3:0];
  wire [31:0] after_xor_new;
  wire [127:0] shift_key1, shift_key2;
  wire [4:0] after_xor;
  
  always @ (posedge clk)
  begin
  mux_out_key = select ? key_in : final_key;
  end
  
  assign array [0] = mux_out_key[127:96];
  assign array [1] = mux_out_key[95:64];
  assign array [2] = mux_out_key[63:32];
  assign array [3] = mux_out_key[31:0];
  assign Ki = {mux_out_key[111:96], mux_out_key[79:64], mux_out_key[47:32], mux_out_key[15:0]};

  boronSbox sbox0 (mux_out_key[0], mux_out_key[32], mux_out_key[64], mux_out_key[96], new_key[0], new_key[32], new_key[64], new_key[96]);
  boronSbox sbox1 (mux_out_key[1], mux_out_key[33], mux_out_key[65], mux_out_key[97], new_key[1], new_key[33], new_key[65], new_key[97]);
  boronSbox sbox2 (mux_out_key[2], mux_out_key[34], mux_out_key[66], mux_out_key[98], new_key[2], new_key[34], new_key[66], new_key[98]);
  boronSbox sbox3 (mux_out_key[3], mux_out_key[35], mux_out_key[67], mux_out_key[99], new_key[3], new_key[35], new_key[67], new_key[99]);
  boronSbox sbox4 (mux_out_key[4], mux_out_key[36], mux_out_key[68], mux_out_key[100], new_key[4], new_key[36], new_key[68], new_key[100]);
  boronSbox sbox5 (mux_out_key[5], mux_out_key[37], mux_out_key[69], mux_out_key[101], new_key[5], new_key[37], new_key[69], new_key[101]);
  boronSbox sbox6 (mux_out_key[6], mux_out_key[38], mux_out_key[70], mux_out_key[102], new_key[6], new_key[38], new_key[70], new_key[102]);
  boronSbox sbox7 (mux_out_key[7], mux_out_key[39], mux_out_key[71], mux_out_key[103], new_key[7], new_key[39], new_key[71], new_key[103]);

  assign sbox_array [0] = {mux_out_key[127:104], new_key[103:96]};
  assign sbox_array [1] = {mux_out_key[95:72], new_key[71:64]};
  assign sbox_array [2] = {mux_out_key[63:40], new_key[39:32]};
  assign sbox_array [3] = {mux_out_key[31:8], new_key[7:0]};
  
  assign shift_key1 = {sbox_array[0][23:0], sbox_array[0][31:24]};
  assign shift_key2 = {sbox_array[2][15:0], sbox_array[2][31:16]};
  
  assign shift_array [0] = shift_key1 ^ sbox_array [1];
  assign shift_array [1] = sbox_array [2];
  assign shift_array [2] = shift_key2 ^ sbox_array [3];
  assign shift_array [3] = sbox_array [0];

  assign after_xor = shift_array [0][4:0] ^ count;
  assign after_xor_new = {shift_array [0][31:5], after_xor};
  assign final_key = {after_xor_new, shift_array[1], shift_array[2], shift_array[3]};
  
endmodule

