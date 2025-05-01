-- https://github.com/numToStr/FTerm.nvim
local fterm = require('FTerm')

fterm.setup({
    cmd = 'powershell -NoLogo',
    border = 'single',
    dimensions = {
        height = 0.6, -- Height of the terminal window
        width = 0.5, -- Width of the terminal window
        x = 1, -- X axis of the terminal window
        y = 1, -- Y axis of the terminal window
    },
})

Gitui = fterm:new({
    ft = 'fterm_gitui', -- You can also override the default filetype, if you want
    cmd = "gitui",
    dimensions = {
        height = 1,
        width = 0.9
    }
})
