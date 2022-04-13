----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2022 08:53:12 PM
-- Design Name: 
-- Module Name: toplevel - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity toplevel is
    port(

        aclk : in STD_LOGIC;
        aresetn : in STD_LOGIC;
        
        phase_rst : in STD_LOGIC;

        phase_tdata_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
        phase_tdata_1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
        phase_tvalid_0 : in STD_LOGIC;
        phase_tvalid_1 : in STD_LOGIC;

        data_word : out std_logic_vector(31 downto 0)
    );
end toplevel;

architecture Behavioral of toplevel is

    


--    component dds_blocks is
--        port (
--            aclk : in STD_LOGIC;
--            phase_rst : in STD_LOGIC;
--            dds_0_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
--            dds_0_tvalid : out STD_LOGIC;
--            dds_1_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
--            dds_1_tvalid : out STD_LOGIC;
--            phase_tdata_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
--            phase_tdata_1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
--            phase_tvalid_0 : in STD_LOGIC;
--            phase_tvalid_1 : in STD_LOGIC
--        );
--    end component dds_blocks;


COMPONENT fir_compiler_0
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_data_tvalid : IN STD_LOGIC;
    s_axis_data_tready : OUT STD_LOGIC;
    s_axis_data_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;

    COMPONENT fir_compiler_1
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_data_tvalid : IN STD_LOGIC;
    s_axis_data_tready : OUT STD_LOGIC;
    s_axis_data_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;

  component design_1_dds_compiler_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_phase_tvalid : in STD_LOGIC;
    s_axis_phase_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_data_tvalid : out STD_LOGIC;
    m_axis_data_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component design_1_dds_compiler_0_0;
  component design_1_dds_compiler_0_1 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_phase_tvalid : in STD_LOGIC;
    s_axis_phase_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_data_tvalid : out STD_LOGIC;
    m_axis_data_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_dds_compiler_0_1;

    signal phase_rst_sig : std_logic;

    signal dds_0_tdata : STD_LOGIC_VECTOR ( 15 downto 0 );
    signal dds_0_tvalid : STD_LOGIC;
    signal dds_1_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal dds_1_tvalid : STD_LOGIC;
    signal fir1_real_data_tready : STD_LOGIC;
    signal fir2_real_data_tready : STD_LOGIC;
    signal fir1_real_data_tvalid : std_logic;
    signal fir2_real_data_tvalid : std_logic;
    signal fir1_real_data_tdata : STD_LOGIC_VECTOR(31 downto 0);
    signal fir2_real_data_tdata : STD_LOGIC_VECTOR(31 downto 0);
    signal fir1_real_input : STD_LOGIC_VECTOR(31 downto 0);
    signal fir2_real_input : STD_LOGIC_VECTOR(31 downto 0);
    signal fir1_imag_data_tready : STD_LOGIC;
    signal fir2_imag_data_tready : STD_LOGIC;
    signal fir1_imag_data_tvalid : std_logic;
    signal fir2_imag_data_tvalid : std_logic;
    signal fir1_imag_data_tdata : STD_LOGIC_VECTOR(31 downto 0);
    signal fir2_imag_data_tdata : STD_LOGIC_VECTOR(31 downto 0);
    signal fir1_imag_input : STD_LOGIC_VECTOR(31 downto 0);
    signal fir2_imag_input : STD_LOGIC_VECTOR(31 downto 0);
    signal dac_input_real : std_logic_vector(15 downto 0);
    signal dac_input_imag : std_logic_vector(15 downto 0);
    signal valid : std_logic;
    
    signal fir2_real_input_good : std_logic_vector(31 downto 0);
    signal fir2_imag_input_good : std_logic_vector(31 downto 0);
    

begin

   dds_compiler_0: component design_1_dds_compiler_0_0
     port map (
      aclk => aclk,
      aresetn => phase_rst_sig,
      m_axis_data_tdata => dds_0_tdata,
      m_axis_data_tvalid => dds_0_tvalid,
      s_axis_phase_tdata => phase_tdata_0,
      s_axis_phase_tvalid => phase_tvalid_0
    );
dds_compiler_1: component design_1_dds_compiler_0_1
     port map (
      aclk => aclk,
      aresetn => phase_rst_sig,
      m_axis_data_tdata => dds_1_tdata,
      m_axis_data_tvalid => dds_1_tvalid,
      s_axis_phase_tdata => phase_tdata_1,
      s_axis_phase_tvalid => phase_tvalid_1
    );

--    dds_blocks_i: component dds_blocks
--        port map (
--            aclk => aclk,
--            phase_rst => phase_rst_sig,
--            dds_0_tdata(15 downto 0) => dds_0_tdata(15 downto 0),
--            dds_0_tvalid => dds_0_tvalid,
--            dds_1_tdata(31 downto 0) => dds_1_tdata(31 downto 0),
--            dds_1_tvalid => dds_1_tvalid,
--            phase_tdata_0(31 downto 0) => phase_tdata_0(31 downto 0),
--            phase_tdata_1(31 downto 0) => phase_tdata_1(31 downto 0),
--            phase_tvalid_0 => phase_tvalid_0,
--            phase_tvalid_1 => phase_tvalid_1
--        );


    fir1_real : fir_compiler_0
        PORT MAP (
            aclk => aclk,
            s_axis_data_tvalid => dds_0_tvalid and dds_1_tvalid,
            s_axis_data_tready => fir1_real_data_tready,
            s_axis_data_tdata => fir1_real_input,
            m_axis_data_tvalid => fir1_real_data_tvalid,
            m_axis_data_tdata => fir1_real_data_tdata
        );

    fir1_imag : fir_compiler_0
        PORT MAP (
            aclk => aclk,
            s_axis_data_tvalid => dds_0_tvalid and dds_1_tvalid,
            s_axis_data_tready => fir1_imag_data_tready,
            s_axis_data_tdata => fir1_imag_input,
            m_axis_data_tvalid => fir1_imag_data_tvalid,
            m_axis_data_tdata => fir1_imag_data_tdata
        );

    fir2_real : fir_compiler_1
        PORT MAP (
            aclk => aclk,
            s_axis_data_tvalid => fir1_real_data_tvalid,
            s_axis_data_tready => fir2_real_data_tready,
            s_axis_data_tdata => fir2_real_input,
            m_axis_data_tvalid => fir2_real_data_tvalid,
            m_axis_data_tdata => fir2_real_data_tdata
        );

    fir2_imag : fir_compiler_1
        PORT MAP (
            aclk => aclk,
            s_axis_data_tvalid => fir1_imag_data_tvalid,
            s_axis_data_tready => fir2_imag_data_tready,
            s_axis_data_tdata => fir2_imag_input,
            m_axis_data_tvalid => fir2_imag_data_tvalid,
            m_axis_data_tdata => fir2_imag_data_tdata
        );

    process(aclk, aresetn)
    begin
        if aresetn = '0' then
            fir1_real_input <= "00000000000000000000000000000000";
            fir1_imag_input <= "00000000000000000000000000000000";
        elsif rising_edge(aclk) then
            if dds_0_tvalid = '1' and dds_1_tvalid = '1' then
                fir1_real_input <= std_logic_vector(signed(dds_0_tdata) * signed(dds_1_tdata(15 downto 0)));
                fir1_imag_input <= std_logic_vector(signed(dds_0_tdata) * signed(dds_1_tdata(31 downto 16)));
            end if;
        end if;
    end process;

    process(aclk, aresetn)
    begin
        if aresetn = '0' then
            fir2_real_input <= "00000000000000000000000000000000";
        elsif rising_edge(aclk) then
            if fir1_real_data_tready = '1' then --fir1_real_data_tvalid = '1' and fir2_real_data_tready = '1' then
                fir2_real_input <= fir2_real_input_good;--fir1_real_data_tdata(31 downto 0);
            end if;
            if fir1_real_data_tvalid = '1' then
                fir2_real_input_good <= fir1_real_data_tdata;
            end if;
        end if;
    end process;

    process(aclk, aresetn)
    begin
        if aresetn = '0' then
            fir2_imag_input <= "00000000000000000000000000000000";
        elsif rising_edge(aclk) then
            if fir2_imag_data_tready = '1' then --fir1_imag_data_tvalid = '1' and fir2_imag_data_tready = '1' then
                fir2_imag_input <= fir2_imag_input_good;--fir1_imag_data_tdata(31 downto 0);
            end if;
            if fir1_imag_data_tvalid = '1' then
                fir2_imag_input_good <= fir1_real_data_tdata;
            end if;
        end if;
    end process;

    process(aclk, aresetn)
    begin
        if aresetn = '0' then
            dac_input_real <= "0000000000000000";
        elsif rising_edge(aclk) then
            if fir2_real_data_tvalid = '1' then
                dac_input_real <= fir2_real_data_tdata(31 downto 16);
            end if;
        end if;
    end process;

    process(aclk, aresetn)
    begin
        if aresetn = '0' then
            dac_input_imag <= "0000000000000000";
        elsif rising_edge(aclk) then
            if fir2_imag_data_tvalid = '1' then
                dac_input_imag <= fir2_imag_data_tdata(31 downto 16);
            end if;
        end if;
    end process;

    process(aclk, aresetn)
    begin
        if aresetn = '0' then
            data_word <= "00000000000000000000000000000000";
        elsif rising_edge(aclk) then
            data_word(31 downto 16) <= fir1_real_input(31 downto 16); -- imaginary part in left channel
            data_word(15 downto 0) <= fir1_imag_input(31 downto 16); -- real part in right channel
        end if;
    end process;
    
    phase_rst_sig <= not phase_rst;

    --    process(sw0)
    --    begin
    --    if sw0 = '1' then
    --        valid <= fir2_data_tvalid;
    --    else
    --        valid <= m_axis_data_tvalid;
    --    end if;
    --    end process;

end Behavioral;
