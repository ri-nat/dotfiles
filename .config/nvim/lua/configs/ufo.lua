-- nvim-ufo config (keep UI folder plugin-free)

-- Using ufo provider need remap `zR` and `zM`.
vim.keymap.set('n', 'zR', function()
    require('ufo').openAllFolds()
end)
vim.keymap.set('n', 'zM', function()
    require('ufo').closeAllFolds()
end)

require('ufo').setup()
