return {
  'preservim/nerdtree',
  cmd = { 'NERDTreeToggle', 'NERDTreeFind', 'NERDTree' },
  init = function()
    vim.g.NERDTreeShowHidden = 1
    vim.g.NERDTreeQuitOnOpen = 1
    vim.g.NERDTreeMinimalUI = 1
  end,
}
