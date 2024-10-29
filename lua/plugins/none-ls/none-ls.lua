local deno_fmt = require "plugins.none-ls.deno"

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
      local has_deno_config = function(utils) return utils.root_has_file { "deno.json", "deno.jsonc" } end

      local has_prettier_config = function(utils)
        return utils.root_has_file { "package.json", "prettier.config.js", ".prettierrc", "pretter.config.js" }
      end
      opts.sources = require("astrocore").list_insert_unique(opts.sources, {
        -- Set a formatter
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd.with {
          condition = function(utils) return not has_deno_config(utils) end,
        },
        null_ls.builtins.formatting.alejandra,
        deno_fmt.with {
          condition = function(utils) return not has_prettier_config(utils) end,
        },
        -- null_ls.builtins.formatting.deno_fmt,
      })
    end,
  },
}
