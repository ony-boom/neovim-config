local keymaps = require "config.keymaps"

local function on_attach(client, bufnr)
  local mappings = {
    {
      "<leader>la",
      vim.lsp.buf.code_action,
      desc = "Code Action",
      mode = { "n", "v" },
      has = "textDocument/codeAction",
    },
    {
      "<leader>lr",
      vim.lsp.buf.rename,
      desc = "Rename",
      has = "textDocument/rename",
    },
    { "K", vim.lsp.buf.hover, desc = "Hover", has = "textDocument/hover" },
    {
      "gd",
      function() Snacks.picker.lsp_definitions() end,
      desc = "Definition",
      has = "textDocument/definition",
    },
    {
      "gD",
      function() Snacks.picker.lsp_declarations() end,
      desc = "Definition",
      has = "textDocument/declaration",
    },
    {
      "gr",
      function() Snacks.picker.lsp_references() end,
      desc = "References",
      has = "textDocument/references",
    },
    {
      "gI",
      function() Snacks.picker.lsp_references() end,
      desc = "Go to implementations",
      has = "extDocument/implementation",
    },
    {
      "gy",
      function() Snacks.picker.lsp_type_definitions() end,
      desc = "Go to t[y]pe definitions",
      has = "textDocument/typeDefinition",
    },
  }

  for _, map in ipairs(mappings) do
    if not map.has or client.supports_method(map.has) then
      local modes = type(map.mode) == "table" and map.mode or { map.mode or "n" }
      for _, mode in ipairs(modes) do
        keymaps.map(mode, map[1], map[2], {
          buffer = bufnr,
          desc = map.desc,
          silent = map.silent ~= false,
        })
      end
    end
  end
end

return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },

  opts = {
    servers = {
      lua_ls = {},
      nil_ls = {},
      ts_ls = {},
      rust_analyzer = {},
    },
  },

  config = function(_, opts)
    local lspconfig = require "lspconfig"
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    for server, server_opts in pairs(opts.servers) do
      lspconfig[server].setup(vim.tbl_deep_extend("force", {
        capabilities = capabilities,
        on_attach = on_attach,
      }, server_opts))
    end

    keymaps.map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line diagnostic" })
  end,
}
