local h = require "null-ls.helpers"
local methods = require "null-ls.methods"

local function make_deno_fmt()
  local FORMATTING = methods.internal.FORMATTING

  local extensions = {
    javascript = "js",
    javascriptreact = "jsx",
    json = "json",
    jsonc = "jsonc",
    markdown = "md",
    typescript = "ts",
    typescriptreact = "tsx",
  }

  return h.make_builtin {
    name = "deno_fmt",
    meta = {
      url = "https://docs.deno.com/runtime/reference/cli/formatter/",
      description = "Use [Deno](https://deno.land/) to format TypeScript, JavaScript/JSON and markdown.",
    },
    method = FORMATTING,
    filetypes = vim.tbl_values(extensions),
    generator_opts = {
      command = "deno",
      args = function(params) return { "fmt", "-", "--ext", extensions[params.ft] } end,
      to_stdin = true,
    },
    factory = h.formatter_factory,
  }
end

---@type LazySpec
return {
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local null_ls = require "null-ls"

      local has_deno_config = function(utils) return utils.root_has_file { "deno.json", "deno.jsonc" } end

      local has_prettier_config = function(utils)
        return utils.root_has_file {
          "package.json",
          "prettier.config.js",
          ".prettierrc",
          "prettier.config.js"
        }
      end

      opts.sources = require("astrocore").list_insert_unique(opts.sources, {
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier.with {
          condition = function(utils) return not has_deno_config(utils) and has_prettier_config(utils) end,
        },
        null_ls.builtins.formatting.alejandra,
        make_deno_fmt().with {
          condition = function(utils) return not has_prettier_config(utils) end,
        },
      })
    end,
  },
}
