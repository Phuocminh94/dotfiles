-- nvim-cmp
local cmp = require 'cmp'
local util = require 'lsp_utils'

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
                require("luasnip").expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
                require("luasnip").jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-q>"] = function()
            return cmp.visible_docs() and cmp.close_docs() or cmp.open_docs()
        end,
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
    },
    sources = cmp.config.sources({
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },

    })
})

-- lsp_config
require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "vimls" }
}
local lspconfig = require('lspconfig')

-- R
lspconfig.r_language_server.setup({
    on_attach = util.on_attach,
    capabilities = util.capabilities,
    settings = {
        r = { rpath = "C:\\Program Files\\R\\R-4.4.2\\bin\\x64\\R.exe" }
    },
    cmd_env = {
        LANG = "en_US.UTF-8"
    }
})

-- lua
lspconfig.lua_ls.setup {
    on_attach = util.on_attach,
    capabilities = util.capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            hint = { -- inlay_hints neovim >= 0.10.0
                enable = true,
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
}

-- vim
lspconfig.vimls.setup {}
