-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force user to select one from the menu
vim.cmd('set completeopt=menuone,noinsert,noselect')

-- Better display for messages
vim.cmd('set cmdheight=2')

vim.cmd('set updatetime=300')

local cmp = require('cmp')

cmp.setup({
    snippet = {
        -- REQUIRED by nvim-cmp. get rid of it once we can
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<Enter>'] = cmp.mapping.confirm({ select = true }),
        -- ['<C-Tab>'] = cmp.mapping.complete(),
    }),

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    sources = cmp.config.sources({
        -- TODO: currently snippets from lsp end up getting prioritized -- stop that!
        { name = 'nvim_lsp' },
    }, {
        { name = 'path' },
    }),

    experimental = {
        ghost_text = true,
    }
})

-- Enable completing paths in :
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    })
})
