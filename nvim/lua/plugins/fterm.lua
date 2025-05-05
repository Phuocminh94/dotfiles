return {
  'numToStr/FTerm.nvim',
  cmd = { 'ToggleTerm', 'FTerm' },  -- Lazy-load when toggling terminal
  config = function()
    local fterm = require('FTerm')

    -- Default terminal configuration
    fterm.setup({
      cmd = 'powershell -NoLogo',
      border = 'single',
      dimensions = {
        height = 0.6,  -- Height of the terminal window
        width = 0.5,   -- Width of the terminal window
        x = 1,         -- X axis of the terminal window
        y = 0.8,         -- Y axis of the terminal window
      },
    })

    -- GitUI terminal configuration
    Gitui = fterm:new({
      ft = 'fterm_gitui',  -- Filetype for GitUI
      cmd = 'gitui',
      dimensions = {
        height = 1,
        width = 0.9,
      },
    })
  end,
}
