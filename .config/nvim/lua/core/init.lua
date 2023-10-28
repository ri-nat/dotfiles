-- Set leader key before requiring any plugins
vim.g.mapleader = ' '

-- Package manager
require('core.packages')

--
-- Vim packages configs
--
require('configs.rust')

-- Keybindings
require('core.mappings')

-- Keep undo history after closing NeoVim
require('core.undo')
