library verilog;
use verilog.vl_types.all;
entity mux_0 is
    port(
        sel             : in     vl_logic;
        in0             : in     vl_logic_vector(15 downto 0);
        in1             : in     vl_logic_vector(15 downto 0);
        \out\           : out    vl_logic_vector(15 downto 0)
    );
end mux_0;
