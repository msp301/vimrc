-- General Settings

local opt = vim.opt

opt.number         = true
opt.relativenumber = true

local indent       = 4
opt.tabstop        = indent
opt.shiftwidth     = indent
opt.expandtab      = true
opt.autoindent     = true
opt.smartindent    = true
opt.smarttab       = true

opt.wildmenu       = true
opt.wildmode       = "list:longest,full"
opt.mouse          = "a"
opt.laststatus     = 2
opt.showmatch      = true
opt.list           = true
opt.listchars      = "tab:→ ,"
opt.spelllang      = "en_gb"

-- Provide access to system clipboard
opt.clipboard      = "unnamedplus"

opt.backupdir      = "~/.vim-backupsdir"
opt.dir            = "~/.vim-swapdir"

-- Search Settings
opt.incsearch      = true
opt.ignorecase     = true
opt.smartcase      = true
opt.hlsearch       = false

