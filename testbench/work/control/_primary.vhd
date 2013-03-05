library verilog;
use verilog.vl_types.all;
entity control is
    port(
        format          : in     vl_logic;
        opcode          : in     vl_logic_vector(3 downto 0);
        sign            : in     vl_logic;
        cpin            : out    vl_logic;
        cpout           : out    vl_logic;
        memRead         : out    vl_logic;
        memWrite        : out    vl_logic;
        writeSrc        : out    vl_logic_vector(1 downto 0);
        halt            : out    vl_logic;
        branch          : out    vl_logic;
        jump            : out    vl_logic
    );
end control;
