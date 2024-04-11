require('lspconfig.ui.windows').default_options.border = 'rounded'

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = 'rounded',
})

require('configs.lsp')

require('configs.lsp.languages.lua')
require('configs.lsp.languages.ts')
require('configs.lsp.languages.vue')
-- require('configs.lsp.languages.python')
require('configs.lsp.languages.ruby')
require('configs.lsp.languages.zig')
