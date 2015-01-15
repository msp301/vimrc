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
" Provide access to system clipboard
set clipboard=unnamedplus

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

" Tagbar Plugin Settings
let g:tagbar_updateonsave_maxlines = 5000

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
call vundle#begin()

"let Vundle manage itself
Plugin 'gmarik/vundle'

" My Plugins here:
"
" vim-scripts repos
Plugin 'comments.vim'
Plugin 'Tagbar'
Plugin 'bad-whitespace'
Plugin 'surround.vim'
Plugin 'Valloric/YouCompleteMe'
"
" Git repos
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/kingbin/vim-arduino.git'
Plugin 'https://github.com/chrisbra/changesPlugin.git'
Plugin 'https://github.com/bling/vim-airline.git'
Plugin 'https://github.com/tpope/vim-fugitive.git'
Plugin 'https://github.com/terryma/vim-multiple-cursors.git'

call vundle#end()
filetype plugin indent on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
