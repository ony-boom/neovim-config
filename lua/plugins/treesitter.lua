return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter.configs").setup {
      sync_install = false,

      modules = {},

      auto_install = true,
      ignore_install = {},
      ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html" },

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    }
  end,
}
