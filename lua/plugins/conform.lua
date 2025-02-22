return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
      },
      formatters = {
      },
     -- format_on_save = {
     --   timeout_ms = 500,
     --   lsp_fallback = true,
     -- },
    })
  end,
}

