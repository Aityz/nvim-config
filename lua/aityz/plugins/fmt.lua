return {
	{
		event = "BufReadPre",

		"stevearc/conform.nvim",

		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					rust = { "rustfmt" },
					python = { "black" },
					go = { "gofmt" },

					javascript = { "prettier" },
					typescript = { "prettier" },

					c = { "clang-format" },
					cpp = { "clang-format" },

					json = { "prettier" },

					html = { "prettier" },
					css = { "prettier" },
				},
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.bufnr })
				end,
			})
		end,
	},
}
