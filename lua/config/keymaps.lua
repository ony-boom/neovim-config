local map = function(mode, lhs, rhs, opts)
	local options = { silent = true, noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map({ "n", "i" }, "<C-s>", ":w<CR>", { desc = "Save File" })

return {
	map = map,
}
