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
            d_disp : out std_logic
        );
    end component;
    component estado_anterior is
        port(
            c_in   : in  std_logic_vector(2 downto 0);
            m_50  : in std_logic;
            m_25  : in std_logic;
            c_out : out std_logic_vector(2 downto 0)
        );
    end component;
    component bloco_reg is
        port(
            clk   : in  std_logic;
            reset : in  std_logic;
            c_in  : in  std_logic_vector(2 downto 0);
            c_out : out std_logic_vector(2 downto 0)
        );
    end component;

        signal sFEAtoREG, sREGtoEA : std_logic_vector(2 downto 0);
        signal sClk : std_logic := '1';
        signal sReset : std_logic;
        signal sM50, sM25, sDev, sCof, sDisp : std_logic;

    begin

        u_estadanterior : estado_anterior port map (sREGtoEA, sM50, sM25, sFEAtoREG);
        u_registrator   : bloco_reg       port map (sClk, sReset, sFEAtoREG, sREGtoEA);
        u_estadatual    : estado_atual    port map (sREGtoEA, sDev, sCof, sDisp);

        u_testbantche : process
        begin
            sReset <= '0';
            sM50   <= '0';
            sM25   <= '0';
            wait for 4*CLK_PERIOD;
                --Instrunções de uso: um CLK_PERIOD equivale a um "estado" do sistema. Se, por exemplo, o
                --sM25 ficar ativado ('1') por mais de um CLK_PERIOD, a máquina vai entender que foram adicionadas
                --duas moedas de 25 centavos

                --Teste da saida de erro
                sReset <= '1';
                sM50   <= '1';
                sM25    <= '1';
            wait for CLK_PERIOD;
                sM50 <= '0';
                sM25 <= '0';
            wait for 4*CLK_PERIOD;
                sM25 <= '1';
            wait for CLK_PERIOD;
                sM25 <= '0';
            wait for CLK_PERIOD;
                sM50 <= '1';
            wait for CLK_PERIOD;
                sM50 <= '0';
            wait for CLK_PERIOD;
                sM25 <= '1';
            wait for CLK_PERIOD;
                sM25 <= '0';
            wait for CLK_PERIOD;
                sM25 <= '1';
            wait for CLK_PERIOD;
                sM25 <= '0';
            wait for CLK_PERIOD;
                sM50 <= '1';
            wait for CLK_PERIOD;
                sM50 <= '0';
            wait for CLK_PERIOD;
                sM50 <= '1';
            wait for CLK_PERIOD;
                sM50 <= '0';
            wait for CLK_PERIOD;
                sM50 <= '1';
            wait for 5*CLK_PERIOD;
                sM25 <= '1';
            wait for 2*CLK_PERIOD;
                sM25 <= '0'; 
            wait for CLK_PERIOD;
                sM25 <= '1';
            wait for CLK_PERIOD;
                sM50 <= '0';
                sM25 <= '0'; 
            wait for CLK_PERIOD;
                sM25 <= '1';
            wait for 8*CLK_PERIOD;
                sM25 <= '0';
                sM50 <= '1'; 
            wait for 6*CLK_PERIOD;
                sM50 <= '0';
                sM25 <= '1';
            wait for 100*CLK_PERIOD; 
        wait;
        end process;

    p_clock : process
    begin
        sclk <= not(sclk);
        wait for CLK_PERIOD/2;
    end process;

end architecture;