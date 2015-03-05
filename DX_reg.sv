`include "definitions.sv"

module DX_reg
(
	 input logic clk,
	 input logic stall,
	 input logic flush,
	 input logic bubble,
	 input dx_s dx_s_i,
	 output dx_s dx_s_o
);

always_ff @(posedge clk) //enable SystemVerilog to make always_ff work!
begin
	if(flush | bubble)
	begin
		dx_s_o.instruction_dx <= `kNOP;
		dx_s_o.PC_r_dx <= dx_s_o.PC_r_dx;
		dx_s_o.rs_val_dx <= 32'b0;
		dx_s_o.rd_val_dx <= 32'b0;
		dx_s_o.is_load_op_c_dx <= 1'b0;
		dx_s_o.op_writes_rf_c_dx <= 1'b0;
		dx_s_o.is_store_op_c_dx <= 1'b0;
		dx_s_o.is_mem_op_c_dx <= 1'b0;
		dx_s_o.is_byte_op_c_dx <= 1'b0;
	end
	else if(stall)
	begin
		dx_s_o <= dx_s_o;
	end
	else
		dx_s_o <= dx_s_i;
end

endmodule
