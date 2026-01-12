return {
    -- LSP core (Neovim 0.11+ API via vim.lsp.config / vim.lsp.enable)
    {
        'neovim/nvim-lspconfig',
        lazy = false,
        config = function()
            require('configs.lsp')
        end,
    },

    -- LSP installer
    {
        'mason-org/mason.nvim',
        lazy = false,
        opts = {},
    },

    {
        'mason-org/mason-lspconfig.nvim',
        lazy = false,
        opts = {},
        dependencies = { 'neovim/nvim-lspconfig' },
    },

    -- LSP signature help
    {
        "ray-x/lsp_signature.nvim",
        event = "InsertEnter",
        opts = {
            doc_lines = 1,
            bind = true,
            handler_opts = { border = 'rounded' },
        },
    },

    -- Completion engine
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
        },
        lazy = false,
        config = function()
            require('configs.cmp')
        end,
    },
}
