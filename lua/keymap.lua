local map = vim.keymap.set

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })

-- Resize window using <Shift> + arrow keys
map("n", "<S-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- diagnostic
local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- Toggle Neotree (file system):
map("n", "<leader>fs", ":Neotree toggle <CR>", { desc = "Tootle Neotree file-system" })

-- Toggle Git Blame:
map("n", "<leader>b", ":ToggleBlameLine<CR>", { desc = "Tootle Git Blame" })

-- Oil.nvim (edit file structure like a normal buffer)
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- quit (close all)
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Move cursor faster with Tab:
map("n", "<Tab>h", "hhhhh", { desc = "Go Left 5 times" })
map("n", "<Tab>j", "jjjjj", { desc = "Go Lower 5 times" })
map("n", "<Tab>k", "kkkkk", { desc = "Go Upper 5 times" })
map("n", "<Tab>l", "lllll", { desc = "Go Right 5 times" })
