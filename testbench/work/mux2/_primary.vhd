library verilog;
use verilog.vl_types.all;
entity mux2 is
    port(
        sel             : in     vl_logic;
        in1             : in     vl_logic_vector(15 downto 0);
        in0             : in     vl_logic_vector(15 downto 0);
        \out\           : out    vl_logic_vector(15 downto 0)
    );
end mux2;
