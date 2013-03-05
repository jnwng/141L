library verilog;
use verilog.vl_types.all;
entity instr_rom_1 is
    port(
        pc_in           : in     vl_logic_vector(15 downto 0);
        format          : out    vl_logic;
        opcode          : out    vl_logic_vector(3 downto 0);
        sign            : out    vl_logic;
        operand         : out    vl_logic_vector(2 downto 0);
        immediate       : out    vl_logic_vector(7 downto 0)
    );
end instr_rom_1;
