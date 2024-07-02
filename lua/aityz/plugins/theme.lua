return {
	{
		"daschw/leaf.nvim",

		event = "BufRead", -- only start colorscheme on buffer read

		config = function()
			require("leaf").setup({
				transparent = true,
			})

			vim.cmd("colorscheme leaf") -- should be fast
		end,
	},
}
