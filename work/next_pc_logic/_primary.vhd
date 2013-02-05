library verilog;
use verilog.vl_types.all;
entity next_pc_logic is
    port(
        restart         : in     vl_logic;
        pc_in           : in     vl_logic_vector(15 downto 0);
        clock           : in     vl_logic;
        next_pc         : out    vl_logic_vector(15 downto 0)
    );
end next_pc_logic;
