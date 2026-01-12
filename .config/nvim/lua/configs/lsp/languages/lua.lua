local lsp = require('configs.lsp.lsp')

vim.lsp.config('lua_ls', {
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
})

vim.lsp.enable('lua_ls')
