-- General Settings

vim.g.have_nerd_font = true

local opt = vim.opt

opt.number = true
opt.relativenumber = true

local indent = 4
opt.tabstop = indent
opt.shiftwidth = indent
opt.expandtab = true
opt.autoindent = true
opt.breakindent = true
opt.smartindent = true
opt.smarttab = true

opt.wildmenu = true
opt.wildmode = "list:longest,full"
opt.mouse = "a"
opt.laststatus = 2
opt.signcolumn = "yes"
opt.showmatch = true
opt.showmode = false
opt.spelllang = "en_gb"
opt.updatetime = 250
opt.timeoutlen = 300

opt.list = true
opt.listchars = { tab = "→ " }

-- Preview substitutions as you type
opt.inccommand = "split"

opt.splitright = true
opt.splitbelow = true

opt.scrolloff = 8

-- Provide access to system clipboard
opt.clipboard = "unnamedplus"

opt.backupdir = { vim.fn.expand("~/.vim-backupsdir") }
opt.dir = { vim.fn.expand("~/.vim-swapdir") }

-- Search Settings
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
