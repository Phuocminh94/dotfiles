" auto-install vim-plug
if empty(glob('C:\Users\buiph\AppData\Local\nvim-data\site\autoload\plug.vim'))
	call system('powershell -Command "iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni \"$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim\" -Force"')
endif

call plug#begin('C:\Users\buiph\AppData\Local\nvim-data\site\autoload\plugged')

Plug 'iruzo/matrix-nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'preservim/nerdtree'

call plug#end()
