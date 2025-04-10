return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup {
      flavour = "auto",
      background = {
        light = "latte",
        dark = "mocha",
      },

      -- term_colors = true,
      transparent_background = true,

      integrations = {
        notify = true,
        which_key = true,
      },
    }
  end,
}
