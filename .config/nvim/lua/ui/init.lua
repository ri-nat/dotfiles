require('ui.colors')

-- Configure lightline
require('configs.lightline')

-- Display relative line numbers
vim.cmd('set number relativenumber')
-- Highlight current line
vim.cmd('set cursorline')
-- Highlight 80 and 120 columns
vim.cmd('set colorcolumn=80,120')

-- Default tab settings
vim.cmd('set tabstop=4 shiftwidth=4 softtabstop=4 expandtab smarttab')
-- Tab configuration for proto files
vim.cmd('autocmd FileType proto setlocal shiftwidth=2 softtabstop=2 expandtab smartindent smarttab')
