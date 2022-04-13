--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
--Date        : Mon Apr 11 18:02:05 2022
--Host        : PALOGH1-WL1 running 64-bit major release  (build 9200)
--Command     : generate_target design_1.bd
--Design      : design_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1 is
  port (
    aclk : in STD_LOGIC;
    dds_0_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    dds_0_tvalid : out STD_LOGIC;
    dds_1_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dds_1_tvalid : out STD_LOGIC;
    phase_rst : in STD_LOGIC;
    phase_tdata_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    phase_tdata_1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    phase_tvalid_0 : in STD_LOGIC;
    phase_tvalid_1 : in STD_LOGIC;
    sys_clk : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1 : entity is "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=5,da_board_cnt=3,da_ps7_cnt=1,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of design_1 : entity is "design_1.hwdef";
end design_1;

architecture STRUCTURE of design_1 is
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
  signal axi_gpio_1_gpio_io_o : STD_LOGIC;
  signal dds_compiler_0_m_axis_data_tdata : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal dds_compiler_0_m_axis_data_tvalid : STD_LOGIC;
  signal dds_compiler_1_m_axis_data_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal dds_compiler_1_m_axis_data_tvalid : STD_LOGIC;
  signal phase_tdata_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal phase_tdata_1_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal phase_tvalid_0_1 : STD_LOGIC;
  signal phase_tvalid_1_1 : STD_LOGIC;
  signal processing_system7_0_FCLK_CLK0 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of aclk : signal is "xilinx.com:signal:clock:1.0 CLK.ACLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of aclk : signal is "XIL_INTERFACENAME CLK.ACLK, ASSOCIATED_RESET phase_rst, CLK_DOMAIN design_1_aclk, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of phase_rst : signal is "xilinx.com:signal:reset:1.0 RST.PHASE_RST RST";
  attribute X_INTERFACE_PARAMETER of phase_rst : signal is "XIL_INTERFACENAME RST.PHASE_RST, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of sys_clk : signal is "xilinx.com:signal:clock:1.0 CLK.SYS_CLK CLK";
  attribute X_INTERFACE_PARAMETER of sys_clk : signal is "XIL_INTERFACENAME CLK.SYS_CLK, CLK_DOMAIN design_1_aclk, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of phase_tdata_0 : signal is "xilinx.com:signal:data:1.0 DATA.PHASE_TDATA_0 DATA";
  attribute X_INTERFACE_PARAMETER of phase_tdata_0 : signal is "XIL_INTERFACENAME DATA.PHASE_TDATA_0, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of phase_tdata_1 : signal is "xilinx.com:signal:data:1.0 DATA.PHASE_TDATA_1 DATA";
  attribute X_INTERFACE_PARAMETER of phase_tdata_1 : signal is "XIL_INTERFACENAME DATA.PHASE_TDATA_1, LAYERED_METADATA undef";
begin
  axi_gpio_1_gpio_io_o <= phase_rst;
  dds_0_tdata(15 downto 0) <= dds_compiler_0_m_axis_data_tdata(15 downto 0);
  dds_0_tvalid <= dds_compiler_0_m_axis_data_tvalid;
  dds_1_tdata(31 downto 0) <= dds_compiler_1_m_axis_data_tdata(31 downto 0);
  dds_1_tvalid <= dds_compiler_1_m_axis_data_tvalid;
  phase_tdata_0_1(31 downto 0) <= phase_tdata_0(31 downto 0);
  phase_tdata_1_1(31 downto 0) <= phase_tdata_1(31 downto 0);
  phase_tvalid_0_1 <= phase_tvalid_0;
  phase_tvalid_1_1 <= phase_tvalid_1;
  processing_system7_0_FCLK_CLK0 <= aclk;
  sys_clk <= processing_system7_0_FCLK_CLK0;
dds_compiler_0: component design_1_dds_compiler_0_0
     port map (
      aclk => processing_system7_0_FCLK_CLK0,
      aresetn => axi_gpio_1_gpio_io_o,
      m_axis_data_tdata(15 downto 0) => dds_compiler_0_m_axis_data_tdata(15 downto 0),
      m_axis_data_tvalid => dds_compiler_0_m_axis_data_tvalid,
      s_axis_phase_tdata(31 downto 0) => phase_tdata_0_1(31 downto 0),
      s_axis_phase_tvalid => phase_tvalid_0_1
    );
dds_compiler_1: component design_1_dds_compiler_0_1
     port map (
      aclk => processing_system7_0_FCLK_CLK0,
      aresetn => axi_gpio_1_gpio_io_o,
      m_axis_data_tdata(31 downto 0) => dds_compiler_1_m_axis_data_tdata(31 downto 0),
      m_axis_data_tvalid => dds_compiler_1_m_axis_data_tvalid,
      s_axis_phase_tdata(31 downto 0) => phase_tdata_1_1(31 downto 0),
      s_axis_phase_tvalid => phase_tvalid_1_1
    );
end STRUCTURE;
