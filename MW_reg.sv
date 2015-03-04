`include "definitions.sv"

module MW_reg
(
	 input logic clk,
	 input logic stall,
	 input mw_s mw_s_i,
	 output mw_s mw_s_o
);

always_ff @(posedge clk) //enable SystemVerilog to make always_ff work!
begin
	if(stall)
	begin
		mw_s_o <= mw_s_i;
	end
end

endmodule