---@type LazySpec
return {
  {
    "williamboman/mason-lspconfig.nvim",
    enabled = false,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    enabled = false,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    enabled = false,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    enabled = false,
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "debugpy",
        "tree-sitter-cli",
      },
    },
  },
}
