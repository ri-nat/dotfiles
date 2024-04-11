require('symbols-outline').setup({
    auto_close = true,
    position = 'left',
})

vim.api.nvim_set_keymap('n', '<leader>s', ':SymbolsOutline<CR>', { noremap = true, silent = true })
