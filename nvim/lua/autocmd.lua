-- @see https://github.com/hieulw/nvimrc/blob/lua-config/lua/hieulw/autocmds.lua

local custom = vim.api.nvim_create_augroup("MyAutocmd", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
    desc = "highlight yanked text",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual" })
    end,
    group = custom,
})

autocmd({ "FileType" }, {
    group = custom,
    pattern = {
        "checkhealth",
        "help",
        "lspinfo",
        "man",
        "qf",
        "git",
        "spectre_panel",
    },
    desc = "quick escape with q",
    callback = function()
        vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      nnoremap <silent> <buffer> <esc> :close<CR>
      set nobuflisted
    ]])
    end,
})

autocmd("VimResized", {
    desc = "resize splits if window got resized",
    group = custom,
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end,
})

autocmd("CmdlineEnter", {
    desc = "enable hlsearch when entering cmdline",
    pattern = "/,?",
    group = custom,
    command = "set hlsearch",
})

autocmd("CmdlineLeave", {
    desc = "disable hlsearch when leaving cmdline",
    pattern = "/,?",
    group = custom,
    command = "set nohlsearch",
})

autocmd("FileType", {
  desc = "wrap and check for spell in text filetypes",
  group = custom,
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

autocmd("BufWinEnter", {
  desc = "avoid auto insert comment on newline",
  group = custom,
  callback = function()
    vim.cmd("set formatoptions-=cro")
  end,
})
