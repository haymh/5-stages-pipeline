library verilog;
use verilog.vl_types.all;
entity reg_file is
    generic(
        NUM_REG         : integer := 6;
        BITS            : integer := 32
    );
    port(
        clk             : in     vl_logic;
        wen_i           : in     vl_logic;
        wa_i            : in     vl_logic_vector;
        wd_i            : in     vl_logic_vector;
        ra0_i           : in     vl_logic_vector;
        ra1_i           : in     vl_logic_vector;
        rd0_o           : out    vl_logic_vector;
        rd1_o           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of NUM_REG : constant is 1;
    attribute mti_svvh_generic_type of BITS : constant is 1;
end reg_file;
