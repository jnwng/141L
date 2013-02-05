library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        clock           : in     vl_logic;
        input_a         : in     vl_logic_vector(15 downto 0);
        input_b         : in     vl_logic_vector(15 downto 0);
        \out\           : out    vl_logic_vector(15 downto 0);
        op              : in     vl_logic_vector(3 downto 0)
    );
end ALU;
