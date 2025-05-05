-- diagnostic
local signs = {
    Error = "󰅚",
    Warn  = "",
    Hint  = "󰛩",
    Info  = "",
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config {
    virtual_text = false,
    signs = true,
    update_in_insert = false
}

-- highlight symbol under cursor
local hlsymbol = function(client)
    local ok, highlight_supported = pcall(function()
        return client.supports_method("textDocument/documentHighlight")
    end)

    if not ok or not highlight_supported then
        return
    else
        vim.api.nvim_exec(
            [[
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> silent! lua vim.lsp.buf.document_highlight()
        autocmd CursorHoldI <buffer> silent! lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]],
            false
        )
    end
end

-- on attach
local on_attach = function(client, bufnr)
    hlsymbol(client)

    -- (Optional) Disable semanticTokens if not needed
    if client.supports_method and client.supports_method("textDocument/semanticTokens") then
        client.server_capabilities.semanticTokensProvider = nil
    end
end

-- cababilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

return {
    -- mason.nvim: A Neovim plugin to manage external editor tooling
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    -- mason-lspconfig.nvim: Bridges mason.nvim and nvim-lspconfig
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "vimls" } -- Language servers you want to install
            })
        end,
    },

    -- nvim-lspconfig: Provides LSP configuration for Neovim
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Add Mason bin to PATH so Neovim can find installed language servers
            local mason_bin = vim.fn.expand("$HOME/AppData/Local/nvim-data/mason/bin")
            vim.env.PATH = mason_bin .. ";" .. vim.env.PATH

            local lspconfig = require('lspconfig')

            -- lua
            lspconfig.lua_ls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
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

            -- R
            lspconfig.r_language_server.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    r = { rpath = vim.g.r_path }
                },
                filetypes = { "r", "rmd", "rmarkdown" }, -- <- this is the key line
                cmd_env = {
                    LANG = "en_US.UTF-8"
                }
            })
        end
    }
}
