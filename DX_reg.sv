`include "definitions.sv"

module DX_reg
(
	 input logic clk,
	 input logic wen_i,
	 input dx_s dx_s_i,
	 output dx_s dx_s_o
);

always_ff @(posedge clk) //enable SystemVerilog to make always_ff work!
begin
	if(wen_i)
	begin
		dx_s_o <= dx_s_o;
	end
end

endmodule
