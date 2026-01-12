local lsp = require('configs.lsp.lsp')

vim.lsp.config('rust_analyzer', {
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
    settings = {
        ['rust-analyzer'] = {},
    },
})

vim.lsp.enable('rust_analyzer')
