return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local lspconfig = require("lspconfig")

		-- list of all servers configured.
		lspconfig.servers = {
			"lua_ls",
			"clangd",
			"gopls",
		}

		-- list of servers configured with default config.
		local default_servers = {
			"clangd",
		}

		-- lsps with default config
		for _, lsp in ipairs(default_servers) do
			lspconfig[lsp].setup({
				capabilities = capabilities,
			})
		end

		lspconfig.gopls.setup({
			capabilities = capabilities,
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gotmpl", "gowork" },
			root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
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
