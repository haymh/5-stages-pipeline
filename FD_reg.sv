`include "definitions.sv"

module FD_reg
(
	 input logic clk,
	 input logic wen_i,
	 input fd_s fd_s_i,
	 output fd_s fd_s_o
);

always_ff @(posedge clk) //enable SystemVerilog to make always_ff work!
begin
	if(wen_i)
	begin
		fd_s_o <= fd_s_i;
	end
end

endmodule
