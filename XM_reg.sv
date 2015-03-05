`include "definitions.sv"

module XM_reg
(
	 input logic clk,
	 input logic stall,
	 input xm_s xm_s_i,
	 output xm_s xm_s_o
);

always_ff @(posedge clk) //enable SystemVerilog to make always_ff work!
begin
	if(stall)
		xm_s_o <= xm_s_o;
	else
		xm_s_o <= xm_s_i;
end

endmodule