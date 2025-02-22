return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local lspconfig = require("lspconfig")

		lspconfig.clangd.setup({
			capabilities = capabilities,
		})

		lspconfig.lua_ls.setup({})

		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.code_action, {})
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})

		vim.keymap.set("n", "<leader>gdv", function()
			vim.cmd("rightbelow vsplit")
			vim.lsp.buf.definition()
		end, { desc = "Go to definition in right vertical split" })
	end,
}
