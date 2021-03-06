-- -------------------------------------------------------------
-- 
-- File Name: /Users/wardo/Desktop/Drawer/TelecomThesis/DVB-S2/src/transmitter/3-FEC/codegen/bch_lfsr_encode/hdlsrc/bch_lfsr_encode_fixpt_pkg.vhd
-- Created: 2020-10-19 20:03:15
-- 
-- Generated by MATLAB 9.9, MATLAB Coder 5.1 and HDL Coder 3.17
-- 
-- 
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE bch_lfsr_encode_fixpt_pkg IS
  TYPE vector_of_signed32 IS ARRAY (NATURAL RANGE <>) OF signed(31 DOWNTO 0);
  TYPE vector_of_unsigned16 IS ARRAY (NATURAL RANGE <>) OF unsigned(15 DOWNTO 0);
END bch_lfsr_encode_fixpt_pkg;

