library verilog;
use verilog.vl_types.all;
library work;
entity MW_reg is
    port(
        clk             : in     vl_logic;
        stall           : in     vl_logic;
        mw_s_i          : in     work.\MW_reg_sv_unit\.mw_s;
        mw_s_o          : out    work.\MW_reg_sv_unit\.mw_s
    );
end MW_reg;
