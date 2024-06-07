local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- Load the colorscheme first
    {

        'projekt0n/github-nvim-theme',
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require('github-theme').setup()

            -- Set the colorscheme
            vim.cmd('colorscheme github_dark_dimmed')
        end,
    },
    {
        'itchyny/lightline.vim',
        lazy = false,
        enabled = true,
        config = function()
            require('configs.lightline')
        end
    },
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- 'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
            {
                's1n7ax/nvim-window-picker',
                version = '2.*',
                config = function()
                    require('window-picker').setup({
                        filter_rules = {
                            include_current_win = false,
                            autoselect_one = true,
                            -- filter using buffer options
                            bo = {
                                -- if the file type is one of following, the window will be ignored
                                filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
                                -- if the buffer type is one of following, the window will be ignored
                                buftype = { 'terminal', 'quickfix' },
                            },
                        },
                    })
                end,
            },
        },
        config = function()
            require('configs.neo-tree')
        end
    },
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
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        config = function()
            require('configs.treesitter')
        end
    },
    -- Completions
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
        end
    },
    -- Pop-up terminal
    {
        'akinsho/toggleterm.nvim',
        config = function()
            require('configs.toggleterm')
        end
    },
    -- GitHub Copilot
    'github/copilot.vim',
    -- EditorConfig
    'gpanders/editorconfig.nvim',
    -- Folding
    {
        'kevinhwang91/nvim-ufo',
        dependencies = {
            'kevinhwang91/promise-async'
        },
        config = function()
            require('ui.fold')
        end
    },
    -- Base64 encoding
    'taybart/b64.nvim',
    -- Symbols outline
    {
        'simrat39/symbols-outline.nvim',
        config = function()
            require('configs.symbols-outline')
        end
    },
    -- Diagnostic
    {
        'folke/trouble.nvim',
        dependencies = {
            'kyazdani42/nvim-web-devicons'
        },
        config = function()
            require('configs.trouble')
        end,
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            }
        }
    },
    -- Surround
    {
        'kylechui/nvim-surround',
        version = '*',
        event = 'VeryLazy',
        config = function()
            require('nvim-surround').setup()
        end
    },
    -- Autopairs
    {
        'windwp/nvim-autopairs',
        config = function()
            require('configs.autopairs')
        end
    },
    -- Comment lines
    {
        'terrortylor/nvim-comment',
        config = function()
            require('configs.comment')
        end
    },
    -- Highlight todo
    {
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    --
    -- LSP
    --

    -- Servers management
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim' },
        config = function()
            require('configs.mason')
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            require('configs.lspconfig')
        end
    },
    -- LSP signature while typing
    {
        'ray-x/lsp_signature.nvim',
        -- config = function()
        --     require('configs.lsp_signature')
        -- end
    },

    --
    -- Languages
    --

    -- Go
    {
        'ray-x/go.nvim',
        config = function()
            require('configs.lsp.languages.go')
        end
    },

    -- Rust
    'rust-lang/rust.vim',
    {
        'simrat39/rust-tools.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'mfussenegger/nvim-dap',
        },
        config = function()
            require('configs.lsp.languages.rust')
        end
    },

    -- ESLint
    {
        'MunifTanjim/eslint.nvim',
        dependencies = {
            'jose-elias-alvarez/null-ls.nvim',
        },
        config = function()
            require('configs.lsp.languages.eslint')
        end
    }
})
