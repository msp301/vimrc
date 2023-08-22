"------Plugin Settings------
call plug#begin()

Plug 'majutsushi/Tagbar'
Plug 'bitc/vim-bad-whitespace'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'kingbin/vim-arduino'
Plug 'lewis6991/gitsigns.nvim', { 'branch': 'main' }
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'rust-lang/rust.vim'
Plug 'chentoast/marks.nvim'

" Colorscheme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Code completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip', { 'branch': 'main' }

" telescope fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }

" LSP management and syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'williamboman/mason.nvim', { 'branch': 'main' }
Plug 'williamboman/mason-lspconfig.nvim', { 'branch': 'main' }
Plug 'neovim/nvim-lspconfig'

" Lualine status bar
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'

call plug#end()

set nocompatible

filetype plugin indent on

"------General Settings------
syntax on
set encoding=utf-8
set number
set relativenumber
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set smarttab
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

require("mason-lspconfig").setup_handlers {
    function (server_name) -- default handler
        require("lspconfig")[server_name].setup {}
    end,
}
END

" Marks Setup Settings
lua << END
require('marks').setup()
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

" gitsigns Settings
lua <<END
require('gitsigns').setup {
    current_line_blame = true,
}
END

" Tagbar Plugin Settings
let g:tagbar_updateonsave_maxlines = 5000

" Code Completion Plugin Settings
lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<TAB>'] = cmp.mapping.select_next_item(),
      ['<S-TAB>'] = cmp.mapping.select_prev_item(),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig').rust_analyzer.setup {
    capabilities = capabilities
  }
EOF

" Telescope Plugin Settings
nnoremap <C-P> :Telescope find_files<CR>
nnoremap <C-F> :Telescope live_grep<CR>
nnoremap <C-G> :Telescope git_branches<CR>

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

" Keep cursor centered when paging up/down
nnoremap <C-u> <C-u>zz<CR>
nnoremap <C-d> <C-d>zz<CR>

" Indent/Unindent
noremap <S-Tab> <<
inoremap <S-Tab> <ESC><<i
