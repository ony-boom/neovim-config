return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  opts = {
    input = { enabled = true },
    words = { enabled = true },
    picker = { enabled = true },
    scope = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = {
      enabled = true,
      folds = {
        open = true,
      },
      git = {
        patterns = { "GitSign", "MiniDiffSign" },
      },
      refresh = 50,
    },
    explorer = { enabled = true, replace_netrw = true },
  },

  dependencies = {
    { "echasnovski/mini.icons", version = false },
  },

  keys = {
    {
      "<leader>ff",
      function() Snacks.picker.smart() end,
      desc = "Smart Find Files",
    },
    {
      "<leader>fb",
      function() Snacks.picker.buffers() end,
      desc = "Buffers",
    },
    {
      "<leader>fw",
      function() Snacks.picker.grep() end,
      desc = "Grep",
    },
    {
      "<leader>:",
      function() Snacks.picker.command_history() end,
      desc = "Command History",
    },
    {
      "<leader>n",
      function() Snacks.picker.notifications() end,
      desc = "Notification History",
    },
    {
      "<leader>e",
      function() Snacks.explorer() end,
      desc = "File Explorer",
    },
    {
      "<leader>dl",
      function() Snacks.picker.diagnostics() end,
      desc = "Diagnostics list",
    },
  },
}
