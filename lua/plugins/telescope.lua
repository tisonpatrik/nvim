return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>fd', builtin.find_files, {})
      vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>en', function()
        require ('telescope.builtin').find_files{
          cwd = vim.fn.stdpath("config")
        }
      end)
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup ({
        extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
          }
        }
      }
    })
    require("telescope").load_extension("ui-select")
    end
  },
}
