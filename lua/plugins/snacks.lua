---@diagnostic disable: undefined-global

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  opts = {
    explorer = {
      replace_netrw = true,
    },
    statuscolumn = {},
    notifier = {},
  },

  keys = {
    {
      "<leader>ff",
      function() Snacks.picker.smart() end,
      desc = "Smart Find Files",
    },
    {
      "<leader>b",
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
  },
}
