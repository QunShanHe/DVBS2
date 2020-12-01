-- -------------------------------------------------------------
-- 
-- File Name: /home/wardo/Documents/DVBS2/DVBS2/src/transmitter/4-Mapping/codegen/modulate_8psk/hdlsrc/modulate_8psk_fixpt.vhd
-- Created: 2020-11-29 00:56:56
-- 
-- Generated by MATLAB 9.9, MATLAB Coder 5.1 and HDL Coder 3.17
-- 
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Design base rate: 1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: modulate_8psk_fixpt
-- Source Path: modulate_8psk_fixpt
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.modulate_8psk_fixpt_pkg.ALL;

ENTITY modulate_8psk_fixpt IS
  PORT( input_bits                        :   IN    std_logic_vector(0 TO 2);  -- ufix1 [3]
        A                                 :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
        I                                 :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En10
        Q                                 :   OUT   std_logic_vector(13 DOWNTO 0)  -- sfix14_En10
        );
END modulate_8psk_fixpt;


ARCHITECTURE rtl OF modulate_8psk_fixpt IS

  -- Constants
  CONSTANT nc                             : vector_of_signed16(0 TO 255) := 
    (to_signed(16#0000#, 16), to_signed(16#0324#, 16), to_signed(16#0648#, 16), to_signed(16#096B#, 16),
     to_signed(16#0C8C#, 16), to_signed(16#0FAB#, 16), to_signed(16#12C8#, 16), to_signed(16#15E2#, 16),
     to_signed(16#18F9#, 16), to_signed(16#1C0C#, 16), to_signed(16#1F1A#, 16), to_signed(16#2224#, 16),
     to_signed(16#2528#, 16), to_signed(16#2827#, 16), to_signed(16#2B1F#, 16), to_signed(16#2E11#, 16),
     to_signed(16#30FC#, 16), to_signed(16#33DF#, 16), to_signed(16#36BA#, 16), to_signed(16#398D#, 16),
     to_signed(16#3C57#, 16), to_signed(16#3F17#, 16), to_signed(16#41CE#, 16), to_signed(16#447B#, 16),
     to_signed(16#471D#, 16), to_signed(16#49B4#, 16), to_signed(16#4C40#, 16), to_signed(16#4EC0#, 16),
     to_signed(16#5134#, 16), to_signed(16#539B#, 16), to_signed(16#55F6#, 16), to_signed(16#5843#, 16),
     to_signed(16#5A82#, 16), to_signed(16#5CB4#, 16), to_signed(16#5ED7#, 16), to_signed(16#60EC#, 16),
     to_signed(16#62F2#, 16), to_signed(16#64E9#, 16), to_signed(16#66D0#, 16), to_signed(16#68A7#, 16),
     to_signed(16#6A6E#, 16), to_signed(16#6C24#, 16), to_signed(16#6DCA#, 16), to_signed(16#6F5F#, 16),
     to_signed(16#70E3#, 16), to_signed(16#7255#, 16), to_signed(16#73B6#, 16), to_signed(16#7505#, 16),
     to_signed(16#7642#, 16), to_signed(16#776C#, 16), to_signed(16#7885#, 16), to_signed(16#798A#, 16),
     to_signed(16#7A7D#, 16), to_signed(16#7B5D#, 16), to_signed(16#7C2A#, 16), to_signed(16#7CE4#, 16),
     to_signed(16#7D8A#, 16), to_signed(16#7E1E#, 16), to_signed(16#7E9D#, 16), to_signed(16#7F0A#, 16),
     to_signed(16#7F62#, 16), to_signed(16#7FA7#, 16), to_signed(16#7FD9#, 16), to_signed(16#7FF6#, 16),
     to_signed(16#7FFF#, 16), to_signed(16#7FF6#, 16), to_signed(16#7FD9#, 16), to_signed(16#7FA7#, 16),
     to_signed(16#7F62#, 16), to_signed(16#7F0A#, 16), to_signed(16#7E9D#, 16), to_signed(16#7E1E#, 16),
     to_signed(16#7D8A#, 16), to_signed(16#7CE4#, 16), to_signed(16#7C2A#, 16), to_signed(16#7B5D#, 16),
     to_signed(16#7A7D#, 16), to_signed(16#798A#, 16), to_signed(16#7885#, 16), to_signed(16#776C#, 16),
     to_signed(16#7642#, 16), to_signed(16#7505#, 16), to_signed(16#73B6#, 16), to_signed(16#7255#, 16),
     to_signed(16#70E3#, 16), to_signed(16#6F5F#, 16), to_signed(16#6DCA#, 16), to_signed(16#6C24#, 16),
     to_signed(16#6A6E#, 16), to_signed(16#68A7#, 16), to_signed(16#66D0#, 16), to_signed(16#64E9#, 16),
     to_signed(16#62F2#, 16), to_signed(16#60EC#, 16), to_signed(16#5ED7#, 16), to_signed(16#5CB4#, 16),
     to_signed(16#5A82#, 16), to_signed(16#5843#, 16), to_signed(16#55F6#, 16), to_signed(16#539B#, 16),
     to_signed(16#5134#, 16), to_signed(16#4EC0#, 16), to_signed(16#4C40#, 16), to_signed(16#49B4#, 16),
     to_signed(16#471D#, 16), to_signed(16#447B#, 16), to_signed(16#41CE#, 16), to_signed(16#3F17#, 16),
     to_signed(16#3C57#, 16), to_signed(16#398D#, 16), to_signed(16#36BA#, 16), to_signed(16#33DF#, 16),
     to_signed(16#30FC#, 16), to_signed(16#2E11#, 16), to_signed(16#2B1F#, 16), to_signed(16#2827#, 16),
     to_signed(16#2528#, 16), to_signed(16#2224#, 16), to_signed(16#1F1A#, 16), to_signed(16#1C0C#, 16),
     to_signed(16#18F9#, 16), to_signed(16#15E2#, 16), to_signed(16#12C8#, 16), to_signed(16#0FAB#, 16),
     to_signed(16#0C8C#, 16), to_signed(16#096B#, 16), to_signed(16#0648#, 16), to_signed(16#0324#, 16),
     to_signed(16#0000#, 16), to_signed(-16#0324#, 16), to_signed(-16#0648#, 16), to_signed(-16#096B#, 16),
     to_signed(-16#0C8C#, 16), to_signed(-16#0FAB#, 16), to_signed(-16#12C8#, 16), to_signed(-16#15E2#, 16),
     to_signed(-16#18F9#, 16), to_signed(-16#1C0C#, 16), to_signed(-16#1F1A#, 16), to_signed(-16#2224#, 16),
     to_signed(-16#2528#, 16), to_signed(-16#2827#, 16), to_signed(-16#2B1F#, 16), to_signed(-16#2E11#, 16),
     to_signed(-16#30FC#, 16), to_signed(-16#33DF#, 16), to_signed(-16#36BA#, 16), to_signed(-16#398D#, 16),
     to_signed(-16#3C57#, 16), to_signed(-16#3F17#, 16), to_signed(-16#41CE#, 16), to_signed(-16#447B#, 16),
     to_signed(-16#471D#, 16), to_signed(-16#49B4#, 16), to_signed(-16#4C40#, 16), to_signed(-16#4EC0#, 16),
     to_signed(-16#5134#, 16), to_signed(-16#539B#, 16), to_signed(-16#55F6#, 16), to_signed(-16#5843#, 16),
     to_signed(-16#5A82#, 16), to_signed(-16#5CB4#, 16), to_signed(-16#5ED7#, 16), to_signed(-16#60EC#, 16),
     to_signed(-16#62F2#, 16), to_signed(-16#64E9#, 16), to_signed(-16#66D0#, 16), to_signed(-16#68A7#, 16),
     to_signed(-16#6A6E#, 16), to_signed(-16#6C24#, 16), to_signed(-16#6DCA#, 16), to_signed(-16#6F5F#, 16),
     to_signed(-16#70E3#, 16), to_signed(-16#7255#, 16), to_signed(-16#73B6#, 16), to_signed(-16#7505#, 16),
     to_signed(-16#7642#, 16), to_signed(-16#776C#, 16), to_signed(-16#7885#, 16), to_signed(-16#798A#, 16),
     to_signed(-16#7A7D#, 16), to_signed(-16#7B5D#, 16), to_signed(-16#7C2A#, 16), to_signed(-16#7CE4#, 16),
     to_signed(-16#7D8A#, 16), to_signed(-16#7E1E#, 16), to_signed(-16#7E9D#, 16), to_signed(-16#7F0A#, 16),
     to_signed(-16#7F62#, 16), to_signed(-16#7FA7#, 16), to_signed(-16#7FD9#, 16), to_signed(-16#7FF6#, 16),
     to_signed(-16#7FFF#, 16), to_signed(-16#7FF6#, 16), to_signed(-16#7FD9#, 16), to_signed(-16#7FA7#, 16),
     to_signed(-16#7F62#, 16), to_signed(-16#7F0A#, 16), to_signed(-16#7E9D#, 16), to_signed(-16#7E1E#, 16),
     to_signed(-16#7D8A#, 16), to_signed(-16#7CE4#, 16), to_signed(-16#7C2A#, 16), to_signed(-16#7B5D#, 16),
     to_signed(-16#7A7D#, 16), to_signed(-16#798A#, 16), to_signed(-16#7885#, 16), to_signed(-16#776C#, 16),
     to_signed(-16#7642#, 16), to_signed(-16#7505#, 16), to_signed(-16#73B6#, 16), to_signed(-16#7255#, 16),
     to_signed(-16#70E3#, 16), to_signed(-16#6F5F#, 16), to_signed(-16#6DCA#, 16), to_signed(-16#6C24#, 16),
     to_signed(-16#6A6E#, 16), to_signed(-16#68A7#, 16), to_signed(-16#66D0#, 16), to_signed(-16#64E9#, 16),
     to_signed(-16#62F2#, 16), to_signed(-16#60EC#, 16), to_signed(-16#5ED7#, 16), to_signed(-16#5CB4#, 16),
     to_signed(-16#5A82#, 16), to_signed(-16#5843#, 16), to_signed(-16#55F6#, 16), to_signed(-16#539B#, 16),
     to_signed(-16#5134#, 16), to_signed(-16#4EC0#, 16), to_signed(-16#4C40#, 16), to_signed(-16#49B4#, 16),
     to_signed(-16#471D#, 16), to_signed(-16#447B#, 16), to_signed(-16#41CE#, 16), to_signed(-16#3F17#, 16),
     to_signed(-16#3C57#, 16), to_signed(-16#398D#, 16), to_signed(-16#36BA#, 16), to_signed(-16#33DF#, 16),
     to_signed(-16#30FC#, 16), to_signed(-16#2E11#, 16), to_signed(-16#2B1F#, 16), to_signed(-16#2827#, 16),
     to_signed(-16#2528#, 16), to_signed(-16#2224#, 16), to_signed(-16#1F1A#, 16), to_signed(-16#1C0C#, 16),
     to_signed(-16#18F9#, 16), to_signed(-16#15E2#, 16), to_signed(-16#12C8#, 16), to_signed(-16#0FAB#, 16),
     to_signed(-16#0C8C#, 16), to_signed(-16#096B#, 16), to_signed(-16#0648#, 16), to_signed(-16#0324#, 16));  -- sfix16 [256]
  CONSTANT nc_0                           : vector_of_signed16(0 TO 255) := 
    (to_signed(16#7FFF#, 16), to_signed(16#7FF6#, 16), to_signed(16#7FD9#, 16), to_signed(16#7FA7#, 16),
     to_signed(16#7F62#, 16), to_signed(16#7F0A#, 16), to_signed(16#7E9D#, 16), to_signed(16#7E1E#, 16),
     to_signed(16#7D8A#, 16), to_signed(16#7CE4#, 16), to_signed(16#7C2A#, 16), to_signed(16#7B5D#, 16),
     to_signed(16#7A7D#, 16), to_signed(16#798A#, 16), to_signed(16#7885#, 16), to_signed(16#776C#, 16),
     to_signed(16#7642#, 16), to_signed(16#7505#, 16), to_signed(16#73B6#, 16), to_signed(16#7255#, 16),
     to_signed(16#70E3#, 16), to_signed(16#6F5F#, 16), to_signed(16#6DCA#, 16), to_signed(16#6C24#, 16),
     to_signed(16#6A6E#, 16), to_signed(16#68A7#, 16), to_signed(16#66D0#, 16), to_signed(16#64E9#, 16),
     to_signed(16#62F2#, 16), to_signed(16#60EC#, 16), to_signed(16#5ED7#, 16), to_signed(16#5CB4#, 16),
     to_signed(16#5A82#, 16), to_signed(16#5843#, 16), to_signed(16#55F6#, 16), to_signed(16#539B#, 16),
     to_signed(16#5134#, 16), to_signed(16#4EC0#, 16), to_signed(16#4C40#, 16), to_signed(16#49B4#, 16),
     to_signed(16#471D#, 16), to_signed(16#447B#, 16), to_signed(16#41CE#, 16), to_signed(16#3F17#, 16),
     to_signed(16#3C57#, 16), to_signed(16#398D#, 16), to_signed(16#36BA#, 16), to_signed(16#33DF#, 16),
     to_signed(16#30FC#, 16), to_signed(16#2E11#, 16), to_signed(16#2B1F#, 16), to_signed(16#2827#, 16),
     to_signed(16#2528#, 16), to_signed(16#2224#, 16), to_signed(16#1F1A#, 16), to_signed(16#1C0C#, 16),
     to_signed(16#18F9#, 16), to_signed(16#15E2#, 16), to_signed(16#12C8#, 16), to_signed(16#0FAB#, 16),
     to_signed(16#0C8C#, 16), to_signed(16#096B#, 16), to_signed(16#0648#, 16), to_signed(16#0324#, 16),
     to_signed(16#0000#, 16), to_signed(-16#0324#, 16), to_signed(-16#0648#, 16), to_signed(-16#096B#, 16),
     to_signed(-16#0C8C#, 16), to_signed(-16#0FAB#, 16), to_signed(-16#12C8#, 16), to_signed(-16#15E2#, 16),
     to_signed(-16#18F9#, 16), to_signed(-16#1C0C#, 16), to_signed(-16#1F1A#, 16), to_signed(-16#2224#, 16),
     to_signed(-16#2528#, 16), to_signed(-16#2827#, 16), to_signed(-16#2B1F#, 16), to_signed(-16#2E11#, 16),
     to_signed(-16#30FC#, 16), to_signed(-16#33DF#, 16), to_signed(-16#36BA#, 16), to_signed(-16#398D#, 16),
     to_signed(-16#3C57#, 16), to_signed(-16#3F17#, 16), to_signed(-16#41CE#, 16), to_signed(-16#447B#, 16),
     to_signed(-16#471D#, 16), to_signed(-16#49B4#, 16), to_signed(-16#4C40#, 16), to_signed(-16#4EC0#, 16),
     to_signed(-16#5134#, 16), to_signed(-16#539B#, 16), to_signed(-16#55F6#, 16), to_signed(-16#5843#, 16),
     to_signed(-16#5A82#, 16), to_signed(-16#5CB4#, 16), to_signed(-16#5ED7#, 16), to_signed(-16#60EC#, 16),
     to_signed(-16#62F2#, 16), to_signed(-16#64E9#, 16), to_signed(-16#66D0#, 16), to_signed(-16#68A7#, 16),
     to_signed(-16#6A6E#, 16), to_signed(-16#6C24#, 16), to_signed(-16#6DCA#, 16), to_signed(-16#6F5F#, 16),
     to_signed(-16#70E3#, 16), to_signed(-16#7255#, 16), to_signed(-16#73B6#, 16), to_signed(-16#7505#, 16),
     to_signed(-16#7642#, 16), to_signed(-16#776C#, 16), to_signed(-16#7885#, 16), to_signed(-16#798A#, 16),
     to_signed(-16#7A7D#, 16), to_signed(-16#7B5D#, 16), to_signed(-16#7C2A#, 16), to_signed(-16#7CE4#, 16),
     to_signed(-16#7D8A#, 16), to_signed(-16#7E1E#, 16), to_signed(-16#7E9D#, 16), to_signed(-16#7F0A#, 16),
     to_signed(-16#7F62#, 16), to_signed(-16#7FA7#, 16), to_signed(-16#7FD9#, 16), to_signed(-16#7FF6#, 16),
     to_signed(-16#7FFF#, 16), to_signed(-16#7FF6#, 16), to_signed(-16#7FD9#, 16), to_signed(-16#7FA7#, 16),
     to_signed(-16#7F62#, 16), to_signed(-16#7F0A#, 16), to_signed(-16#7E9D#, 16), to_signed(-16#7E1E#, 16),
     to_signed(-16#7D8A#, 16), to_signed(-16#7CE4#, 16), to_signed(-16#7C2A#, 16), to_signed(-16#7B5D#, 16),
     to_signed(-16#7A7D#, 16), to_signed(-16#798A#, 16), to_signed(-16#7885#, 16), to_signed(-16#776C#, 16),
     to_signed(-16#7642#, 16), to_signed(-16#7505#, 16), to_signed(-16#73B6#, 16), to_signed(-16#7255#, 16),
     to_signed(-16#70E3#, 16), to_signed(-16#6F5F#, 16), to_signed(-16#6DCA#, 16), to_signed(-16#6C24#, 16),
     to_signed(-16#6A6E#, 16), to_signed(-16#68A7#, 16), to_signed(-16#66D0#, 16), to_signed(-16#64E9#, 16),
     to_signed(-16#62F2#, 16), to_signed(-16#60EC#, 16), to_signed(-16#5ED7#, 16), to_signed(-16#5CB4#, 16),
     to_signed(-16#5A82#, 16), to_signed(-16#5843#, 16), to_signed(-16#55F6#, 16), to_signed(-16#539B#, 16),
     to_signed(-16#5134#, 16), to_signed(-16#4EC0#, 16), to_signed(-16#4C40#, 16), to_signed(-16#49B4#, 16),
     to_signed(-16#471D#, 16), to_signed(-16#447B#, 16), to_signed(-16#41CE#, 16), to_signed(-16#3F17#, 16),
     to_signed(-16#3C57#, 16), to_signed(-16#398D#, 16), to_signed(-16#36BA#, 16), to_signed(-16#33DF#, 16),
     to_signed(-16#30FC#, 16), to_signed(-16#2E11#, 16), to_signed(-16#2B1F#, 16), to_signed(-16#2827#, 16),
     to_signed(-16#2528#, 16), to_signed(-16#2224#, 16), to_signed(-16#1F1A#, 16), to_signed(-16#1C0C#, 16),
     to_signed(-16#18F9#, 16), to_signed(-16#15E2#, 16), to_signed(-16#12C8#, 16), to_signed(-16#0FAB#, 16),
     to_signed(-16#0C8C#, 16), to_signed(-16#096B#, 16), to_signed(-16#0648#, 16), to_signed(-16#0324#, 16),
     to_signed(16#0000#, 16), to_signed(16#0324#, 16), to_signed(16#0648#, 16), to_signed(16#096B#, 16),
     to_signed(16#0C8C#, 16), to_signed(16#0FAB#, 16), to_signed(16#12C8#, 16), to_signed(16#15E2#, 16),
     to_signed(16#18F9#, 16), to_signed(16#1C0C#, 16), to_signed(16#1F1A#, 16), to_signed(16#2224#, 16),
     to_signed(16#2528#, 16), to_signed(16#2827#, 16), to_signed(16#2B1F#, 16), to_signed(16#2E11#, 16),
     to_signed(16#30FC#, 16), to_signed(16#33DF#, 16), to_signed(16#36BA#, 16), to_signed(16#398D#, 16),
     to_signed(16#3C57#, 16), to_signed(16#3F17#, 16), to_signed(16#41CE#, 16), to_signed(16#447B#, 16),
     to_signed(16#471D#, 16), to_signed(16#49B4#, 16), to_signed(16#4C40#, 16), to_signed(16#4EC0#, 16),
     to_signed(16#5134#, 16), to_signed(16#539B#, 16), to_signed(16#55F6#, 16), to_signed(16#5843#, 16),
     to_signed(16#5A82#, 16), to_signed(16#5CB4#, 16), to_signed(16#5ED7#, 16), to_signed(16#60EC#, 16),
     to_signed(16#62F2#, 16), to_signed(16#64E9#, 16), to_signed(16#66D0#, 16), to_signed(16#68A7#, 16),
     to_signed(16#6A6E#, 16), to_signed(16#6C24#, 16), to_signed(16#6DCA#, 16), to_signed(16#6F5F#, 16),
     to_signed(16#70E3#, 16), to_signed(16#7255#, 16), to_signed(16#73B6#, 16), to_signed(16#7505#, 16),
     to_signed(16#7642#, 16), to_signed(16#776C#, 16), to_signed(16#7885#, 16), to_signed(16#798A#, 16),
     to_signed(16#7A7D#, 16), to_signed(16#7B5D#, 16), to_signed(16#7C2A#, 16), to_signed(16#7CE4#, 16),
     to_signed(16#7D8A#, 16), to_signed(16#7E1E#, 16), to_signed(16#7E9D#, 16), to_signed(16#7F0A#, 16),
     to_signed(16#7F62#, 16), to_signed(16#7FA7#, 16), to_signed(16#7FD9#, 16), to_signed(16#7FF6#, 16));  -- sfix16 [256]

  -- Signals
  SIGNAL A_unsigned                       : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL I_tmp                            : signed(13 DOWNTO 0);  -- sfix14_En10
  SIGNAL Q_tmp                            : signed(13 DOWNTO 0);  -- sfix14_En10

BEGIN
  A_unsigned <= unsigned(A);

  modulate_8psk_fixpt_1_output : PROCESS (A_unsigned, input_bits)
    VARIABLE FI_SIN_COS_LUT : vector_of_signed16(0 TO 255);
    VARIABLE fi_sin_cos_lut_0 : vector_of_signed16(0 TO 255);
    VARIABLE tmp : unsigned(8 DOWNTO 0);
    VARIABLE x : unsigned(36 DOWNTO 0);
    VARIABLE fullScaleIndex : unsigned(15 DOWNTO 0);
    VARIABLE idxLUTLoZero : unsigned(7 DOWNTO 0);
    VARIABLE c1 : signed(15 DOWNTO 0);
    VARIABLE x_0 : unsigned(36 DOWNTO 0);
    VARIABLE fullscaleindex_0 : unsigned(15 DOWNTO 0);
    VARIABLE idxlutlozero_0 : unsigned(7 DOWNTO 0);
    VARIABLE c1_0 : signed(15 DOWNTO 0);
    VARIABLE div_temp : unsigned(65 DOWNTO 0);
    VARIABLE div_temp_0 : unsigned(65 DOWNTO 0);
    VARIABLE mul_temp : unsigned(22 DOWNTO 0);
    VARIABLE cast : unsigned(65 DOWNTO 0);
    VARIABLE cast_0 : unsigned(36 DOWNTO 0);
    VARIABLE cast_1 : unsigned(3 DOWNTO 0);
    VARIABLE mul_temp_0 : unsigned(35 DOWNTO 0);
    VARIABLE sub_cast : unsigned(36 DOWNTO 0);
    VARIABLE sub_temp : unsigned(36 DOWNTO 0);
    VARIABLE cast_2 : unsigned(15 DOWNTO 0);
    VARIABLE mul_temp_1 : unsigned(47 DOWNTO 0);
    VARIABLE cast_3 : unsigned(31 DOWNTO 0);
    VARIABLE add_cast : signed(15 DOWNTO 0);
    VARIABLE mul_temp_2 : unsigned(22 DOWNTO 0);
    VARIABLE cast_4 : unsigned(65 DOWNTO 0);
    VARIABLE cast_5 : unsigned(36 DOWNTO 0);
    VARIABLE cast_6 : unsigned(3 DOWNTO 0);
    VARIABLE mul_temp_3 : unsigned(35 DOWNTO 0);
    VARIABLE sub_cast_0 : unsigned(36 DOWNTO 0);
    VARIABLE sub_temp_0 : unsigned(36 DOWNTO 0);
    VARIABLE cast_7 : unsigned(15 DOWNTO 0);
    VARIABLE mul_temp_4 : unsigned(47 DOWNTO 0);
    VARIABLE cast_8 : unsigned(31 DOWNTO 0);
    VARIABLE add_cast_0 : signed(15 DOWNTO 0);
    VARIABLE cast_9 : signed(3 DOWNTO 0);
    VARIABLE add_cast_1 : signed(31 DOWNTO 0);
    VARIABLE cast_10 : signed(8 DOWNTO 0);
    VARIABLE add_temp : unsigned(7 DOWNTO 0);
    VARIABLE add_cast_2 : signed(15 DOWNTO 0);
    VARIABLE sub_cast_1 : signed(31 DOWNTO 0);
    VARIABLE sub_cast_2 : signed(31 DOWNTO 0);
    VARIABLE sub_temp_1 : signed(31 DOWNTO 0);
    VARIABLE mul_temp_5 : signed(40 DOWNTO 0);
    VARIABLE add_cast_3 : signed(31 DOWNTO 0);
    VARIABLE add_cast_4 : signed(15 DOWNTO 0);
    VARIABLE add_cast_5 : signed(31 DOWNTO 0);
    VARIABLE add_temp_0 : signed(31 DOWNTO 0);
    VARIABLE cast_11 : signed(15 DOWNTO 0);
    VARIABLE mul_temp_6 : signed(19 DOWNTO 0);
    VARIABLE cast_12 : signed(18 DOWNTO 0);
    VARIABLE cast_13 : signed(3 DOWNTO 0);
    VARIABLE add_cast_6 : signed(31 DOWNTO 0);
    VARIABLE cast_14 : signed(8 DOWNTO 0);
    VARIABLE add_temp_1 : unsigned(7 DOWNTO 0);
    VARIABLE add_cast_7 : signed(15 DOWNTO 0);
    VARIABLE sub_cast_3 : signed(31 DOWNTO 0);
    VARIABLE sub_cast_4 : signed(31 DOWNTO 0);
    VARIABLE sub_temp_2 : signed(31 DOWNTO 0);
    VARIABLE mul_temp_7 : signed(40 DOWNTO 0);
    VARIABLE add_cast_8 : signed(31 DOWNTO 0);
    VARIABLE add_cast_9 : signed(15 DOWNTO 0);
    VARIABLE add_cast_10 : signed(31 DOWNTO 0);
    VARIABLE add_temp_2 : signed(31 DOWNTO 0);
    VARIABLE cast_15 : signed(15 DOWNTO 0);
    VARIABLE mul_temp_8 : signed(19 DOWNTO 0);
    VARIABLE cast_16 : signed(18 DOWNTO 0);
  BEGIN
    --HDL code generation from MATLAB function: modulate_8psk_fixpt
    FI_SIN_COS_LUT := nc;
    fi_sin_cos_lut_0 := nc_0;
    --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    --                                                                          %
    --           Generated by MATLAB 9.9 and Fixed-Point Designer 7.1           %
    --                                                                          %
    --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    -- 8psk_modulate Maps the bits in a stream of bits to an array of complex
    -- symbols following an 16APSK modulation scheme.
    -- @arg input_bit: Must be a vector with only 3 bits. The first
    --               bit has to be the most significant bit (MSB).
    -- @arg A: The amplitude of the desired symbols.
    IF ((input_bits(0) = '1') AND (input_bits(1) = '0')) AND (input_bits(2) = '1') THEN 
      tmp := to_unsigned(16#13B#, 9);
    ELSE 
      tmp := to_unsigned(16#000#, 9);
    END IF;
    IF ((input_bits(0) = '1') AND (input_bits(1) = '1')) AND (input_bits(2) = '1') THEN 
      tmp := to_unsigned(16#10E#, 9);
    END IF;
    IF ((input_bits(0) = '0') AND (input_bits(1) = '1')) AND (input_bits(2) = '1') THEN 
      tmp := to_unsigned(16#0E1#, 9);
    END IF;
    IF ((input_bits(0) = '0') AND (input_bits(1) = '1')) AND (input_bits(2) = '0') THEN 
      tmp := to_unsigned(16#0B4#, 9);
    END IF;
    IF ((input_bits(0) = '1') AND (input_bits(1) = '1')) AND (input_bits(2) = '0') THEN 
      tmp := to_unsigned(16#087#, 9);
    END IF;
    IF ((input_bits(0) = '1') AND (input_bits(1) = '0')) AND (input_bits(2) = '0') THEN 
      tmp := to_unsigned(16#05A#, 9);
    END IF;
    IF ((input_bits(0) = '0') AND (input_bits(1) = '0')) AND (input_bits(2) = '0') THEN 
      tmp := to_unsigned(16#02D#, 9);
    END IF;
    -- Start at phase 0
    IF ((input_bits(0) = '0') AND (input_bits(1) = '0')) AND (input_bits(2) = '1') THEN 
      tmp := to_unsigned(16#000#, 9);
    END IF;
    mul_temp := tmp * to_unsigned(16#3243#, 14);
    x := mul_temp * to_unsigned(16#2D82#, 14);
    cast := x & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0';
    div_temp := cast / unsigned'(X"C90FDAA2");
    cast_0 := div_temp(36 DOWNTO 0);
    cast_1 := cast_0(36 DOWNTO 33);
    mul_temp_0 := cast_1 * unsigned'(X"C90FDAA2");
    sub_cast := mul_temp_0(32 DOWNTO 0) & '0' & '0' & '0' & '0';
    sub_temp := x - sub_cast;
    cast_2 := sub_temp(35 DOWNTO 20);
    mul_temp_1 := unsigned'(X"A2F96524") * cast_2;
    cast_3 := mul_temp_1(46 DOWNTO 15);
    fullScaleIndex := cast_3(31 DOWNTO 16);
    idxLUTLoZero := fullScaleIndex(15 DOWNTO 8);
    add_cast := signed(resize(idxLUTLoZero, 16));
    c1 := add_cast + to_signed(16#0001#, 16);
    mul_temp_2 := tmp * to_unsigned(16#3243#, 14);
    x_0 := mul_temp_2 * to_unsigned(16#2D82#, 14);
    cast_4 := x_0 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0';
    div_temp_0 := cast_4 / unsigned'(X"C90FDAA2");
    cast_5 := div_temp_0(36 DOWNTO 0);
    cast_6 := cast_5(36 DOWNTO 33);
    mul_temp_3 := cast_6 * unsigned'(X"C90FDAA2");
    sub_cast_0 := mul_temp_3(32 DOWNTO 0) & '0' & '0' & '0' & '0';
    sub_temp_0 := x_0 - sub_cast_0;
    cast_7 := sub_temp_0(35 DOWNTO 20);
    mul_temp_4 := unsigned'(X"A2F96524") * cast_7;
    cast_8 := mul_temp_4(46 DOWNTO 15);
    fullscaleindex_0 := cast_8(31 DOWNTO 16);
    idxlutlozero_0 := fullscaleindex_0(15 DOWNTO 8);
    add_cast_0 := signed(resize(idxlutlozero_0, 16));
    c1_0 := add_cast_0 + to_signed(16#0001#, 16);
    cast_9 := signed(resize(A_unsigned, 4));
    add_cast_1 := resize(fi_sin_cos_lut_0(to_integer(resize(c1, 32) - 1)) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);
    cast_10 := signed(resize(fullScaleIndex(7 DOWNTO 0), 9));
    add_temp := idxLUTLoZero + to_unsigned(16#01#, 8);
    add_cast_2 := signed(resize(add_temp, 16));
    sub_cast_1 := resize(fi_sin_cos_lut_0(to_integer(resize(add_cast_2 + to_signed(16#0001#, 16), 32) - 1)) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);
    sub_cast_2 := resize(fi_sin_cos_lut_0(to_integer(resize(c1, 32) - 1)) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);
    sub_temp_1 := sub_cast_1 - sub_cast_2;
    mul_temp_5 := cast_10 * sub_temp_1;
    add_cast_3 := mul_temp_5(39 DOWNTO 8);
    add_cast_4 := add_cast_3(30 DOWNTO 15);
    add_cast_5 := resize(add_cast_4 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);
    add_temp_0 := add_cast_1 + add_cast_5;
    cast_11 := add_temp_0(30 DOWNTO 15);
    mul_temp_6 := cast_9 * cast_11;
    cast_12 := mul_temp_6(18 DOWNTO 0);
    I_tmp <= cast_12(18 DOWNTO 5);
    cast_13 := signed(resize(A_unsigned, 4));
    add_cast_6 := resize(FI_SIN_COS_LUT(to_integer(resize(c1_0, 32) - 1)) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);
    cast_14 := signed(resize(fullscaleindex_0(7 DOWNTO 0), 9));
    add_temp_1 := idxlutlozero_0 + to_unsigned(16#01#, 8);
    add_cast_7 := signed(resize(add_temp_1, 16));
    sub_cast_3 := resize(FI_SIN_COS_LUT(to_integer(resize(add_cast_7 + to_signed(16#0001#, 16), 32) - 1)) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);
    sub_cast_4 := resize(FI_SIN_COS_LUT(to_integer(resize(c1_0, 32) - 1)) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);
    sub_temp_2 := sub_cast_3 - sub_cast_4;
    mul_temp_7 := cast_14 * sub_temp_2;
    add_cast_8 := mul_temp_7(39 DOWNTO 8);
    add_cast_9 := add_cast_8(30 DOWNTO 15);
    add_cast_10 := resize(add_cast_9 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);
    add_temp_2 := add_cast_6 + add_cast_10;
    cast_15 := add_temp_2(30 DOWNTO 15);
    mul_temp_8 := cast_13 * cast_15;
    cast_16 := mul_temp_8(18 DOWNTO 0);
    Q_tmp <= cast_16(18 DOWNTO 5);
  END PROCESS modulate_8psk_fixpt_1_output;


  I <= std_logic_vector(I_tmp);

  Q <= std_logic_vector(Q_tmp);

END rtl;
