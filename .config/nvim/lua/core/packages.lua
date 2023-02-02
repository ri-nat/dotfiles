local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end

    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Manage `packer` itself
    use 'wbthomason/packer.nvim'

    --
    -- LSP
    --

    -- Servers management
    use {
        'williamboman/mason-lspconfig.nvim',
        requires = {'williamboman/mason.nvim'},
        config = function()
            require('configs.mason')
        end
    }

    use {
        'neovim/nvim-lspconfig',
        config = function()
            require('configs.lspconfig')
        end
    }

    use 'rust-lang/rust.vim'

    -- Rust
    use {
        'simrat39/rust-tools.nvim',
        config = function()
            require('configs.lsp.servers.rust')
        end
    }

    -- Go
    use {
        'ray-x/go.nvim',
        config = function()
            require('configs.lsp.servers.go')
        end
    }

    -- Completions
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use {
        'hrsh7th/nvim-cmp',
        config = function()
            require('configs.cmp')
        end
    }

    -- LSP signature while typing
    use {
        'ray-x/lsp_signature.nvim',
        config = function()
            require('configs.lsp_signature')
        end
    }

    -- Theme
    use 'RRethy/nvim-base16'

    -- Status line
    use {
        'itchyny/lightline.vim',
        config = function()
            require('configs.lightline')
        end
    }

    -- Pop-up terminal
    use {
        'akinsho/toggleterm.nvim',
        tag = '*',
        config = function()
            require('configs.toggleterm')
        end
    }

    -- File explorer
    use {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v2.x',
        requires = {'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'MunifTanjim/nui.nvim'}
    }

    -- Comment lines
    use {
        'terrortylor/nvim-comment',
        config = function()
            require('configs.comment')
        end
    }

    -- Autopairs
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('configs.autopairs')
        end
    }

    -- Surrounds
    use {
        'kylechui/nvim-surround',
        tag = '*',
        config = function()
            require('configs.surround')
        end
    }

    -- Diagnostics
    use {
        'folke/trouble.nvim',
        requires = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('configs.trouble')
        end
    }

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        requires = {{'kyazdani42/nvim-web-devicons'}, {'nvim-treesitter/nvim-treesitter'}, {'nvim-lua/plenary.nvim'},
                    {'nvim-telescope/telescope-fzf-native.nvim'}},
        config = function()
            -- require('configs.telescope')
        end
    }

    -- EditorConfig
    use 'gpanders/editorconfig.nvim'

    -- GitHub Copilot
    use 'github/copilot.vim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
