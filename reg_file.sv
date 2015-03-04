module reg_file#(parameter NUM_REG = 6, BITS = 32)
(
	 input clk,
	 input wen_i,
	 input [NUM_REG - 1 : 0] wa_i,
	 input [BITS - 1 : 0] wd_i,
	 input [NUM_REG - 1 : 0] ra0_i,
	 input [NUM_REG - 1 : 0] ra1_i,
	 output [BITS - 1 : 0] rd0_o,
	 output [BITS - 1 : 0] rd1_o
);

 logic [BITS - 1 : 0] rf [2**NUM_REG - 1 : 0];
 assign rd0_o = rf[ra0_i];
 assign rd1_o = rf[ra1_i];

always_ff @(posedge clk) //enable SystemVerilog to make always_ff work!
begin
	if(wen_i)
	begin
		rf[wa_i] <= wd_i;
	end
end

endmodule
