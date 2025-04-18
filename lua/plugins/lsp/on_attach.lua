local keymaps = require "config.keymaps"

local function on_attach(client, bufnr)
  local picker = Snacks.picker

  local mappings = {
    {
      mode = { "n", "v" },
      lhs = "<leader>la",
      rhs = vim.lsp.buf.code_action,
      desc = "Code Action",
      method = "textDocument/codeAction",
    },
    {
      mode = "n",
      lhs = "<leader>lr",
      rhs = vim.lsp.buf.rename,
      desc = "Rename",
      method = "textDocument/rename",
    },
    {
      mode = "n",
      lhs = "K",
      rhs = vim.lsp.buf.hover,
      desc = "Hover",
      method = "textDocument/hover",
    },
    {
      mode = "n",
      lhs = "gd",
      rhs = picker.lsp_definitions,
      desc = "Go to Definition",
      method = "textDocument/definition",
    },
    {
      mode = "n",
      lhs = "gD",
      rhs = picker.lsp_declarations,
      desc = "Go to Declaration",
      method = "textDocument/declaration",
    },
    {
      mode = "n",
      lhs = "gr",
      rhs = picker.lsp_references,
      desc = "References",
      method = "textDocument/references",
    },
    {
      mode = "n",
      lhs = "gI",
      rhs = picker.lsp_references,
      desc = "Implementations",
      method = "textDocument/implementation",
    },
    {
      mode = "n",
      lhs = "gy",
      rhs = picker.lsp_type_definitions,
      desc = "Type Definitions",
      method = "textDocument/typeDefinition",
    },
  }

  for _, map in ipairs(mappings) do
    if not map.method or client.supports_method(map.method) then
      keymaps.map(map.mode, map.lhs, map.rhs, {
        buffer = bufnr,
        desc = map.desc,
        silent = true,
      })
    end
  end
end

return on_attach
