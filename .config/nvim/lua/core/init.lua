-- Set leader key before requiring any plugins
vim.g.mapleader = ' '

-- Compatibility shims for plugins on newer Neovim
if vim.lsp and vim.lsp.get_clients then
    -- Some plugins still call the deprecated function; overriding it avoids the warning.
    vim.lsp.get_active_clients = vim.lsp.get_clients

    -- Neovim 0.11 deprecations: keep older plugins quiet.
    vim.lsp.buf_get_clients = function(bufnr)
        return vim.lsp.get_clients({ bufnr = bufnr or 0 })
    end
end

--
-- Base editor config
--
require('core.options')
require('core.autocmds')

-- Package manager / plugins (after core options so plugins can read them)
require('core.packages')

-- Keybindings
require('core.mappings')

-- Keep undo history after closing NeoVim
require('core.undo')
