local h = require "null-ls.helpers"
local methods = require "null-ls.methods"

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
  filetypes = {
    "javascript",
    "javascriptreact",
    "json",
    "jsonc",
    "markdown",
    "typescript",
    "typescriptreact",
  },
  generator_opts = {
    command = "deno",
    args = function(params) return { "fmt", "-", "--ext", extensions[params.ft] } end,
    to_stdin = true,
  },
  factory = h.formatter_factory,
}
