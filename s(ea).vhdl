library ieee;
use ieee.std_logic_1164.all;
entity estado_atual is
    port(
        c_in   : in  std_logic_vector(2 downto 0);
        d_dev  : out std_logic;
        d_cof  : out std_logic;
        d_disp : out std_logic;
    );
end entity;
architecture current of estado_atual is 
    d_dev <= c_in(1) and c_in(2);
    d_cof <= not(c_in(1)) and c_in(2);
    d_disp <= not(c_in(1)) and c_in(2);
end architecture;