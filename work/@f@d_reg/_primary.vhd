library verilog;
use verilog.vl_types.all;
library work;
entity FD_reg is
    port(
        clk             : in     vl_logic;
        stall           : in     vl_logic;
        flush           : in     vl_logic;
        bubble          : in     vl_logic;
        fd_s_i          : in     work.\FD_reg_sv_unit\.fd_s;
        fd_s_o          : out    work.\FD_reg_sv_unit\.fd_s
    );
end FD_reg;
