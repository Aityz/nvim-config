return {
	require("aityz.plugins.lsp"),
	require("aityz.plugins.theme"),
	require("aityz.plugins.treesitter"),
	require("aityz.plugins.fmt"),
	require("aityz.plugins.telescope"),
	require("aityz.plugins.copilot"),
	require("aityz.plugins.lualine"),
	require("aityz.plugins.btw"),
	{
		"Aityz/cratesearch.nvim",
		config = function()
			require("cratesearch").setup({})
		end,
	},
}
