LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY estado_anterior IS
    PORT (
        c_in : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        m_50 : IN STD_LOGIC;
        m_25 : IN STD_LOGIC;
        c_out : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
    );
END ENTITY;
ARCHITECTURE past OF estado_anterior IS

BEGIN
    c_out(2) <= (m_50 and m_25) or (not(c_in(2)) and c_in(0) and m_50) or (not(c_in(2)) and c_in(1) and c_in(0) and m_25);
    c_out(1) <= (not(c_in(2)) and c_in(1) and not(m_25)) or (not(c_in(1)) and m_25) or (m_50 and m_25) or (c_in(2) and m_25);
    c_out(0) <= (not(c_in(2)) and c_in(0) and not(m_25) and not(m_50)) or (not(c_in(1)) and c_in(0) and m_25) or (c_in(1) and not(c_in(0)) and m_25) or (not(c_in(0)) and m_50) or (c_in(1) and m_50);
END ARCHITECTURE;

    --Abaixo a versao antiga que num funfa
    --c_out(2) <= (m_25 AND m_50) OR (c_in(0) AND m_50) OR (c_in(1) AND c_in(0) AND m_25);
    --c_out(1) <= (NOT(c_in(1)) AND m_25) OR (m_25 AND m_50) OR (c_in(1) AND NOT(m_25));
    --c_out(0) <= (m_25 AND m_50) OR (NOT(c_in(0)) AND m_50) OR (c_in(1) AND c_in(0) AND NOT(m_25)) OR (c_in(1) AND NOT(c_in(0)) AND m_25) OR (NOT(c_in(1)) AND c_in(0) AND NOT(m_50));