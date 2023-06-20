library ieee;
use ieee.std_logic_1164.all;
entity tb_chocoMaq is
end entity;
architecture tb_teste of tb_chocoMaq is
    constant CLK_PERIOD : time := 20 ns;
    component estado_atual is
        port(
            c_in   : in  std_logic_vector(2 downto 0);
            d_dev  : out std_logic;
            d_cof  : out std_logic;
            d_disp : out std_logic;
        );
    end component;
    component estado_anterior is
        port(
            c_in   : in  std_logic_vector(2 downto 0);
            m_50  : in std_logic;
            m_25  : in std_logic;
            c_out : out std_logic_vector(2 downto 0);
        );
    end component;
    component bloco_reg is
        port(
            clk   : in  std_logic;
            reset : in  std_logic;
            c_in  : in  std_logic_vector(2 downto 0);
            c_out : out std_logic_vector(2 downto 0);
        );
    end component;

        signal sFEAtoREG, sREGtoEA : std_logic_vector(2 downto 0);
        signal sclk: std_logic;

    begin







    p_clock : process
    begin
        sclk <= not(sclk);
        wait for CLK_PERIOD/2;
    end process;

end architecture;