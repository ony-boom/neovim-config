return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.sources = {}
    opts.source_selector.content_layout = "start"
  end,
}
