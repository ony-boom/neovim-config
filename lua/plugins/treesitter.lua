---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {},
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "javascript",
    },
    auto_install = true,
  },
}
