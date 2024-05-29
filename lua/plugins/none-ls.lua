return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- Lua:
        null_ls.builtins.formatting.stylua,
        -- Python:
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        -- JavaScript:
        require("none-ls.diagnostics.eslint_d"), -- requires none-ls-extras.nvim
        null_ls.builtins.formatting.prettier,
        -- NOTE: i found that you also could use 'prettierd' instead of 'prettier',
        -- BUT 'prettierd' have some limitation in autoformatting, like replasing quotes '->" etc.

        -- null_ls.builtins.completion.spell,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
              -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
              -- vim.lsp.buf.formatting_sync()
              vim.lsp.buf.format({ async = false })
            end,
          })
        else
          vim.lsp.buf.format()
        end
      end,
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format file" })
  end,
}
