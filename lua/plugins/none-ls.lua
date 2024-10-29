-- Customize None-ls sources
---@type LazySpec
return {
  {
    "nvimtools/none-ls.nvim",
    config = function()
      require("null-ls").setup {
        handlers = {},
      }
    end,
    opts = function(_, opts)
      -- opts variable is the default configuration table for the setup function call
      local null_ls = require "null-ls"
      local helpers = require "null-ls.helpers"

      -- Check supported formatters and linters
      -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

      -- Only insert new sources, do not replace the existing ones
      -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
      --

      local deno_fmt = helpers.make_builtin {
        factory = helpers.formatter_factory {
          command = "deno",
          args = { "fmt", "--quiet", "$FILENAME" },
          to_stdin = true,
        },
        filetypes = {
          "typescript",
          "typescriptreact",
          "javascript",
          "javascriptreact",
          "json",
          "jsonc",
          "html",
          "css"
        },
        meta = {
          url = "https://deno.com",
          notes = {},
          description = "Deno formatter",
        },
      }

      opts.sources = require("astrocore").list_insert_unique(opts.sources, {
        -- Set a formatter
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd.with {
          condition = function(utils)
            return utils.root_has_file { "package.json", "prettier.config.js", ".prettierrc", "pretter.config.js" }
          end,
        },
        null_ls.builtins.formatting.alejandra,
        deno_fmt.with {
          condition = function(utils) return utils.root_has_file { "deno.json", "deno.jsonc" } end,
        },
        -- null_ls.builtins.formatting.deno_fmt,
      })
    end,
  },
}
