library verilog;
use verilog.vl_types.all;
library work;
entity DX_reg is
    port(
        clk             : in     vl_logic;
        stall           : in     vl_logic;
        flush           : in     vl_logic;
        bubble          : in     vl_logic;
        dx_s_i          : in     work.\DX_reg_sv_unit\.dx_s;
        dx_s_o          : out    work.\DX_reg_sv_unit\.dx_s
    );
end DX_reg;
