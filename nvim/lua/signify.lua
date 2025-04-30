vim.cmd([[
    " Use Unicode glyphs for prettier signs
let g:signify_sign_add    = '│'
let g:signify_sign_change = '│'
let g:signify_sign_delete = '_'

" Customize highlight groups
highlight SignifySignAdd    guifg=#00ff00 guibg=NONE ctermfg=2 ctermbg=NONE
highlight SignifySignChange guifg=#ffff00 guibg=NONE ctermfg=3 ctermbg=NONE
highlight SignifySignDelete guifg=#ff5f5f guibg=NONE ctermfg=1 ctermbg=NONE

]])
