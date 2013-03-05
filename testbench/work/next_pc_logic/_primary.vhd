library verilog;
use verilog.vl_types.all;
entity next_pc_logic is
    port(
        init            : in     vl_logic;
        restart         : in     vl_logic;
        clock           : in     vl_logic;
        pc_in           : in     vl_logic_vector(15 downto 0);
        \out\           : out    vl_logic_vector(15 downto 0)
    );
end next_pc_logic;
