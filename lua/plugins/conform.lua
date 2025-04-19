-- this is for formatting code
return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>lf",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			nix = { "alejandra" },
      go = { "gofumpt", "goimports" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
      rust = { "rustfmt" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = nil,
		-- Customize formatters
		formatters = {},
	},
}
