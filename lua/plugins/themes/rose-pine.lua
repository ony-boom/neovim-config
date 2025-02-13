---@type LazySpec
return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require("rose-pine").setup {
      variant = "main",
      dark_variant = "main",

      styles = {
        transparency = true,
      },

      highlight_groups = {
        NotifyBackground = { bg = "base", fg = "text" },
      },
    }
  end,
}
