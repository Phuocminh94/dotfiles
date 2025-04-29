" auto-install vim-plug
if empty(glob($HOME . '\AppData\Local\nvim-data\site\autoload\plug.vim'))
    call system('powershell -Command "iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni \"$env:LOCALAPPDATA\nvim-data\site\autoload\plug.vim\" -Force"')
endif

call plug#begin($HOME . '\AppData\Local\nvim-data\site\autoload\plugged')

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'iruzo/matrix-nvim'
Plug 'junegunn/vim-easy-align'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'lervag/vimtex', { 'tag': 'v2.15' }
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

call plug#end()
