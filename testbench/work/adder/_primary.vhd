library verilog;
use verilog.vl_types.all;
entity adder is
    port(
        clock           : in     vl_logic;
        a               : in     vl_logic_vector(15 downto 0);
        \out\           : out    vl_logic_vector(15 downto 0)
    );
end adder;
