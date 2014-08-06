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
" TA:  2012-12-20:  Use "xterm2" ttymouse settings so that tmux can
" pass-through the escape sequences to Vim to enable pane selection, etc.
set ttymouse=xterm2
set spelllang=en_gb

set backupdir=~/.vim-backupsdir
set dir=~/.vim-swapdir

"------Theme Settings------
set background=dark
set t_Co=256
colorscheme elflord

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

"------Search Settings------
set smartindent
set incsearch
set ignorecase
set smartcase

"------Keyboard Shortcuts------
nmap <F5> :NERDTreeToggle<CR>
nmap <F6> :TagbarToggle<CR>
nmap <C-T> :tabedit<CR>
"nmap <C-W> :tabclose<CR>
nmap <S-Tab> <<
"imap <S-Tab> <ESC><i

"------Syntax Languages------
"au BufNewFile,BufRead *.tt call s:AdjustTT2Type()

"func! s:AdjustTT2Type()
"	if ( ( getline(1) . getline(2) . getline(3) =~ '<\chtml'
"			&& getline(1) . getline(2) . getline(3) !~ '<[%?]' )
"			|| getline(1) =~ '<!DOCTYPE HTML' )
"		setf tt2html
"	else
"		setf tt2
"	endif
"endfunc

"------Vundle Settings------
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"let Vundle manage itself
Bundle 'gmarik/vundle'

" My Bundles here:
"
" vim-scripts repos
Bundle 'comments.vim'
Bundle 'Tagbar'
Bundle 'bad-whitespace'
Bundle 'surround.vim'
Bundle 'Valloric/YouCompleteMe'
"
" Git repos
Bundle 'https://github.com/scrooloose/nerdtree.git'
Bundle 'https://github.com/kingbin/vim-arduino.git'
Bundle 'https://github.com/chrisbra/changesPlugin.git'
Bundle 'https://github.com/bling/vim-airline.git'
Bundle 'https://github.com/tpope/vim-fugitive.git'
Bundle 'https://github.com/terryma/vim-multiple-cursors.git'

filetype plugin indent on
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

