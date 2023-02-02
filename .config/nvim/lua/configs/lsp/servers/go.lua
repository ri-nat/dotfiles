local lsp = require('configs.lsp.lsp')
local util = require('lspconfig/util')

require('lspconfig').gopls.setup({
    on_attach = lsp.on_attach,
    cmd = {'gopls', 'serve'},
    filetypes = {'go', 'gomod'},
    root_dir = util.root_pattern('go.work', 'go.mod', '.git'),

    settings = {
        gopls = {
            analyses = {
                unusedparams = true
            },
            staticcheck = true
        }
    },

    capabilities = lsp.capabilities
})
