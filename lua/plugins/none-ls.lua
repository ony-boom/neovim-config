-- Customize None-ls sources
---@type LazySpec
return {
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      -- opts variable is the default configuration table for the setup function call
      local null_ls = require "null-ls"

      -- Check supported formatters and linters
      -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

      -- Only insert new sources, do not replace the existing ones
      -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
      --

      local deno_fmt = {
        name = "deno_fmt",
        method = null_ls.methods.FORMATTING,
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "json", "jsonc" },
        generator = null_ls.formatter {
          name = "deno_fmt",
          command = "deno",
          args = { "fmt", "$FILENAME", "--stdin" },
          to_stdin = true,
        },
      }
      opts.sources = require("astrocore").list_insert_unique(opts.sources, {
        -- Set a formatter
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.alejandra,
        deno_fmt,
        -- null_ls.builtins.formatting.deno_fmt,
      })
    end,
  },
}
