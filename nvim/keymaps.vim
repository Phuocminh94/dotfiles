let mapleader = " "

" NORMAL
nnoremap <silent> <leader>e <cmd>NERDTreeToggle %:p:h<CR>
nnoremap <silent> <leader>n <cmd>NERDTreeToggle H:/My Drive/mNotes/<CR>, {desc ='Open mNotes'}
nnoremap <silent> <leader>N <cmd>NERDTreeToggle $HOME/dotfiles/nvim<CR>, {desc = 'Open config'}

nnoremap <silent> j gj
nnoremap <silent> k gk

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <silent> <C-Up>    <cmd>resize -2<CR>
nnoremap <silent> <C-Down>  <cmd>resize +2<CR>
nnoremap <silent> <C-Left>  <cmd>vertical resize -2<CR>
nnoremap <silent> <C-Right> <cmd>vertical resize +2<CR>

nnoremap <silent> <leader>md <cmd>MarkdownPreviewToggle<CR>
nmap ga <Plug>(EasyAlign)

" telescope
nnoremap <silent> <leader>ff <cmd>Telescope find_files<CR>
nnoremap <silent> <leader>fo <cmd>Telescope oldfiles<CR>

" lsp
nnoremap <silent> gl <cmd>lua vim.diagnostic.open_float()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gs <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>fm <cmd>lua vim.lsp.buf.format({ async = true })<CR>

" luasnip
inoremap <silent> <C-s> <cmd>lua require('luasnip').expand()<CR>

" gitsigns
nnoremap <silent> ]h <cmd>lua require('gitsigns').next_hunk()<CR>
nnoremap <silent> [h <cmd>lua require('gitsigns').prev_hunk()<CR>
nnoremap <silent> <leader>hr <cmd>lua require('gitsigns').reset_hunk()<CR>
nnoremap <silent> <leader>hp <cmd>lua require('gitsigns').preview_hunk()<CR>

" float term
nnoremap <silent> <A-\> <cmd>lua require("FTerm").toggle()<CR>
tnoremap <silent> <A-\> <cmd>lua require("FTerm").toggle()<CR>
nnoremap <silent> <A-g> <cmd>lua Gitui:toggle()<CR>

" colorizer
nnoremap <silent> <A-c> <cmd>ColorizerToggle<CR>

" img-clip
nnoremap <silent> <leader>p <cmd>PasteImage<CR>

" INSERT
inoremap <silent> jk <Esc>

" VISUAL
vnoremap <leader>s <cmd>sort<CR>
xmap ga <Plug>(EasyAlign)

" DEPRECATED
"nnoremap <leader><C-M> :!powershell & "C:\Program Files\R\R-4.4.2\bin\Rscript.exe" %<CR>
