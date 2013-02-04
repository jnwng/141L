library verilog;
use verilog.vl_types.all;
entity register_file is
    port(
        clk             : in     vl_logic;
        copyout         : in     vl_logic;
        reg_sel         : in     vl_logic_vector(2 downto 0);
        res_val         : out    vl_logic_vector(15 downto 0);
        reg_val         : out    vl_logic_vector(15 downto 0);
        write_data      : in     vl_logic_vector(15 downto 0)
    );
end register_file;
