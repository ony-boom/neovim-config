local theme = require("config.themes")

vim.cmd("colorscheme " .. theme.get_default())
