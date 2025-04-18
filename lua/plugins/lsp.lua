local keymaps = require "config.keymaps"

local function on_attach(client, bufnr)
  local picker = Snacks.picker
  local map = function(mode, lhs, rhs, desc, method)
    if not method or client.supports_method(method) then
      keymaps.map(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
    end
  end

  map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, "Code Action", "textDocument/codeAction")
  map("n", "<leader>lr", vim.lsp.buf.rename, "Rename", "textDocument/rename")
  map("n", "K", vim.lsp.buf.hover, "Hover", "textDocument/hover")
  map("n", "gd", picker.lsp_definitions, "Definition", "textDocument/definition")
  map("n", "gD", picker.lsp_declarations, "Declaration", "textDocument/declaration")
  map("n", "gr", picker.lsp_references, "References", "textDocument/references")
  map("n", "gI", picker.lsp_references, "Go to implementations", "textDocument/implementation")
  map("n", "gy", picker.lsp_type_definitions, "Go to t[y]pe definitions", "textDocument/typeDefinition")
end

local extra_capabilities = vim.lsp.protocol.make_client_capabilities()
extra_capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp", "b0o/schemastore.nvim" },

  opts = {
    servers = {
      lua_ls = {},
      nil_ls = {},
      ts_ls = function()
        return {
          root_dir = require("lspconfig").util.root_pattern { "package.json", "tsconfig.json" },
          single_file_support = false,
          settings = {},
        }
      end,
      rust_analyzer = {},
      gopls = {},
      denols = function()
        return {
          root_dir = require("lspconfig").util.root_pattern { "deno.json", "deno.jsonc" },
          single_file_support = false,
          settings = {},
        }
      end,

      jsonls = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        return {
          capabilities = capabilities,
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        }
      end,
    },
  },

  config = function(_, opts)
    local lspconfig = require "lspconfig"
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    for name, server_opts in pairs(opts.servers) do
      local config = type(server_opts) == "function" and server_opts() or server_opts

      lspconfig[name].setup(vim.tbl_deep_extend("force", {
        capabilities = capabilities,
        on_attach = on_attach,
      }, config))
    end

    keymaps.map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line diagnostic" })
  end,
}
