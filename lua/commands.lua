vim.api.nvim_create_user_command("EslintFix", function()
	-- Run eslint --fix on current file:
	vim.cmd(":! npx eslint % --fix")
end, {})
