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

" colorscheme
colorscheme green-shades

if g:colors_name == 'green-shades'
    highlight CmpItemAbbr       guifg=#ffff00 guibg=NONE
    highlight CmpItemAbbrMatch  guifg=#ffff00 guibg=NONE
    highlight CmpItemKind       guifg=#00bab6 guibg=NONE
    highlight Comment           guifg=#888888 gui=italic
    highlight Constant          guifg=#ffff00 guibg=NONE
    highlight CursorLineNr      guifg=#ffff00 guibg=NONE
    highlight Function          guifg=#00bab6
    highlight Identifier        guifg=#57bb56
    highlight Visual            guifg=#ffffff guibg=#1b3ba2
endif

" lua config
lua require('autocmd')
lua require('lsp_config')
lua require('luasnip.loaders.from_lua').lazy_load({paths = '~/dotfiles/nvim/lua/snippets/'})
lua require('luasnip.loaders.from_lua').load()
lua require('luasnip.loaders.from_vscode').lazy_load()
lua require('mkdp')
lua require('terminal')
lua require('vimtex')
lua require('statusline')
