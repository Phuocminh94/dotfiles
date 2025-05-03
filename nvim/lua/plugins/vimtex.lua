return {
  "lervag/vimtex",
  ft = { "tex", "plaintex" },  -- Load only for LaTeX files
  config = function()
    vim.cmd('filetype plugin indent on')
    vim.cmd('syntax enable')

    vim.g.vimtex_view_method = 'general'
    vim.g.vimtex_view_general_viewer = 'C:\\Users\\Admin\\AppData\\Local\\SumatraPDF\\SumatraPDF.exe'
    vim.g.vimtex_view_enabled = 1

    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.maplocalleader = ','

    vim.g.vimtex_compiler_latexmk = {
      executable = 'latexmk',
      options = {
        '-xelatex',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
      },
    }
  end,
}
