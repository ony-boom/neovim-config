return {
  "nvim-lualine/lualine.nvim",

  config = function()
    require("lualine").setup {
      options = {
        component_separators = "",
        section_separators = { right = "", left = "" },
      },

      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "filetype" },
        lualine_y = { "lsp_status" },
        lualine_z = { "location" },
      },
    }
  end,
}
