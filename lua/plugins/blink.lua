return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets", "fang2hou/blink-copilot" },

  version = "1.*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      ["<CR>"] = { "accept", "fallback" },
    },

    appearance = {
      nerd_font_variant = "mono",
    },

    completion = {
      menu = { border = "rounded" },
      documentation = {
        auto_show = false,
        window = { border = "rounded" },
      },
    },

    signature = { window = { border = "rounded" } },

    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer", "copilot" },
      per_filetype = {
        codecompanion = { "codecompanion" },
      },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          score_offset = 100,
          async = true,
        },
      },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
