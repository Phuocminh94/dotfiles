" boostrap
call system("powershell -ExecutionPolicy Bypass -File boostrap.ps1")

" options
set clipboard=unnamedplus
set colorcolumn=80
set cursorline
set cursorlineopt=number
set expandtab
set fillchars=eob:\ 
set mouse=a
set noswapfile
set number
set relativenumber
set shiftwidth=4
set splitright
set tabstop=4
set textwidth=80

" plugins
source $HOME/dotfiles/nvim/plugins.vim

" keymaps
source $HOME/dotfiles/nvim/keymaps.vim

" my colorscheme
colorscheme neovim

" lua config
lua require('autocmd')
lua require('lsp_config')
lua require('luasnip.loaders.from_lua').lazy_load({paths = '~/dotfiles/nvim/lua/snippets/'})
lua require('luasnip.loaders.from_lua').load()
lua require('luasnip.loaders.from_vscode').lazy_load()
lua require('mkdp')
lua require('statusline')
lua require('terminal')
lua require('tls')
lua require('vimtex')
lua require('gsigns')
