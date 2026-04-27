# Neovim Configuration

Personal Neovim configuration using Neovim's built-in `vim.pack` package manager.

## Requirements

- Neovim 0.12 or newer
- `git`
- `rg` for picker grep

Mason installs these LSP servers automatically:

- `basedpyright`
- `ruff`
- `lua_ls`
- `ts_ls`

## Install

```sh
git clone https://github.com/<your-user>/<your-repo>.git ~/.config/nvim
nvim
```

Plugins are declared in `lua/plugins/init.lua` and pinned in `nvim-pack-lock.json`.
