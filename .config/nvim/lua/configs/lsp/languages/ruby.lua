local lsp = require('configs.lsp.lsp')

require('lspconfig').solargraph.setup({
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
    settings = {
        solargraph = {
            cmd = { os.getenv("HOME") .. "/.rbenv/shims/solargraph", 'stdio' },
            -- root_dir = util.root_pattern("Gemfile", ".git", "."),
            settings = {
                solargraph = {
                    autoformat = true,
                    completion = true,
                    diagnostic = true,
                    folding = true,
                    references = true,
                    rename = true,
                    symbols = true,
                    format = true
                }
            }
        }
    }
})
