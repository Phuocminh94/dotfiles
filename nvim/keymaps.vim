let mapleader = " "

" normal
nnoremap <leader>x :bd<CR>
nnoremap <silent> <C-S> :w!<CR>
nnoremap <silent> <leader>e :NERDTreeToggle %:p:h<CR>

nnoremap <silent> j gj
nnoremap <silent> k gk

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-Up>    :resize -2<CR>
nnoremap <C-Down>  :resize +2<CR>
nnoremap <C-Left>  :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

nnoremap <silent> <leader>ff :Telescope find_files<CR>
nnoremap <silent> <leader>fo :Telescope oldfiles<CR>
nnoremap <silent> <leader>fN :Telescope find_files cwd=C:\Users\buiph\dotfiles\nvim<CR>
nnoremap <silent> <leader>fn :Telescope find_files cwd=C:\Users\buiph\iCloudDrive\iCloud~md~obsidian\Notes<CR>

nmap ga <Plug>(EasyAlign)
nnoremap <silent> <leader>md :MarkdownPreviewToggle<CR>


" insert
inoremap <silent> jk <Esc>


" visual
vnoremap <leader>s :sort<CR>
xmap ga <Plug>(EasyAlign)
