local list = {
    catppuccin = "catppuccin",
}


local get_default_theme = function()
    return "catppuccin"
end

return { list = list, get_default = get_default_theme }
