local M = {}

-- Define custom diagnostic signs
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

-- Highlight symbol under cursor
M.highlight_symbols = function(client)
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

-- export on_attach & capabilities for custom lspconfigs
M.on_attach = function(client, bufnr)
    M.highlight_symbols(client)

    -- (Optional) Disable semanticTokens if not needed
    if client.supports_method and client.supports_method("textDocument/semanticTokens") then
        client.server_capabilities.semanticTokensProvider = nil
    end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

return M
