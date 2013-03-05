library verilog;
use verilog.vl_types.all;
entity cycle_counter is
    port(
        start           : in     vl_logic;
        clk             : in     vl_logic
    );
end cycle_counter;
