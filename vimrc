set nocompatible

"------General Settings------
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
set listchars=tab:->
colorscheme elflord

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
Bundle 'SuperTab'
Bundle 'bad-whitespace'
"
" Git repos
Bundle 'https://github.com/scrooloose/nerdtree.git'

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

