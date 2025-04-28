module key_present (key_in,final_key,mux_out_key,count,clk, select,RKi);
  input [127:0]key_in;
  input clk,select;
  input [4:0]count;
  output [127:0]final_key;
  wire [3:0]key1,key2;
  wire [4:0]key3;
  wire [127:0]shifted_key;
  wire [3:0]new_key1;
  wire [3:0]new_key2;
  wire [4:0]new_key3;
  output reg [127:0] mux_out_key;
  output [63:0] RKi;
  
  
  
  always @ (posedge clk)
  begin
  mux_out_key = select? key_in : final_key;

  end
  
  assign shifted_key = {mux_out_key[66:0],mux_out_key[127:67]};
  assign key1 = shifted_key[127:124];
  assign key2 = shifted_key[123:120];
  assign key3 = shifted_key[66:62];
  assign RKi = mux_out_key[63:0];
  
  boronSbox sbox1 (key1[3], key1[2], key1[1], key1[0], new_key1[3], new_key1[2], new_key1[1], new_key1[0]);
  boronSbox sbox2 (key2[3], key2[2], key2[1], key2[0], new_key2[3], new_key2[2], new_key2[1], new_key2[0]);
  
  assign new_key3 = key3^count;
  assign final_key={new_key1,new_key2,shifted_key[119:67],new_key3,shifted_key[61:0]};

endmodule
