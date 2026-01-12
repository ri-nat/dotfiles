# Neovim config (lazy.nvim)

This is a modular Neovim configuration built around **lazy.nvim**.

It’s structured to keep:
- **core editor behavior** (options/autocmds/keymaps) in one place
- **plugin specs** separated by feature area
- **plugin configuration** in `lua/configs/`
- **LSP** in a single entrypoint with per-language files

---

## Structure

### Entry points

- `init.lua`
  - loads `require('core')`
  - loads `require('ui')`

### Core

- `lua/core/init.lua`
  - sets leader
  - adds compatibility shims for Neovim deprecations (to keep old plugins quiet)
  - loads base editor config
  - loads plugins (lazy.nvim bootstrap)
  - loads keymaps
- `lua/core/options.lua`
  - editor options (`termguicolors`, numbers, indentation, fold defaults, etc.)
- `lua/core/autocmds.lua`
  - non-plugin autocommands (example: proto indentation)
- `lua/core/mappings.lua`
  - all user keymaps (this is the main place you’ll tweak bindings)
- `lua/core/packages.lua`
  - bootstraps lazy.nvim and imports plugin specs from `lua/plugins/`

### Plugins

Plugin *specs* (what to install + when to load + which config module to run):

- `lua/plugins/ui.lua`
- `lua/plugins/editor.lua`
- `lua/plugins/lsp.lua`
- `lua/plugins/languages.lua`

Plugin *configs* (how a plugin behaves):

- `lua/configs/*`

### UI

- `lua/ui/init.lua` and `lua/ui/colors.lua`
  - UI-only tweaks and highlight overrides
  - **No plugin setup** and **no editor options** should live here

---

## What’s included

### UI / navigation

- **Theme**: `projekt0n/github-nvim-theme` (colorscheme: `github_dark_default`)
- **Statusline**: `itchyny/lightline.vim`
- **File explorer**: `nvim-neo-tree/neo-tree.nvim`
- **Fuzzy finder**: `nvim-telescope/telescope.nvim`
- **Treesitter**: `nvim-treesitter/nvim-treesitter`

### Editing UX

- **Autopairs**: `windwp/nvim-autopairs`
- **Surround**: `kylechui/nvim-surround`
- **Commenting**: `terrortylor/nvim-comment`
- **Folding UI**: `kevinhwang91/nvim-ufo`
- **EditorConfig**: `gpanders/editorconfig.nvim`
- **Embedded TODO highlights**: `folke/todo-comments.nvim`
- **Base64 helper**: `taybart/b64.nvim`
- **Terminal**: `akinsho/toggleterm.nvim`

### Diagnostics

- **Diagnostics list**: `folke/trouble.nvim`
- **Symbols outline**: `simrat39/symbols-outline.nvim`

### LSP + completion

- **LSP**: `neovim/nvim-lspconfig` (configured via Neovim 0.11 API: `vim.lsp.config` + `vim.lsp.enable`)
- **Mason**: `mason-org/mason.nvim` + `mason-org/mason-lspconfig.nvim`
- **Completion**: `hrsh7th/nvim-cmp` (+ sources)
- **Signature help**: `ray-x/lsp_signature.nvim`

Configured servers (see `lua/configs/lsp/languages/`):
- `lua_ls`
- `gopls`
- `pylsp`
- `solargraph`
- `rust_analyzer`

---

## LSP layout (important)

- **Entrypoint**: `lua/configs/lsp/init.lua`
  - sets up **format-on-save** using `LspAttach` (buffer-local; only if the attached client supports formatting)
  - loads all server configs from `lua/configs/lsp/languages/init.lua`

- **Shared helpers**: `lua/configs/lsp/lsp.lua`
  - `on_attach` (keymaps per-buffer)
  - `capabilities` (cmp + foldingRange for ufo)

---

## Quirks / gotchas (by design)

- **Format on save**
  - Enabled when an LSP client that supports `textDocument/formatting` attaches
  - Implemented in `lua/configs/lsp/init.lua`

- **Compatibility shims**
  - Some plugins still call deprecated Neovim LSP functions.
  - We provide shims in `lua/core/init.lua` to avoid warning spam:
    - `vim.lsp.get_active_clients` → `vim.lsp.get_clients`
    - `vim.lsp.buf_get_clients` → `vim.lsp.get_clients({bufnr=...})`

- **Telescope finds hidden files**
  - `<leader>ff` uses `find_files({ hidden = true })`

- **Theme setting**
  - The colorscheme is applied from the theme plugin spec (`lua/plugins/ui.lua`).
  - Put highlight overrides in `lua/ui/colors.lua`.

---

## Keybindings (leader = `<Space>`)

All keybindings live in `lua/core/mappings.lua`.

### General

- **`<leader><leader>`**: alternate file (`<C-^>`)
- **Arrow keys**: disabled in normal mode
- **`<C-h/j/k/l>`**: move between windows
- **`<leader>c`** (visual): copy to system clipboard (`"+y`)
- **`<Esc>`**: clear search highlight (`:noh`)

### File explorer (neo-tree)

- **`<leader>e`**: toggle neo-tree (float)
- **`<leader>E`**: toggle neo-tree (left)

### Telescope

- **`<leader>ff`**: find files (includes hidden)
- **`<leader>fg`**: live grep
- **`<leader>fb`**: buffers
- **`<leader>fh`**: help tags

### LSP

- **`<leader>rr`**: `:LspRestart`

Also, when an LSP attaches, per-buffer mappings are set in `lua/configs/lsp/lsp.lua` (e.g. `gd`, `K`, `gr`, `[d`, `]d`, etc.).

### Base64

- **`<leader>be`** (visual): encode selection
- **`<leader>bd`** (visual): decode selection

---

## Common commands

### lazy.nvim

- `:Lazy sync`
- `:Lazy clean`
- `:Lazy profile`

### Mason

- `:Mason`

---

## How to change things safely

### Add a new plugin

- Add it to the appropriate file in `lua/plugins/` (or create a new module if it’s a new area)
- Put configuration in `lua/configs/<plugin>.lua`
- Run `:Lazy sync`

### Add a new LSP server

- Add a new file under `lua/configs/lsp/languages/<server>.lua`
- Require it from `lua/configs/lsp/languages/init.lua`

---

## Troubleshooting

- **Theme looks wrong**: ensure your terminal supports truecolor; we enable it via `vim.opt.termguicolors = true` in `lua/core/options.lua`.
- **Deprecation warnings**: run `:checkhealth vim.deprecated` and/or update plugins; shims in `lua/core/init.lua` silence common ones.
