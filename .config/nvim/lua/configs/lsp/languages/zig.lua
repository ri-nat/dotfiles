local lsp = require('configs.lsp.lsp')
local util = require('lspconfig/util')

require('lspconfig').zls.setup({
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities
})
