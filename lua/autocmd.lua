local function augroup(name)
  return vim.api.nvim_create_augroup("maxVim_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Open Neotree automatically on start-up:
vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Open Neotree automatically",
  group = augroup("neotree_default"),
  callback = function()
    vim.cmd(":Neotree toggle")
  end,
})

-- Format files before save:
-- This one works good, but currently using autocmd for autoformatting in none-ls.lua file
--vim.api.nvim_create_autocmd("BufWritePre", {
--  desc = "Format files before save",
--  group = augroup("formatting_on_save"),
--  callback = function()
--    vim.lsp.buf.format()
--  end,
--})

-- Yank to Clipboard:
vim.api.nvim_set_option("clipboard", "unnamed")
