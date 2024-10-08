# ⛩️ MaxVim ⛩️

<img width="630" alt="Screenshot 2024-05-29 at 15 32 21" src="https://github.com/MaxManis/maxVim/assets/89999954/155a4146-41ca-44e1-8cf7-ab0adbb30012">

## Overview

MaxVim is a custom configuration for NeoVim created from scratch.

## Installation

0. Install NeoVim first:

```bash
brew install neovim
```

1. cd to config dir:

```bash
cd && cd .config
```

2. Clone git repo with config:

```bash
git clone git@github.com:MaxManis/maxVim.git
```

3. Create a soft link to your Nvim config:

```bash
rm nvim && ln -s ./maxNvim nvim
```

4. Start your Nvim (you should see Lazy installing all the plugings):

```bash
nvim
```

**Installation Tips:**

- `brew install ripgrep` - for installing repgrep

## Health Check

`:LspInfo` to check your LSPs are available and configured successfully

`:Mason` to check your Formatters and LSPs are successfully installed (or install missing if needed here)

`:h` for any help

`:checkhealth` run vim health checker

## Key Mappings

### Movements

Move cursor faster with `<Tab>` + `hjkl` keys:

- **Go Left 5 times:** `<Tab>h`: `hhhhh`
- **Go Lower 5 times:** `<Tab>j`: `jjjjj`
- **Go Upper 5 times:** `<Tab>k`: `kkkkk`
- **Go Right 5 times:** `<Tab>l`: `lllll`

### Window Navigation

Move to window using the `<ctrl>` + `hjkl` keys:

- **Go to Left Window:** `<C-h>`: `<C-w>h`
- **Go to Lower Window:** `<C-j>`: `<C-w>j`
- **Go to Upper Window:** `<C-k>`: `<C-w>k`
- **Go to Right Window:** `<C-l>`: `<C-w>l`

### Diagnostics

- **Line Diagnostics:** `<leader>cd`: `vim.diagnostic.open_float`
- **Next Diagnostic:** `]d`: `diagnostic_goto(true)`
- **Previous Diagnostic:** `[d`: `diagnostic_goto(false)`
- **Next Error:** `]e`: `diagnostic_goto(true, "ERROR")`
- **Previous Error:** `[e`: `diagnostic_goto(false, "ERROR")`
- **Next Warning:** `]w`: `diagnostic_goto(true, "WARN")`
- **Previous Warning:** `[w`: `diagnostic_goto(false, "WARN")`

### Neotree (File System)

- **Toggle Neotree:** `<leader>fs`: `:Neotree toggle <CR>`

### Git Blame

- **Toggle Git Blame:** `<leader>b`: `:ToggleBlameLine<CR>`

### Formatting

- **Format File:** `<leader>gf`: `vim.lsp.buf.format`

### Telescope

- **Find Files:** `<leader>ff`: `builtin.find_files`
- **Live Grep (Grep in Files):** `<leader>fg`: `builtin.live_grep`
- **Buffers:** `<leader>fb`: `builtin.buffers`
- **Help Tags:** `<leader>fh`: `builtin.help_tags`

### Oil.nvim

- map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

### General

- **Quit ALL (close all):** `<leader>qq`: `<cmd>qa<cr>`

## Custom commands

### Linting

- `:EslintFix` - **run ESLint for current open file with --fix option** (`npx eslint ./file --fix`)

### Git

- `:GitDiff` - **Git Diff** (`git diff`)

- `:GitStatus` - **Git Status** (`git status`)

### Other

- `:FilePwd` - **Get File Path** (`echo <file-path>`)

## Config structure:

All the config is under `./lua` dir inside of the root dir `</maxVim/lua>`.
You can find all the imports in `./<maxVim>/init.lua` file.

### ./lua dir structure

- **base.lua** - base Vim settings and configs

- **autocmd.lua** - autocommads that run in the background deppends on some actions or events (`BufWritePre`, `VimEnter`, etc)

- **commands.lua** - custom commands for Vim that you can run right in the editor (`EslintFix`)

- **keymap.lua** - keys remapping and shortcuts are here

- **plugins/<plugin_name>.lua** - all of the plugins configs are inside `./plugins` dir and splited to a separate files based on plugin (like `none-ls`, `lualine`) or baseed on feature (like `lsp-config`, `completions`, `comments` etc)

## Plugins

### UI Enhancements

- **[alpha-nvim](https://github.com/goolord/alpha-nvim)**: A fast and fully programmable greeter for Neovim.
- **[catppuccin](https://github.com/catppuccin/nvim)**: A soothing and visually appealing color scheme for Neovim.
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)**: A blazing fast and easy to configure Neovim statusline plugin.
- **[nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)**: Adds file type icons to Neovim plugins such as `lualine` and `telescope`.

### Completion and Snippets

- **[cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)**: LSP source for `nvim-cmp`, providing LSP-based completions.
- **[cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)**: LuaSnip completion source for `nvim-cmp`.
- **[friendly-snippets](https://github.com/rafamadriz/friendly-snippets)**: A collection of snippets for multiple languages.
- **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)**: A snippet engine for Neovim written in Lua.
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)**: A completion plugin for Neovim, written in Lua.

### Language Server Protocol (LSP)

- **[mason.nvim](https://github.com/williamboman/mason.nvim)**: Portable package manager for Neovim that supports LSP servers, DAP servers, linters, and formatters.
- **[mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)**: Extension to `mason.nvim` that makes it easier to use lspconfig with Mason.
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)**: Quickstart configurations for the Neovim LSP client.
- **[none-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)**: Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
- **[none-ls-extras.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)**: Extra sources for `none-ls.nvim`.

### File Management

- **[neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)**: A Neovim plugin to browse the file system and other tree structures.
- **[nvim-blame-line](https://github.com/ahmedkhalf/project.nvim)**: Show git blame information in the Neovim statusline.
- **[oil.nvim](https://github.com/stevearc/oil.nvim)**: A Neovim plugin to edit the file system and files as a regular Vim Buffer (just as a file).

### Treesitter

- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Nvim Treesitter configurations and abstraction layer.

### Telescope

- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)**: A highly extendable fuzzy finder over lists.
- **[telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim)**: Telescope extension that provides a UI select interface.

### Utility

- **[plenary.nvim](https://github.com/nvim-lua/plenary.nvim)**: All the lua functions you don't want to write twice.
- **[nui.nvim](https://github.com/MunifTanjim/nui.nvim)**: UI component library for Neovim.
- **[vim-illuminate](https://github.com/RRethy/vim-illuminate)**: Plugin for highlighting code under cursore.

### Comments

- **[todo-comments.nvim](https://github.com/folke/todo-comments.nvim)**: Highlight, list, and search todo comments in your projects.

### Plugin Manager

- **[lazy.nvim](https://github.com/folke/lazy.nvim)**: A modern, fast, and extensible plugin manager for Neovim.
