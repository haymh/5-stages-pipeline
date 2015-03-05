`include "definitions.sv"

module FD_reg
(
	 input logic clk,
	 input logic stall,
	 input logic flush,
	 input fd_s fd_s_i,
	 output fd_s fd_s_o
);

always_ff @(posedge clk) //enable SystemVerilog to make always_ff work!
begin
	if(flush)
	begin
		fd_s_o.instruction_fd <= `kNOP;
		fd_s_o.PC_r_fd <= fd_s_o.PC_r_fd;
	end
	else if(stall)
		fd_s_o <= fd_s_o;
	else
		fd_s_o <= fd_s_i;
end

endmodule
