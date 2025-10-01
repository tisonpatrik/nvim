return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()

		-- Configure clangd with default settings
		vim.lsp.config("clangd", {
			capabilities = capabilities,
		})
		vim.lsp.enable("clangd")

		-- Configure gopls with custom settings
		vim.lsp.config("gopls", {
			capabilities = capabilities,
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gotmpl", "gowork" },
			root_dir = vim.fs.dirname(vim.fs.find({ "go.work", "go.mod", ".git" }, { upward = true })[1]),
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
					},
					completeUnimported = true,
					usePlaceholders = true,
					staticcheck = true,
				},
			},
		})
		vim.lsp.enable("gopls")

		-- Configure lua_ls
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
		})
		vim.lsp.enable("lua_ls")

		-- LSP keymaps
		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})

		vim.keymap.set("n", "<leader>gdv", function()
			vim.cmd("rightbelow vsplit")
			vim.lsp.buf.definition()
		end, { desc = "Go to definition in right vertical split" })
	end,
}
