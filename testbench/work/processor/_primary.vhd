library verilog;
use verilog.vl_types.all;
entity processor is
    port(
        restart         : in     vl_logic;
        init            : in     vl_logic;
        clock           : in     vl_logic;
        done            : out    vl_logic
    );
end processor;
