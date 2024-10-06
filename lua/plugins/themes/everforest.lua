return {
  "sainnhe/everforest",
  config = function()
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
}
