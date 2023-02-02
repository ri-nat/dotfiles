vim.g.mapleader = ' '

-- Double leader to return to last file
vim.keymap.set('n', '<Leader><Leader>', '<C-^>')

-- Disable arrow keys
vim.keymap.set('n', '<Up>', '<Nop>')
vim.keymap.set('n', '<Down>', '<Nop>')
vim.keymap.set('n', '<Left>', '<Nop>')
vim.keymap.set('n', '<Right>', '<Nop>')

-- Remap window movement keys
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- File explorer
vim.keymap.set('n', '<Leader>e', ':NeoTreeFloatToggle<CR>')
vim.keymap.set('n', '<Leader>E', ':NeoTreeShowToggle<CR>')
vim.keymap.set('n', '<A-e>', ':NeoTreeShowToggle<CR>')

-- Clear search highlights on Esc
vim.keymap.set('n', '<Esc>', ':noh<CR>')

-- Telescope
vim.keymap.set('n', '<Leader>ff', ':Telescope find_files<CR>')
vim.keymap.set('n', '<Leader>fg', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<Leader>fb', ':Telescope buffers<CR>')
vim.keymap.set('n', '<Leader>fh', ':Telescope help_tags<CR>')

-- LSP
vim.keymap.set('n', '<Leader>rr', ':LspRestart<CR>')

-- Trouble
vim.keymap.set('n', '<Leader>xx', ':TroubleToggle<CR>')

-- GitHub Copilot
vim.g.copilot_assume_mapped = true
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap('i', '<C-f>', 'copilot#Accept("<CR>")', {expr = true, silent = true})
