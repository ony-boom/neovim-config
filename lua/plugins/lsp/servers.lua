return {
  lua_ls = {},
  nil_ls = {},
  rust_analyzer = {},
  gopls = {},

  ts_ls = function()
    return {
      root_dir = require("lspconfig").util.root_pattern { "package.json", "tsconfig.json" },
      single_file_support = false,
      settings = {},
    }
  end,

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
}
