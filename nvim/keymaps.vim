let mapleader = " "

" normal
nnoremap <leader>x :bd<CR>
nnoremap <silent> <C-S> :w!<CR>
nnoremap <silent> <leader>e :NERDTreeToggle<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-Up>    :resize -2<CR>
nnoremap <C-Down>  :resize +2<CR>
nnoremap <C-Left>  :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fo :Telescope oldfiles<CR>
nnoremap <leader>fN :Telescope find_files cwd=C:\Users\buiph\dotfiles\nvim<CR>
nnoremap <leader>fn :Telescope find_files cwd=C:\Users\buiph\iCloudDrive\iCloud~md~obsidian\Notes<CR>


" insert
inoremap <silent> jk <Esc>

" visual
vnoremap <leader>s :sort<CR>

