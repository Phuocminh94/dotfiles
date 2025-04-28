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
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'

call plug#end()
