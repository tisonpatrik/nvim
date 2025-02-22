return {
  "Diogo-ss/42-C-Formatter.nvim",
  cmd = "CFormat42",
  config = function()
    local formatter = require("42-formatter")
    formatter.setup({
      formatter = 'c_formatter_42',
      filetypes = { c = true, h = true, cpp = true, hpp = true },
    })

    vim.api.nvim_set_keymap('n', '<F2>', ':CFormat42<CR>', { noremap = true, silent = true })
  end
}

