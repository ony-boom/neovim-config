local options = {
  number = true,
  termguicolors = true,
  relativenumber = true,

  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  smartindent = true,

  clipboard = "unnamedplus",

  foldenable = true,
  foldcolumn = "1",
  foldlevel = 99,
  foldlevelstart = 99,
  winborder = "rounded",
}

for key, value in pairs(options) do
  vim.opt[key] = value
end
