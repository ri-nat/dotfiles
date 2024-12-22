require('mason').setup()

require('mason-lspconfig').setup {
    ensure_installed = {
        'bufls',
        'dockerls',
        'jsonnet_ls',
        'lua_ls',
        'pylsp',
        'rust_analyzer',
    },

    automatic_installation = true,
}
