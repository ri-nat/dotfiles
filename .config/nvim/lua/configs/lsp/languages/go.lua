local lsp = require('configs.lsp.lsp')
local util = require('lspconfig/util')

require('lspconfig').gopls.setup({
    on_attach = lsp.on_attach,
    cmd = { 'gopls', 'serve' },
    filetypes = { 'go', 'gomod' },
    root_dir = util.root_pattern('go.work', 'go.mod', '.git'),

    settings = {
        gopls = {
            analyses = {
                unusedparams = true
            },
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
            staticcheck = true
        }
    },

    capabilities = lsp.capabilities
})

require('go').setup()

local format_sync_grp = vim.api.nvim_create_augroup('GoImport', {})

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*.go',
    callback = function()
        require('go.format').goimport()
    end,
    group = format_sync_grp,
})
