---@type LazySpec
return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    local astrocore = require "astrocore"

    local mk_formatters_by_ft = function(ft, formatters)
      if type(ft) == "table" then
        local _formatters = {}
        for _, f in pairs(ft) do
          _formatters[f] = formatters
        end
        return _formatters
      end
      return { [ft] = formatters }
    end

    local formatters_by_ft = {
      lua = { "stylua" },
      go = { "gofmt" },
      nix = { "alejandra" },
    }

    local web_ft = {
      "html",
      "css",
      "scss",
      "json",
      "yaml",
      "markdown",
      "javascript",
      "typescript",
    }

    astrocore.extend_tbl(
      formatters_by_ft,
      mk_formatters_by_ft(web_ft, { "deno_fmt", "prettierd", stop_after_first = true })
    )

    require("conform").setup {
      formatters_by_ft = formatters_by_ft,
    }
  end,
}
