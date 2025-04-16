local options = {
    number = true,
    termguicolors = true,
    relativenumber = true,

    expandtab = true,
    shiftwidth = 2,
    tabstop = 2,
    smartindent = true,

    clipboard = "unnamedplus",
}

for key, value in pairs(options) do
    vim.opt[key] = value
end
