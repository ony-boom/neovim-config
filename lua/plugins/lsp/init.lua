local keymaps = require "config.keymaps"
local on_attach = require "plugins.lsp.on_attach"
local servers = require "plugins.lsp.servers"

--- @type LazySpec
return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp", "b0o/schemastore.nvim" },

  opts = {
    servers = servers,
  },

  config = function(_, opts)
    local lspconfig = require "lspconfig"
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    for name, server_opts in pairs(opts.servers) do
      local config = type(server_opts) == "function" and server_opts() or server_opts

      local server_on_attach = config.on_attach
      config.on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        if server_on_attach then server_on_attach(client, bufnr) end
      end

      lspconfig[name].setup(vim.tbl_deep_extend("force", {
        capabilities = capabilities,
      }, config))
    end

    keymaps.map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line diagnostic" })
  end,
}
