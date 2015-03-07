`include "definitions.sv"

module hazard_detection
(
	 input logic is_load_op_o,
	 input logic is_store_op_o,
	 input fd_s fd_s_o,
	 input dx_s dx_s_o,
	 input xm_s xm_s_o,
	 input mw_s mw_s_o,
	 output logic bubble,
	 output logic [1:0] fwd_a,
	 output logic [1:0] fwd_b
);

always_comb
begin
	if(xm_s_o.op_writes_rf_c_xm && xm_s_o.instruction_xm.rd &&
		(xm_s_o.instruction_xm.rd == dx_s_o.instruction_dx.rs_imm))
		fwd_a = 2'b10;
	else if(mw_s_o.op_writes_rf_c_mw && mw_s_o.instruction_mw.rd &&
			~(mw_s_o.op_writes_rf_c_mw && xm_s_o.instruction_xm.rd &&
			 (xm_s_o.instruction_xm.rd === dx_s_o.instruction_dx.rs_imm)) &&
			 (mw_s_o.instruction_mw.rd === dx_s_o.instruction_dx.rs_imm))
		fwd_a = 2'b01;
	else
		fwd_a = 2'b00;
end

always_comb
begin
	if(xm_s_o.op_writes_rf_c_xm && xm_s_o.instruction_xm.rd &&
		(xm_s_o.instruction_xm.rd === dx_s_o.instruction_dx.rd))
		fwd_b = 2'b10;
	else if(mw_s_o.op_writes_rf_c_mw && mw_s_o.instruction_mw.rd &&
			~(mw_s_o.op_writes_rf_c_mw && xm_s_o.instruction_xm.rd &&
			 (xm_s_o.instruction_xm.rd === dx_s_o.instruction_dx.rd)) &&
			 (mw_s_o.instruction_mw.rd === dx_s_o.instruction_dx.rd))
		fwd_b = 2'b01;
	else
		fwd_b = 2'b00;
end

/*
assign bubble = (dx_s_o.is_load_op_c_dx || dx_s_o.is_store_op_c_dx) &&
				((dx_s_o.instruction_dx.rd == fd_s_o.instruction_fd.rs_imm) ||
				(dx_s_o.instruction_dx.rd == fd_s_o.instruction_fd.rd) ||
				 is_load_op_o || is_store_op_o);
*/
assign bubble = (xm_s_o.is_load_op_c_xm || xm_s_o.is_store_op_c_xm) &&
				((xm_s_o.instruction_xm.rd == dx_s_o.instruction_dx.rs_imm) ||
				(xm_s_o.instruction_xm.rd == dx_s_o.instruction_dx.rd));
endmodule