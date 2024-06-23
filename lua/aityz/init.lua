-- Loads all of my other trash
-- Thanks for reading my configuration, have a great day!

-- loads the lazy.nvim package manager by the legendary folke

require("aityz.remaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("aityz.plugins"), -- returns a table
})

-- its done now

-- thanks for reading my configuration, have a great day!
