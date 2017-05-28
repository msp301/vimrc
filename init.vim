"------Plugin Settings------
call plug#begin()

Plug 'sudar/comments.vim'
Plug 'majutsushi/Tagbar'
Plug 'bitc/vim-bad-whitespace'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'kingbin/vim-arduino'
Plug 'chrisbra/changesPlugin'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }
autocmd! User YouCompleteMe if !has('vim_starting') | call youcompleteme#Enable() | endif

call plug#end()

set nocompatible

"------General Settings------
syntax on
set encoding=utf-8
set number
set tabstop=4
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
colorscheme elflord

" Omni-completion popup menu
highlight Pmenu ctermfg=black ctermbg=grey gui=bold
highlight PmenuSel ctermfg=white ctermbg=darkgrey gui=bold

"------Plugin Settings------

" Airline Status Bar Settings
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

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

" YouCompleteMe Plugin Settings
" Required for cooperation with Syntastic
let g:ycm_show_diagnostics_ui = 0

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

"------Keyboard Shortcuts------
nmap <F5> :NERDTreeToggle<CR>
nmap <F6> :TagbarToggle<CR>
nmap <C-T> :tabedit<CR>
nmap <S-Tab> <<
