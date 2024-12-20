{self}: {
  pkgs,
  lib,
  config,
  ...
}: let
  formatters = with pkgs; [
    stylua # lua
    alejandra # nix
    shfmt # shell

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

    elmPackages.elm-language-server

    emmet-language-server
    nodePackages.typescript
    vscode-langservers-extracted
    nodePackages.svelte-language-server
    nodePackages.typescript-language-server
    nodePackages."@prisma/language-server"
    nodePackages."@tailwindcss/language-server"
  ];
in {
  # Mason replacement
  config = lib.mkIf config.programs.neovim.enable {
    home.packages =
      lsp
      ++ formatters
      ++ linters
      ++ [
        pkgs.tree-sitter
      ];
    xdg.configFile."nvim/init.lua".source = self + /init.lua;
    xdg.configFile."nvim/lua" = {
      source = self + /lua;
      recursive = true;
    };
  };
}
