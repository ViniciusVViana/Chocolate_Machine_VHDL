library ieee;
use ieee.std_logic_1164.all;
entity estado_anterior is
    port(
        c_in   : in  std_logic_vector(2 downto 0);
        m_50  : in std_logic;
        m_25  : in std_logic;
        c_out : out std_logic_vector(2 downto 0);
    );
end entity;
architecture past of estado_anterior is 
    
begin 
    c_out(0) <= (m_25 and m_50) or (not(c_in(0)) and m_50) or (c_in(0) and not(c_in(1)) and not(m_50)) or(c_in(0) and c_in(1) and c_in and m_50) or (not(c_in(0)) and c_in(1) and m_25) or (not(c_in(2)) and c_in(1) and c_in(0) and m_25);
    
    c_out(1) <= (not(c_in(2)) and c_in(1) and not(m_25)) or (not(c_in(1)) and m_25) or (m_25 and m_50) or (c_in(2) and m_25);
    c_out(2) <= (m_25 and m_50) or (not(c_in(2)) and c_in(0) and m_50) or (not(c_in(2)) and c_in(1) and c_in(0) and m_25);
end architecture;