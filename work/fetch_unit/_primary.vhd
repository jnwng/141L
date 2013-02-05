library verilog;
use verilog.vl_types.all;
entity fetch_unit is
    port(
        branch          : in     vl_logic;
        restart         : in     vl_logic;
        clock           : in     vl_logic
    );
end fetch_unit;
