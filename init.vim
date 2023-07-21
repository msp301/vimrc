"------Plugin Settings------
call plug#begin()

Plug 'majutsushi/Tagbar'
Plug 'bitc/vim-bad-whitespace'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'kingbin/vim-arduino'
Plug 'chrisbra/changesPlugin'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'

" Colorscheme
Plug 'folke/tokyonight.nvim'

" Code completion
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" telescope fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }

" LSP management and syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

" Lualine status bar
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'

call plug#end()

set nocompatible

"------General Settings------
syntax on
set encoding=utf-8
set number
set relativenumber
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set wildmenu
set mouse=a
set wildmode=list:longest,full
set laststatus=2
set showmatch
set list
set listchars=tab:→\ ,
set spelllang=en_gb
" Provide access to system clipboard
set clipboard+=unnamedplus

set backupdir=~/.vim-backupsdir
set dir=~/.vim-swapdir

"------Theme Settings------
set background=dark
set t_Co=256

" Tokyonight theme settings
lua << END
require("tokyonight").setup({
  style = "night",
  on_highlights = function(highlights, colors)
      highlights.LineNr = { fg = colors.orange }
  end,
})
END

colorscheme tokyonight

" Omni-completion popup menu
highlight Pmenu ctermfg=black ctermbg=grey gui=bold
highlight PmenuSel ctermfg=white ctermbg=darkgrey gui=bold

"------Plugin Settings------

" LSP Setup Settings
lua << END
require('mason').setup()
require('mason-lspconfig').setup {
    automatic_installation = true
}
END


" Airline Status Bar Settings
lua << END
require('lualine').setup {
	options = {
		component_separators = '',
		section_separators = { left = '', right = '' }
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = {
			{ 'branch', icon = '⎇ ' },
			'diff',
			'diagnostics',
		},
		lualine_c = { 'filename' },
		lualine_x = { 'encoding', 'fileformat', 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' },
	},
}
END

" changesPlugin Settings
let g:changes_vcs_check = 1
let g:changes_autocmd = 1
let g:changes_respect_SignColumn = 1
highlight SignColumn ctermbg=black
highlight ChangesSignTextAdd ctermbg=green ctermfg=lightgreen
highlight ChangesSignTextDel ctermbg=red ctermfg=lightred
highlight ChangesSignTextCh ctermbg=blue ctermfg=lightblue

" Tagbar Plugin Settings
let g:tagbar_updateonsave_maxlines = 5000

" COQ Completion Plugin Settings
let g:coq_settings = { 'auto_start': 'shut-up' }

" Telescope Plugin Settings
nnoremap <C-P> :Telescope find_files<CR>
nnoremap <C-F> :Telescope live_grep<CR>

" NERDCommenter Plugin Settings
let g:NERDSpaceDelims = 1
let g:NERDUsePlaceHolders = 0
let g:NERDCreateDefaultMappings = 0
noremap <silent> <C-C> :call nerdcommenter#Comment(0, 'Toggle')<CR>
vnoremap <silent> <C-C> :call nerdcommenter#Comment(0, 'Toggle')<CR>

" Syntastic Plugin Settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_balloons = 1
let g:syntastic_mode_map = {
	\ "mode" : "passive",
	\ "active_filetypes" : [],
	\ "passive_filetypes" : []
	\ }

" Syntastic - Perl Checker Settings
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = [ 'perl', 'podchecker' ]

"------Search Settings------
set smartindent
set incsearch
set ignorecase
set smartcase
set nohlsearch

"------Keyboard Shortcuts------
noremap <F5> :NERDTreeToggle<CR>
noremap <F6> :TagbarToggle<CR>
noremap <C-T> :tabedit<CR>

" Indent/Unindent
noremap <S-Tab> <<
inoremap <S-Tab> <ESC><<i
