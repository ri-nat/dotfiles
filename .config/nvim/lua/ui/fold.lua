vim.opt.foldmethod = 'syntax'
vim.opt.foldenable = false
vim.opt.foldlevel = 99

vim.cmd('autocmd! FileType rust setlocal foldmethod=syntax foldenable')
