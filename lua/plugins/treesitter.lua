---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    { "nushell/tree-sitter-nu", build = ":TSUpdate nu" },
  },
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "javascript",
    },
    auto_install = true,
  },
}
