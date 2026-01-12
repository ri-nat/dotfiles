local lsp = require('configs.lsp.lsp')

vim.lsp.config('pylsp', {
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
})

vim.lsp.enable('pylsp')
