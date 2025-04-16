return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter.configs").setup({
            auto_install = true,
            ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html" },
        })
    end
}
