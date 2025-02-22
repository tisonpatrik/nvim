return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
    lint.linters_by_ft = {
    }
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
