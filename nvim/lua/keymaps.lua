-- Set leader key
vim.g.mapleader = " "

local keymap = vim.keymap.set
local opts = { silent = true }

-- NORMAL mode

-- NERDTree
keymap("n", "<leader>e", "<cmd>NERDTreeToggle %:p:h<CR>", opts)
keymap("n", "<leader>cd", function() -- change to current cwd
    local bufname = vim.api.nvim_buf_get_name(0)
    if bufname == "" then return end

    local dirname = vim.fs.dirname(bufname)
    if dirname and vim.fn.getcwd() ~= dirname then
        vim.fn.chdir(dirname)
        vim.notify("Changed directory to " .. dirname, vim.log.levels.INFO)
    end
end, { desc = "Change cwd to current file's directory" })

keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

keymap("n", "<C-Up>", "<cmd>resize -2<CR>", opts)
keymap("n", "<C-Down>", "<cmd>resize +2<CR>", opts)
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

keymap("n", "<leader>md", "<cmd>MarkdownPreviewToggle<CR>", opts)
keymap("n", "ga", "<Plug>(EasyAlign)", {})

keymap("n", "n", "nzz", opts) -- auto recenter search
keymap("n", "N", "Nzz", opts) -- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n

-- Telescope
keymap("n", "<leader>ff", function()
    require("telescope.builtin")
        .find_files(require("telescope.themes")
            .get_ivy())
end, opts)

keymap("n", "<leader>fo", function()
    require("telescope.builtin")
        .oldfiles(require("telescope.themes")
            .get_cursor({ previewer = false }))
end, opts)

keymap("n", "<leader>fg", function()
    require("telescope.builtin").live_grep()
end, opts)

keymap("n", "<leader>fn", function()
  local theme = require("telescope.themes").get_ivy()
  theme.cwd = "H:/My Drive/mNote/"
  require("telescope.builtin").find_files(theme)
end, opts)

-- LSP
keymap("n", "gl", vim.diagnostic.open_float, opts)
keymap("n", "gD", vim.lsp.buf.declaration, opts)
keymap("n", "gd", vim.lsp.buf.definition, opts)
keymap("n", "K", vim.lsp.buf.hover, opts)
keymap("n", "gi", vim.lsp.buf.implementation, opts)
keymap("n", "gs", vim.lsp.buf.signature_help, opts)
keymap("n", "gr", vim.lsp.buf.references, opts)
keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
keymap("n", "<leader>fm", function() vim.lsp.buf.format { async = true } end, opts)

-- LuaSnip
keymap("i", "<C-s>", function() require("luasnip").expand() end, opts)

-- Gitsigns
keymap("n", "]h", function() require("gitsigns").next_hunk() end, opts)
keymap("n", "[h", function() require("gitsigns").prev_hunk() end, opts)
keymap("n", "<leader>hr", function() require("gitsigns").reset_hunk() end, opts)
keymap("n", "<leader>hp", function() require("gitsigns").preview_hunk() end, opts)

-- FTerm
keymap("n", "<A-\\>", function() require("FTerm").toggle() end, opts)
keymap("t", "<A-\\>", function() require("FTerm").toggle() end, opts)
keymap("n", "<A-g>", function() Gitui:toggle() end, opts)

-- Colorizer
keymap("n", "<A-c>", "<cmd>ColorizerToggle<CR>", opts)

-- img-clip
keymap("n", "<leader>p", "<cmd>PasteImage<CR>", opts)

-- INSERT mode
keymap("i", "jk", "<Esc>", opts)

-- VISUAL mode
keymap("v", "<leader>s", "<cmd>sort<CR>", opts)
keymap("x", "ga", "<Plug>(EasyAlign)", {})
