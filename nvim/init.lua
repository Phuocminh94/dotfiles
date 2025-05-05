vim.g.mNote_path = "H:/My Drive/mNote/"
vim.g.r_path = (function()
  local r_path = vim.fn.exepath("R")
  if r_path ~= "" then
    return r_path
  else
    vim.notify("R executable not found in PATH", vim.log.levels.WARN)
    return nil
  end
end)()

-- options
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.expandtab = true
vim.opt.fillchars = { eob = " " }
vim.opt.mouse = "a"
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.textwidth = 80
vim.opt.termguicolors = true

-- plugin
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    import = "plugins",
  },
  change_detection = {
    enabled = false,
    notify = false,
  },
})

-- keymaps
require 'keymaps'

-- my colorscheme
vim.cmd.colorscheme('neovim')

-- lua config
require('autocmd')
require('statusline')
require('tabline')
