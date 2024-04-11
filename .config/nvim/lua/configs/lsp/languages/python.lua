local lsp = require('configs.lsp.lsp')

require('lspconfig').pylsp.setup({
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities
})
