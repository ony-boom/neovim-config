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

  lsp = with pkgs; [
    gopls
    nil # nix
    lua-language-server # lua

    elmPackages.elm-language-server

    typescript
    emmet-language-server
    typescript-language-server
    tailwindcss-language-server
    vscode-langservers-extracted
    nodePackages.svelte-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages."@astrojs/language-server"
  ];
in {
  # Mason replacement
  config = lib.mkIf config.programs.neovim.enable {
    home.packages =
      lsp
      ++ formatters
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
