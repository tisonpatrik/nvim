return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"bash",
				"c",
				"vim",
				"vimdoc",
				"lua",
				"luadoc",
				"markdown",
				"toml",
				"yaml",
				"make",
				"go",
				"gomod",
				"gosum",
				"gotmpl",
				"gowork",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
