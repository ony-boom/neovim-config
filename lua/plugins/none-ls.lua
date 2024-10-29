local mkHandler = function(none_ls_item, conditionFn)
  local null_ls = require "null-ls"
  null_ls.register(none_ls_item.with {
    condition = conditionFn,
  })
end
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
  {
    "nvimtools/none-ls.nvim",
    opts = {
      handlers = {
        prettierd = mkHandler(require("null-ls").builtins.formatting.prettierd, function(utils)
          local prettierdConfigFiles = {
            ".prettierrc",
            ".prettierrc.js",
            ".prettierrc.json",
            "prettier.config.js",
          }

          for _, value in pairs(prettierdConfigFiles) do
            if utils.root_has_file(value) then return true end
          end

          return utils.root_has_file "package.json"
        end),
      },
    },
  },
}
