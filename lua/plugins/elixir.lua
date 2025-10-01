return {
  -- LSP & Elixir tooling (Next LS / ElixirLS)
  {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local elixir = require("elixir")
      local elixirls = require("elixir.elixirls")

      elixir.setup({
        -- Enable Next LS (fast modern LS). If you don't have it, plugin can use ElixirLS.
        -- Next LS can be installed via Mason: :MasonInstall nextls
        -- (or let elixir-tools download binary itself)
        nextls = { enable = true },

        -- Fallback to ElixirLS (keep enabled for compatibility and DAP)
        elixirls = {
          enable = true,
          settings = elixirls.settings({
            dialyzerEnabled = false,
            fetchDeps = false,
            enableTestLenses = false,
            suggestSpecs = false,
          }),
          on_attach = function(client, bufnr)
            local map = function(mode, lhs, rhs)
              vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true })
            end
            map("n", "<leader>fp", ":ElixirFromPipe<CR>")
            map("n", "<leader>tp", ":ElixirToPipe<CR>")
            map("v", "<leader>em", ":ElixirExpandMacro<CR>")
          end,
        },
      })
    end,
  },
}
