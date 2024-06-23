return {
	{
		"daschw/leaf.nvim",

		config = function()
			require("leaf").setup({
				transparent = true,
			})

			vim.cmd("colorscheme leaf") -- should be fast
		end,
	},
}
