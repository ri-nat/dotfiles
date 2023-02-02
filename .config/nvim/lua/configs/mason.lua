require('mason').setup()
require('mason-lspconfig').setup {
    ensure_installed = {'dockerls', 'eslint', 'gopls', 'rust_analyzer', 'sumneko_lua', 'volar'}
}
