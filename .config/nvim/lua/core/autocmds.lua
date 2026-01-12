-- Autocommands (no plugin requires here)

-- Proto files use 2-space indentation
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'proto',
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.expandtab = true
        vim.opt_local.smartindent = true
        vim.opt_local.smarttab = true
    end,
})
