{pkgs, ...}: {
  # ┳┓┓┏┏┓┓┏┏┓┳┓
  # ┃┃┃┃┃ ┣┫┣┫┃┃
  # ┛┗┗┛┗┛┛┗┛┗┻┛

  # NvChad is a Neovim configuration framework

  programs.nvchad = {
    enable = true;
    extraPackages = with pkgs; [
      cargo
      rustc
      rust-analyzer
      nixd
      alejandra
      stylua
      shfmt
    ];
    hm-activation = false;
  };

  xdg.configFile."nvim/init.lua".force = true;
  xdg.configFile."nvim/init.lua".source = ./init.lua;

  xdg.configFile."nvim/lua/chadrc.lua".force = true;
  xdg.configFile."nvim/lua/chadrc.lua".source = ./chadrc.lua;

  xdg.configFile."nvim/lua/plugins/init.lua".force = true;
  xdg.configFile."nvim/lua/plugins/init.lua".source = ./plugins.lua;

  xdg.configFile."nvim/lua/configs/lspconfig.lua".force = true;
  xdg.configFile."nvim/lua/configs/lspconfig.lua".source = ./lspconfig.lua;

  xdg.configFile."nvim/after".force = true;
  xdg.configFile."nvim/after".source = ./after;
}
