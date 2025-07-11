return {
	"MaxManis/ollpilot",
	config = function()
		require("ollpilot-nvim").setup()
	end,
	keys = {
		{ "<leader>oo", "<cmd>Ollpilot<cr>", desc = "Open Ollpilot" },
		{ "<leader>os", "<cmd>OllpilotSuggest<cr>", desc = "Line suggestion" },
	},
	cmd = {
		"Ollpilot",
		"OllpilotSuggest",
	},
}
