{self}: {
  pkgs,
  lib,
  config,
  ...
}: let
  formatters = with pkgs; [
    stylua # lua
    alejandra # nix

    # web stuff
    prettierd
    nodePackages.prettier
  ];

  linters = with pkgs; [
    nodePackages.eslint
  ];

  lsp = with pkgs; [
    gopls
    nil # nix
    lua-language-server # lua

    emmet-language-server
    nodePackages.typescript
    tailwindcss-language-server
    vscode-langservers-extracted
    nodePackages.svelte-language-server
    nodePackages.typescript-language-server
    nodePackages."@prisma/language-server"
  ];
in {
  # Mason replacement
  config = lib.mkIf config.programs.neovim.enable {
    home.packages = lsp ++ formatters ++ linters;
    xdg.configFile."nvim/init.lua".source = self + /init.lua;
    xdg.configFile."nvim/lua" = {
      source = self + /lua;
      recursive = true;
    };
  };
}
