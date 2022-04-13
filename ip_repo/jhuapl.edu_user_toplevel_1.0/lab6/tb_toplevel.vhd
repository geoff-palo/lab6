library ieee;

use ieee.std_logic_1164.all;

entity tb_toplevel is
end tb_toplevel;

architecture tb of tb_toplevel is

    component toplevel
        port (
        aclk : in STD_LOGIC;
        aresetn : in STD_LOGIC;
        
        phase_rst : in STD_LOGIC;

        phase_tdata_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
        phase_tdata_1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
        phase_tvalid_0 : in STD_LOGIC;
        phase_tvalid_1 : in STD_LOGIC;
        
        

        data_word : out std_logic_vector(31 downto 0));
    end component;

    

    signal clk_in : std_logic;
    signal phase_rst : std_logic;
    signal phase_tdata_0 : std_logic_vector(31 downto 0);
    signal phase_tdata_1 : std_logic_vector(31 downto 0);
    signal data_word : std_logic_vector(31 downto 0);
    constant TbPeriod : time := 8 ns;
    signal TbClock : std_logic := '0';
    

begin

    dut : toplevel
        port map (aclk => clk_in,
        aresetn => '1',
        
        phase_rst => phase_rst,

        phase_tdata_0 => phase_tdata_0,
        phase_tdata_1 => phase_tdata_1,
        phase_tvalid_0 => '1',
        phase_tvalid_1 => '1',

        data_word => data_word);
       

    TbClock <= not TbClock after TbPeriod/2;

    clk_in <= TbClock;
    
    phase_rst <= '0';
    phase_tdata_0 <= "00000001111010111000100101010000";
    phase_tdata_1 <= "00000001111010111000010100011111";
--    stimuli : process
--    begin
--        reset_pb <= '0';
--        wait for 232 ns;
--        reset_pb <= '1';
--        wait;
--    end process;

end tb;