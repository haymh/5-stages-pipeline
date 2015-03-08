library verilog;
use verilog.vl_types.all;
library work;
entity hazard_detection is
    port(
        is_load_op_o    : in     vl_logic;
        is_store_op_o   : in     vl_logic;
        fd_s_o          : in     work.hazard_detection_sv_unit.fd_s;
        dx_s_o          : in     work.hazard_detection_sv_unit.dx_s;
        xm_s_o          : in     work.hazard_detection_sv_unit.xm_s;
        mw_s_o          : in     work.hazard_detection_sv_unit.mw_s;
        bubble          : out    vl_logic;
        fwd_a           : out    vl_logic_vector(1 downto 0);
        fwd_b           : out    vl_logic_vector(1 downto 0);
        fwd_c           : out    vl_logic_vector(1 downto 0)
    );
end hazard_detection;
