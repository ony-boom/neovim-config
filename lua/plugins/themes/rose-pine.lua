---@type LazySpec
return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require("rose-pine").setup {
      variant = "main",
      dark_variant = "main",
    }
  end,
}
