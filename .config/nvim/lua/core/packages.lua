-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    --
    -- UI & Theming
    --
    {
        'projekt0n/github-nvim-theme',
        lazy = false,    -- load during startup (main colorscheme)
        priority = 1000, -- load before other start plugins
        config = function()
            require('github-theme').setup()
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
    -- LSP & Completion
    --

    {
        'williamboman/mason-lspconfig.nvim',
        event = "BufReadPre",
        dependencies = {
            'williamboman/mason.nvim',
            'neovim/nvim-lspconfig',
            'ray-x/lsp_signature.nvim',
        },
        config = function()
            require('configs.mason')
            require('configs.lspconfig')
            require('lsp_signature').setup()
        end
    },

    --
    -- Languages
    --

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

    --
    -- Avante
    --

    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        version = false, -- set this if you want to always pull the latest change
        opts = {
            -- options
            behaviour = {
                auto_suggestions = false,
            }
        },
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = "make",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            -- "zbirenbaum/copilot.lua", -- for providers='copilot'
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
            {
                -- Make sure to set this up properly if you have lazy=true
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    }
})
