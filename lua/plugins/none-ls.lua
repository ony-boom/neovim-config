-- Customize None-ls sources
---@type LazySpec
return {
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      -- opts variable is the default configuration table for the setup function call
      local null_ls = require "null-ls"
      local h = require "null-ls.helpers"
      local u = require "null-ls.utils"

      -- Check supported formatters and linters
      -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

      -- Only insert new sources, do not replace the existing ones
      -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
      --

      local deno_fmt = h.make_builtin {
        name = "deno_fmt",
        method = null_ls.methods.FORMATTING,
        factory = h.formatter_factory,
        genrator_opts = {
          command = "deno",
          args = { "fmt", "--quiet", "$FILENAME" },
          from_temp_file = true,
          to_temp_file = true,
        },
        filetypes = {
          "typescript",
          "typescriptreact",
          "javascript",
          "javascriptreact",
          "json",
          "jsonc",
          "html",
          "css",
        },
        meta = {
          url = "https://deno.com",
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
