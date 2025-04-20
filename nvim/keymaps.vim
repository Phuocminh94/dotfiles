let mapleader = " "

" NORMAL
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

nnoremap <silent> <leader>md :MarkdownPreviewToggle<CR>
nmap ga <Plug>(EasyAlign)

" Telescope
" ---------
nnoremap <silent> <leader>ff :Telescope find_files<CR>
nnoremap <silent> <leader>fo :Telescope oldfiles<CR>

" INSERT
inoremap <silent> jk <Esc>

" VISUAL
vnoremap <leader>s :sort<CR>
xmap ga <Plug>(EasyAlign)

" DEPRECATED
" snacks.nvim
" -----------
"nnoremap <leader>ff :lua require("snacks.picker").files()<CR>
"nnoremap <leader>fg :lua require("snacks.picker").grep()<CR>
"nnoremap <leader>f/ :lua require("snacks.picker").grep_buffers()<CR>
"nnoremap <leader>fu :lua require("snacks.picker").undo()<CR>
"nnoremap <leader>fh :lua require("snacks.picker").search_history()<CR>
"nnoremap <leader>e :lua require("snacks.picker").explorer()<CR>
"
"
"nnoremap <leader><C-M> :!powershell & "C:\Program Files\R\R-4.4.2\bin\Rscript.exe" %<CR>
