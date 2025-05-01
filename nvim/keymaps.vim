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
nnoremap <silent> <leader>ff :Telescope find_files<CR>
nnoremap <silent> <leader>fo :Telescope oldfiles<CR>

" Lsp
nnoremap <silent> gl <cmd>lua vim.diagnostic.open_float()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gs <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>fm <cmd>lua vim.lsp.buf.format({ async = true })<CR>

" Luasnip
inoremap <silent> <C-s> <cmd>lua require('luasnip').expand()<CR>

" Git
nnoremap ]h <plug>(signify-next-hunk)
nnoremap [h <plug>(signify-prev-hunk)
nnoremap <silent><leader>hp :SignifyHunkDiff<CR>
nnoremap <silent><leader>hr :SignifyHunkUndo<CR>

" Float term
nnoremap <silent> <A-\> <cmd>lua require("FTerm").toggle()<CR>
tnoremap <silent> <A-\> <cmd>lua require("FTerm").toggle()<CR>
nnoremap <silent> <A-g> <cmd>lua Gitui:toggle()<CR>

" INSERT
inoremap <silent> jk <Esc>

" VISUAL
vnoremap <leader>s :sort<CR>
xmap ga <Plug>(EasyAlign)

" DEPRECATED
"nnoremap <leader><C-M> :!powershell & "C:\Program Files\R\R-4.4.2\bin\Rscript.exe" %<CR>
