-- contains all of my plugins for the Language Server Protocol and Autocompletion, including but not limited to: Code actions, diagnostics, formatting, and snippets.

return {
	{
		event = "BufReadPre", -- When a buffer is opened
		"hrsh7th/nvim-cmp", -- Autocompletion plugin
		dependencies = {
			-- Using the Language Server Protocol with Compe
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",

			-- General plugins, such as the buffer, path and command line
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",

			-- Lua Snippets
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",

			-- formatting
			"onsails/lspkind.nvim",
		},
		config = function()
			require("cmp").setup({
				enabled = function()
					-- disable completion in comments
					local context = require("cmp.config.context")
					-- keep command mode completion enabled when cursor is in a comment
					if vim.api.nvim_get_mode().mode == "c" then
						return true
					else
						return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
					end
				end,
				-- Specify that we are going to use the LuaSnip Snippet Engine
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},

				completion = {
					completeopt = "menu,menuone,noinsert",
				},

				-- Map the keys for the autocompletion
				mapping = require("cmp").mapping.preset.insert({
					["<Up>"] = require("cmp").mapping.select_prev_item(),
					["<Down>"] = require("cmp").mapping.select_next_item(),
					["<C-d>"] = require("cmp").mapping.scroll_docs(-4),
					["<C-u>"] = require("cmp").mapping.scroll_docs(4),
					["<C-Space>"] = require("cmp").mapping.complete(),
					["<C-e>"] = require("cmp").mapping.abort(),
					["<CR>"] = require("cmp").mapping.confirm({ select = true }),
				}),
				-- Decide on which sources we will need for the documentation
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				},
				formatting = {
					format = require("lspkind").cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
						show_labelDetails = true,
						before = function(entry, vim_item)
							return vim_item
						end,
						expand = true,
					}),
				},
			})
		end,
	},
	{
		event = "BufReadPre", -- When a buffer is opened
		"williamboman/mason.nvim", -- Package Manager for neovim
		dependencies = {
			-- LSP configuration settings
			"neovim/nvim-lspconfig",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason").setup({})
			require("mason-lspconfig").setup({})

			require("mason-lspconfig").setup_handlers({
				function(server_name) -- On server setup
					if server_name ~= "rust_analyzer" then
						require("lspconfig")[server_name].setup({})
					end
				end,
			})
		end,
	},
	-- Nicer UI for the LSP
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({
				ui = {
					code_action = "",
				},
			})

			vim.keymap.set("n", "ca", "<cmd>Lspsaga code_action<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "co", "<cmd>Lspsaga outline<CR>", { noremap = true, silent = true }) -- Code outline
			vim.keymap.set("n", "cr", "<cmd>Lspsaga rename<CR>", { noremap = true, silent = true }) -- Code Rename
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		event = "BufReadPre",
	},
}
