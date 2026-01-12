return {
    -- Rust filetype support (LSP is configured in `lua/configs/lsp/languages/rust.lua`)
    {
        'rust-lang/rust.vim',
        ft = { 'rust' },
        config = function()
            require('configs.rust')
        end,
    },
}
