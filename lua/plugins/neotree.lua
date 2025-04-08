return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.sources = { "filesystem" }
    opts.source_selector.content_layout = "start"
  end,
}
