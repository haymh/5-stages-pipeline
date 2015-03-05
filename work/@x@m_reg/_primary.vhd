library verilog;
use verilog.vl_types.all;
library work;
entity XM_reg is
    port(
        clk             : in     vl_logic;
        stall           : in     vl_logic;
        xm_s_i          : in     work.\XM_reg_sv_unit\.xm_s;
        xm_s_o          : out    work.\XM_reg_sv_unit\.xm_s
    );
end XM_reg;
