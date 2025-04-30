" boostrap
call system("powershell -ExecutionPolicy Bypass -File boostrap.ps1")

" options
set clipboard=unnamedplus
set colorcolumn=80
set cursorline
set cursorlineopt=number
set expandtab
set fillchars=eob:\ 
set laststatus=0
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

" colorscheme
colorscheme green-shades

if g:colors_name == 'green-shades'
    highlight CmpItemAbbr       guifg=#ffff00 guibg=NONE
    highlight CmpItemAbbrMatch  guifg=#ffff00 guibg=NONE
    highlight CmpItemKind       guifg=#00bab6 guibg=NONE
    highlight CursorLineNr      guifg=#8cf8f7 guibg=NONE
endif

" lua config
lua require('vimtex')
lua require('mkdp')
lua require('lsp_config')
lua require('signify')
lua require('luasnip.loaders.from_lua').load()
lua require('luasnip.loaders.from_lua').lazy_load({paths = '~/dotfiles/nvim/lua/snippets/'})
lua require('luasnip.loaders.from_vscode').lazy_load()
