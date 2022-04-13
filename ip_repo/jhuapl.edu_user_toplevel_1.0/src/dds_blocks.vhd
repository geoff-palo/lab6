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
entity dds_blocks is
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
    phase_tvalid_1 : in STD_LOGIC
  );
  
end dds_blocks;

architecture behavioral of dds_blocks is
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
 
begin
  
dds_compiler_0: component design_1_dds_compiler_0_0
     port map (
      aclk => aclk,
      aresetn => phase_rst,
      m_axis_data_tdata => dds_0_tdata,
      m_axis_data_tvalid => dds_0_tvalid,
      s_axis_phase_tdata => phase_tdata_0,
      s_axis_phase_tvalid => phase_tvalid_0
    );
dds_compiler_1: component design_1_dds_compiler_0_1
     port map (
      aclk => aclk,
      aresetn => phase_rst,
      m_axis_data_tdata => dds_1_tdata,
      m_axis_data_tvalid => dds_1_tvalid,
      s_axis_phase_tdata => phase_tdata_1,
      s_axis_phase_tvalid => phase_tvalid_1
    );
end behavioral;
