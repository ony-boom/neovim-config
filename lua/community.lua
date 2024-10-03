---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  {
    import = "astrocommunity.colorscheme.everforest",
    config = function()
      vim.g.everforest_better_performance = 1
      -- vim.g.everforest_transparent_background = 1
    end,
  },
}
