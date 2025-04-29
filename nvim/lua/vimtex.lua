-- Enable filetype plugins and indent
vim.cmd('filetype plugin indent on')

-- Enable syntax highlighting
vim.cmd('syntax enable')

-- VimTeX viewer settings
vim.g.vimtex_view_method = 'general'
vim.g.vimtex_view_general_viewer = 'C:\\Users\\Admin\\AppData\\Local\\SumatraPDF\\SumatraPDF.exe'
vim.g.vimtex_view_enabled = 1

-- VimTeX compiler settings
vim.g.vimtex_compiler_method = 'latexmk'

-- Set local leader
vim.g.maplocalleader = ','

-- Latexmk options for VimTeX
vim.g.vimtex_compiler_latexmk = {
  executable = 'latexmk',
  options = {
    '-xelatex',
    '-file-line-error',
    '-synctex=1',
    '-interaction=nonstopmode',
  },
}
