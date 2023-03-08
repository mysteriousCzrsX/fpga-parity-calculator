----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.03.2023 16:17:44
-- Design Name: 
-- Module Name: parity - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;echo 2a19 1009 > /sys/bus/usb-serial/drivers/ftdi_sio/new_id

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port(dip_sw : in STD_LOGIC_VECTOR (7 downto 0);
        enable : out STD_LOGIC_VECTOR (3 downto 0);
        seven_segment : out STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Behavioral of top is
    signal parity_bit : STD_LOGIC;
begin
    enable <= "1110";
    parity_bit <= dip_sw(7) xor dip_sw(6) xor dip_sw(5) xor dip_sw(4) xor dip_sw(3) xor dip_sw(2) xor dip_sw(1) xor dip_sw(0);
    seven_segment <= "00111000" when (parity_bit = '0') else "00010001"; -- 0 = 00000011 E = 01100001
end Behavioral;

