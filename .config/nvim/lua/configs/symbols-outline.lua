require('symbols-outline').setup()

vim.api.nvim_set_keymap('n', '<leader>s', ':SymbolsOutline<CR>', { noremap = true, silent = true })
