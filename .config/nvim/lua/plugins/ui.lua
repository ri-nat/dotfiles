return {
    -- Theme
    {
        'projekt0n/github-nvim-theme',
        lazy = false,
        priority = 1000,
        config = function()
            require('github-theme').setup()
            vim.cmd('colorscheme github_dark_default')
        end,
    },

    -- Statusline
    {
        'itchyny/lightline.vim',
        lazy = false,
        enabled = true,
        config = function()
            require('configs.lightline')
        end,
    },
}
