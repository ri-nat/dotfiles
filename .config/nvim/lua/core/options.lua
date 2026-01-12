-- Editor options (no plugin requires here)

-- Truecolor (required for most modern themes)
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Display relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight current line
vim.opt.cursorline = true

-- Highlight 120 columns
vim.opt.colorcolumn = "120"

-- Tabs / indentation defaults
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smarttab = true

-- Folding defaults (works well with nvim-ufo when installed)
vim.opt.foldcolumn = '0'
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
