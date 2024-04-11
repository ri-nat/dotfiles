local lsp = require('configs.lsp.lsp')
local rt = require('rust-tools')

rt.setup({
    server = {
        on_attach = function(aa, bufnr)
            lsp.on_attach(aa, bufnr)

            -- Hover actions
            -- vim.keymap.set('n', '<C-a>', rt.hover_actions.hover_actions, {
            --     buffer = bufnr
            -- })

            -- Code action groups
            vim.keymap.set('n', '<Leader>a', rt.code_action_group.code_action_group, {
                buffer = bufnr
            })
        end
    },

    tools = {
        inlay_hints = {
            other_hints_prefix = "» "
        }
    },

    capabilities = lsp.capabilities
})

rt.inlay_hints.enable()
