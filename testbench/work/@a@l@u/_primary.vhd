library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        clock           : in     vl_logic;
        res             : in     vl_logic_vector(15 downto 0);
        \register\      : in     vl_logic_vector(15 downto 0);
        ltgt            : in     vl_logic_vector(2 downto 0);
        eq              : in     vl_logic;
        compres         : out    vl_logic;
        \out\           : out    vl_logic_vector(15 downto 0);
        op              : in     vl_logic_vector(3 downto 0);
        format          : in     vl_logic
    );
end ALU;
