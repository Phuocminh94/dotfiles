local M = {}

M.build = function()
    local s = "%="
    local total = vim.fn.tabpagenr("$")
    local current = vim.fn.tabpagenr()

    for i = 1, total do
        if i == current then
            s = s .. "%#TabLineSel#"
        else
            s = s .. "%#TabLine#"
        end
        s = s .. "  " .. i .. "  "
    end

    s = s .. "%#TabLineFill#"
    return s
end

M.setup = function()
    vim.o.showtabline = vim.fn.tabpagenr("$") > 1 and 0 or 1
    vim.o.tabline = "%!v:lua.require'tabline'.build()"
end

M.setup()

return M
