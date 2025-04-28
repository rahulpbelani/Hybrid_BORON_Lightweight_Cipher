module boron_top_tb ();
reg [63:0] plain_txt; 
reg [127:0] key_in;
reg clk, select, reset;
wire [63:0] cipher_txt;
wire [4:0] count;

boron_top dut (clk, plain_txt, key_in, cipher_txt, select, count, reset);

initial
begin

clk=1;
select = 1;
plain_txt = 64'b0;
key_in = 128'b0;
reset = 1;
#10;
select = 0;
reset = 0;
#510;
$stop;
end

always #10 clk = ~clk;

endmodule