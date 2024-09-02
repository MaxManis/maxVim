-- Run eslint --fix on current file:
vim.api.nvim_create_user_command("EslintFix", function()
  vim.cmd(":! npx eslint % --fix")
end, {})

-- Get Git status command result right in your MaxVim:
vim.api.nvim_create_user_command("GitStatus", function()
  vim.cmd(":terminal git status | view -")
end, {})

-- Get Git diff command result right in your MaxVim:
vim.api.nvim_create_user_command("GitDiff", function()
  vim.cmd(":terminal git diff | view -")
end, {})

-- Show the location of currently opened file:
vim.api.nvim_create_user_command("FilePwd", function()
  vim.cmd(":! echo %")
end, {})
