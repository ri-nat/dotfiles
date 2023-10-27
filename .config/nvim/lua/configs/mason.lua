require('mason').setup()

require('mason-lspconfig').setup {
    ensure_installed = {
        'bufls',
        'dockerls',
        'eslint',
        'golangci_lint_ls',
        'gopls',
        'jsonnet_ls',
        'lua_ls',
        'pylsp',
        'rubocop',
        'rust_analyzer',
        'solargraph',
        'tsserver',
        'volar',
        'zls',
    },

    automatic_installation = true,
}
