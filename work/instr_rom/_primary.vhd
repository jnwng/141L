library verilog;
use verilog.vl_types.all;
entity instr_rom is
    port(
        pc_in           : in     vl_logic_vector(15 downto 0);
        instr_out       : out    vl_logic_vector(15 downto 0)
    );
end instr_rom;
