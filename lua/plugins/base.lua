--- @type LazySpec
return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        "lazy.nvim",
        "luvit-meta/library", -- see below
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function() require("which-key").show { global = false } end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = true,
    },
    {
      "kevinhwang91/nvim-ufo",
      dependencies = {
        { "kevinhwang91/promise-async" },
      },

      config = function()
        require("ufo").setup {
          provider_selector = function() return { "treesitter", "indent" } end,
        }
      end,
    },
    {
      "lewis6991/gitsigns.nvim",
      config = function() require("gitsigns").setup() end,
    },
  },
}
