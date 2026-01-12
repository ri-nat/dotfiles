local lsp = require('configs.lsp.lsp')

vim.lsp.config('gopls', {
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
        },
    },
})

vim.lsp.enable('gopls')
