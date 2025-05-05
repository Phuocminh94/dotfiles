-- create telescope table of content
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function markdown_toc()
    local results = {}
    local inside_code_block = false

    -- Iterate through all lines in the buffer
    for lnum, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
        -- Check if the line contains a code block (``` or ```)
        if line:match("^```") then
            inside_code_block = not inside_code_block -- Toggle code block state
        end

        -- Skip parsing if we're inside a code block or if it's inline code
        if inside_code_block or line:match("`") then
            goto continue -- Skip this iteration
        end

        -- Detect headings (lines starting with #, ##, etc.)
        local heading = line:match("^(#+)%s+(.*)")
        if heading then
            local level = #heading
            table.insert(results, {
                text = string.rep("  ", level - 1) .. line,
                line = lnum
            })
        end

        ::continue::
    end

    -- Create and show the Telescope picker
    pickers.new({}, {
        prompt_title = "TOC",
        finder = finders.new_table {
            results = results,
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = entry.text,
                    ordinal = entry.text,
                    lnum = entry.line
                }
            end
        },
        -- top, right, bottom, left, top-left, top-right, bottom-right, bottom-left
        borderchars = {
            prompt = { " ", "│", "─", "│", "│", "│", "┘", "└" },
            results = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
        },
        layout_config = {
            width = 0.5,
        },
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                vim.api.nvim_win_set_cursor(0, { selection.lnum, 0 })
            end)
            return true
        end
    }):find()
end

vim.keymap.set("n", "<leader>mt", markdown_toc, { desc = "Markdown TOC" })

-- vim.cmd("call vimtex#init()")
require('img-clip').setup({
    default = {
        dir_path = vim.g.mNote_path .. 'assets/images',
    }
})
