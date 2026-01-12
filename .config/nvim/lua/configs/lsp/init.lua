-- Format-on-save, buffer-local, only when a formatter-capable LSP attaches.
local augroup = vim.api.nvim_create_augroup('LspFormatOnSave', { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
    group = augroup,
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
            return
        end

        if not client.supports_method('textDocument/formatting') then
            return
        end

        local bufnr = args.buf
        if vim.b[bufnr].lsp_format_on_save then
            return
        end
        vim.b[bufnr].lsp_format_on_save = true

        vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
            end,
        })
    end,
})

-- Load all server configs (lua/go/python/ruby/rust, etc.)
require('configs.lsp.languages')
