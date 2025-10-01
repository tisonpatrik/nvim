return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
		formatters_by_ft = {
			lua = { "stylua" },
			c = { "clang_format" },
			go = { "gofumpt", "goimports-reviser", "golines" },
			elixir = { "mix" },
			heex = { "mix" },
			eelixir = { "mix" },
		},
			formatters = {
				["goimports-reviser"] = {
					prepend_args = { "-rm-unused" },
				},
				golines = {
					prepend_args = { "--max-len=80" },
				},
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
