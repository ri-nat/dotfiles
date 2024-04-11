require('nvim-treesitter.configs').setup({
    ensure_installed = { 'go', 'lua', 'json', 'yaml', 'html', 'css', 'javascript', 'typescript', 'bash', 'proto', 'rust',
        'toml', 'dockerfile', 'python', 'ruby' },

    highlight = {
        enable = true,
        -- disable = { 'rust' },
    },
})
