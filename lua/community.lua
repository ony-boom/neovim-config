---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  {
    import = "astrocommunity.colorscheme.everforest",
    config = function()
      vim.g.everforest_better_performance = 1
      vim.g.everforest_transparent_background = 2

      local winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:TelescopeSelection,Search:None"
      require("cmp").setup {
        window = {
          completion = {
            winhighlight = winhighlight,
          },
          documentation = {
            winhighlight = winhighlight,
          },
        },
      }
    end,
  },
}
