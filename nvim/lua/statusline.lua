-- @see https://github.com/NvChad/ui/blob/v3.0/lua/nvchad/init.lua
-- @see https://github.com/NvChad/ui/blob/v3.0/lua/nvchad/stl/vscode.lua
-- @see https://github.com/Phuocminh94/dot-files/blob/main/nvim/lua/custom/configs/statusline.lua

local M = {}
local fn = vim.fn

local is_activewin = function()
  return vim.api.nvim_get_current_win() == vim.g.statusline_winid
end

local stbufnr = function()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid)
end

-- @see https://www.reddit.com/r/neovim/comments/y2t9rt/how_can_i_check_cwd_is_git_repository/
local is_git_repo = function()
    local git_dir = vim.fn.finddir('.git', vim.fn.getcwd() .. ";")
    return git_dir ~= ""
end

M.modes = {
  ["n"] = "NORMAL",
  ["no"] = "NORMAL (no)",
  ["nov"] = "NORMAL (nov)",
  ["noV"] = "NORMAL (noV)",
  ["noCTRL-V"] = "NORMAL",
  ["niI"] = "NORMAL i",
  ["niR"] = "NORMAL r",
  ["niV"] = "NORMAL v",
  ["nt"] = "NTERMINAL",
  ["ntT"] = "NTERMINAL (ntT)",

  ["v"] = "VISUAL",
  ["vs"] = "V-CHAR (Ctrl O)",
  ["V"] = "V-LINE",
  ["Vs"] = "V-LINE",
  [""] = "V-BLOCK",

  ["i"] = "INSERT",
  ["ic"] = "INSERT (completion)",
  ["ix"] = "INSERT completion",

  ["t"] = "TERMINAL",

  ["R"] = "REPLACE",
  ["Rc"] = "REPLACE (Rc)",
  ["Rx"] = "REPLACEa (Rx)",
  ["Rv"] = "V-REPLACE",
  ["Rvc"] = "V-REPLACE (Rvc)",
  ["Rvx"] = "V-REPLACE (Rvx)",

  ["s"] = "SELECT",
  ["S"] = "S-LINE",
  [""] = "S-BLOCK",
  ["c"] = "COMMAND",
  ["cv"] = "COMMAND",
  ["ce"] = "COMMAND",
  ["r"] = "PROMPT",
  ["rm"] = "MORE",
  ["r?"] = "CONFIRM",
  ["x"] = "CONFIRM",
  ["!"] = "SHELL",
}

M.mode = function()
  if not is_activewin() then
    return ""
  end

  local m = vim.api.nvim_get_mode().mode
  return "%#St_Mode#  " .. M.modes[m] .. " "
end

M.file = function()
  local icon = "󰈚"
  local path = vim.api.nvim_buf_get_name(stbufnr())
  local name = (path == "" and "Empty") or path:match "([^/\\]+)[/\\]*$"

  if name ~= "Empty" then
    local devicons_present, devicons = pcall(require, "nvim-web-devicons")

    if devicons_present then
      local ft_icon = devicons.get_icon(name)
      icon = (ft_icon ~= nil and ft_icon) or icon
    end
  end

  return "%#St_Text# " .. icon .. " " .. name .. " "
end

M.clock = function()
  return "%#St_Text#   " .. os.date("%H:%M")
end

M.cursor = "%#St_Text# Ln %l, Col %v  "

M.cwd = function()
  local icon = is_git_repo() and "%#St_CWD#  " or "%#St_CWD#  " 
  local dir_name = icon .. fn.fnamemodify(fn.getcwd(), ":t") .. " "
  return dir_name
end

-- Build the whole statusline
M.build_statusline = function()
  return table.concat({
    M.mode(),
    M.file(),
    "%=",
    M.clock(),
    "%=",
    M.cursor,
    M.cwd(),
  })
end

-- Apply the statusline config
M.setup = function()
  vim.opt.laststatus = 2
  vim.opt.statusline = "%!v:lua.require('statusline').build_statusline()"
end

M.setup()

return M
