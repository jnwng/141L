library verilog;
use verilog.vl_types.all;
entity data_ram is
    port(
        clk             : in     vl_logic;
        DataAddress     : in     vl_logic_vector(15 downto 0);
        ReadMem         : in     vl_logic;
        WriteMem        : in     vl_logic;
        DataIn          : in     vl_logic_vector(15 downto 0);
        DataOut         : out    vl_logic_vector(15 downto 0)
    );
end data_ram;
