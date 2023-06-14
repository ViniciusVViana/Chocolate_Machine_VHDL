library ieee;
use ieee.std_logic_1164.all;
entity bloco_reg is
    port(
        clk   : in  std_logic;
        reset : in  std_logic;
        c_in  : in  std_logic_vector(2 downto 0);
        c_out : out std_logic_vector(2 downto 0);
    );
end entity;
architecture Reg of bloco_reg is
    component FFD is
        port(
        d      : in std_logic;
        clock  : in std_logic;
        pr, cl : in std_logic;
        q, nq  : out std_logic
        );
    end component;
    signal pr_aux: std_logic = '1';
begin 
    u_ffd1 : FFD port map(c_in(0),clk,pr_aux,reset,c_out(0));
    u_ffd2 : FFD port map(c_in(1),clk,pr_aux,reset,c_out(1));
    u_ffd3 : FFD port map(c_in(2),clk,pr_aux,reset,c_out(2));
end architecture;