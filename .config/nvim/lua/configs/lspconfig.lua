require('lspconfig.ui.windows').default_options.border = 'rounded'

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = 'rounded',
})

require('configs.lsp')

require('configs.lsp.servers.lua')
require('configs.lsp.servers.vue')
