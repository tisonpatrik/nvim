return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				automatic_installation = false,
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "clangd", "lua_ls" },
			})
		end,
	},
	{
		"zapling/mason-conform.nvim",
		config = function()
			require("mason-conform").setup({
				automatic_installation = false,
			})
		end,
	},
	{
		"rshkarin/mason-nvim-lint",
		dependencies = { "mfussenegger/nvim-lint" },
		config = function()
			local lint = package.loaded["lint"]

			-- List of linters to ignore during install
			local ignore_install = {}

			-- Helper function to find if value is in table.
			local function table_contains(tbl, value)
				for _, v in ipairs(tbl) do
					if v == value then
						return true
					end
				end
				return false
			end

			-- Build a list of linters to install minus the ignored list.
			local all_linters = {}
			for _, v in pairs(lint.linters_by_ft) do
				for _, linter in ipairs(v) do
					if not table_contains(ignore_install, linter) then
						table.insert(all_linters, linter)
					end
				end
			end

			require("mason-nvim-lint").setup({
				ensure_installed = all_linters,
				automatic_installation = false,
			})
		end,
	},
}
