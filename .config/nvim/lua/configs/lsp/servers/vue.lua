local lsp = require('configs.lsp.lsp')

require('lspconfig').volar.setup({
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities
})
