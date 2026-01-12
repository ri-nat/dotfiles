return {
    -- File explorer
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
            {
                's1n7ax/nvim-window-picker',
                version = '2.*',
                config = function()
                    require('window-picker').setup({
                        filter_rules = {
                            include_current_win = false,
                            autoselect_one = true,
                            bo = {
                                filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
                                buftype = { 'terminal', 'quickfix' },
                            },
                        },
                    })
                end,
            },
        },
        config = function()
            require('configs.neo-tree')
        end,
    },

    -- Fuzzy finder
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        lazy = false,
        dependencies = {
            'kyazdani42/nvim-web-devicons',
            'nvim-treesitter/nvim-treesitter',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzf-native.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
        },
        config = function()
            require('configs.telescope')
        end,
    },

    -- Syntax highlighting / parsing
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        config = function()
            require('configs.treesitter')
        end,
    },

    -- Pop-up terminal
    {
        'akinsho/toggleterm.nvim',
        config = function()
            require('configs.toggleterm')
        end,
    },

    -- EditorConfig
    'gpanders/editorconfig.nvim',

    -- Folding (ufo)
    {
        'kevinhwang91/nvim-ufo',
        dependencies = {
            'kevinhwang91/promise-async',
        },
        config = function()
            require('configs.ufo')
        end,
    },

    -- Base64 encoding
    'taybart/b64.nvim',

    -- Symbols outline
    {
        'simrat39/symbols-outline.nvim',
        config = function()
            require('configs.symbols-outline')
        end,
    },

    -- Diagnostics list UI
    {
        'folke/trouble.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require('configs.trouble')
        end,
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
        },
    },

    -- Surround
    {
        'kylechui/nvim-surround',
        version = '*',
        event = 'VeryLazy',
        config = function()
            require('nvim-surround').setup()
        end,
    },

    -- Autopairs
    {
        'windwp/nvim-autopairs',
        config = function()
            require('configs.autopairs')
        end,
    },

    -- Comment lines
    {
        'terrortylor/nvim-comment',
        config = function()
            require('configs.comment')
        end,
    },

    -- Highlight TODO/FIXME/etc.
    {
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {},
    },
}
