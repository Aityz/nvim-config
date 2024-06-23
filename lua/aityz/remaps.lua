-- all of my remaps lol
-- thanks for reading, have a nice day

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.inccommand = "split"

vim.o.termguicolors = true -- True color support

vim.opt.clipboard = "unnamedplus" -- Copy paste between vim and everything else

vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers

vim.opt.breakindent = true -- Indent wrapped line

vim.opt.smartindent = true -- Auto indent

vim.opt.tabstop = 4 -- Tab size
vim.opt.softtabstop = 4 -- Tab size
vim.opt.shiftwidth = 4 -- Tab size

vim.opt.expandtab = true -- Use spaces instead of tabs

vim.opt.autoindent = true -- Auto indent

vim.opt.smartcase = true -- Smart case
vim.opt.ignorecase = true -- Ignore case

vim.opt.showmode = false -- Don't show mode

vim.opt.showcmd = true -- Show command in status line

vim.opt.scrolloff = 5 -- Keep 5 lines above and below cursor

vim.opt.hlsearch = true -- Highlight search

vim.opt.incsearch = true -- Incremental search

vim.opt.undofile = true -- Save undo history

vim.opt.signcolumn = "yes" -- Always show sign column

vim.opt.timeoutlen = 250 -- Time to wait for a mapped sequence to complete
vim.opt.updatetime = 100 -- Time to wait for CursorHold event

vim.g.loaded_netrw = 0 -- Disable Netrw filetree
vim.g.loaded_netrwPlugin = 0 -- Disable Netrw filetree

local remaps = {
	{ "n", "<leader>q", ":qa!<CR>" },
	{ "n", "<leader>f", ":Telescope find_files<CR>" },
}

for i, remap in ipairs(remaps) do
	vim.keymap.set(remap[1], remap[2], remap[3], { noremap = true, silent = true })
end
