local map = function(mode, lhs, rhs, opts)
    local options = { silent = true, noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map({ "n", "i" }, "<C-s>", ":w<CR>", { desc = "Save File" })
map("n", "<leader>c", ":bd<CR>", { desc = "Close buffer" })
map("n", "]b", ":bnext<CR>", { desc = "Next buffer" })
map("n", "[b", ":bprevious<CR>", { desc = "Previous buffer" })

return {
    map = map,
}
