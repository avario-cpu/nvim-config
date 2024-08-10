return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ltex" }, -- Automatically install Lua and LTeX language servers
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Set up Lua Language Server
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }, -- Recognize `vim` as a global to avoid warnings
						},
					},
				},
			})

			-- Set up LTeX Language Server for grammar checking
			lspconfig.ltex.setup({
				capabilities = capabilities,
				settings = {
					ltex = {
						language = "en-US",
						additionalRules = {
							enablePickyRules = true,
						},
					},
				},
			})
		end,
	},
}
