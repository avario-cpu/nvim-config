return {
	{
		"folke/noice.nvim",
		version = "v4.4.7", -- Downgrade to version 4.4.7
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({})
		end,
	},
}
