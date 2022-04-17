# Neovim Config

> Requires [Neovim Version 0.6.0](https://github.com/neovim/neovim/releases/tag/v0.6.0)

- Last commit to support [Neovim 0.5.1](https://github.com/neovim/neovim/releases/tag/v0.6.0jj) : [`714d03e4eb6014a4f7657db41ad89ef513579038`](https://github.com/PrashanthaTP/dotfiles/tree/714d03e4eb6014a4f7657db41ad89ef513579038)

> **Remember to update plugins**
>
> Requires update for nvim-telescope,nvim-lspconfig,nvim-cmp,nvim-lualine.
>
> nvim-telescope last commit to support Neovim 0.5.1 : * (HEAD detached at [80cdb00](https://github.com/nvim-telescope/telescope.nvim/commit/80cdb00))
> 

```bash
$ nvim --version

NVIM v0.6.0
Build type: RelWithDebInfo
LuaJIT 2.1.0-beta3
Compiled by runneradmin@fv-az152-703

Features: -acl +iconv +tui
See ":help feature-compile"

  system vimrc file: "$VIM\sysinit.vim"
  fall-back for $VIM: "C:/Program Files/nvim/share/nvim"

Run :checkhealth for more info
```
## Help

### Lua

+ [nvim-lua-guide](https://github.com/nanotee/nvim-lua-guide)
+ [nvim :help lua](https://neovim.io/doc/user/lua.html)

### Language Server Protocol [[Official Page]](https://microsoft.github.io/language-server-protocol/)

+ [LSP plugin](https://github.com/neovim/nvim-lspconfig) and [Servers configurations](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
+ [nvim-cmp](https://github.com/hrsh7th/nvim-cmp), [nvim-cmp completion
  mappings wiki](https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings)
  [nvim-cmp menu appearance](https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance)

### Autocommands

- Use of `++nested` : [see vimhelp](https://vimhelp.org/autocmd.txt.html#autocmd-nested)

## For formatting with LSP

We can use [efm-langserver](https://github.com/mattn/efm-langserver) for code formatting.

+ [Example efm config : tomaskallup dotfiles](https://github.com/tomaskallup/dotfiles/blob/29177be3dc416842a3e9112520d4caa4b039728c/nvim/lua/plugins/nvim-lspconfig.lua#L138-L167) 

+ [Example efm config: martinsione dotfiles](https://github.com/martinsione/dotfiles/blob/3716969e12d663d9d7be432682f8fd5c022e44f1/src/.config/nvim/lua/modules/config/nvim-lspconfig/format.lua)

## Nvim Treesitter [[treesitter]](https://github.com/tree-sitter/tree-sitter) [[nvim-treesitter]](https://github.com/nvim-treesitter/nvim-treesitter)

Provides better syntax highlighting by wonderful parsing mechanism and if you are code-mad, amazing code control via `tree nodes`.

+ [nvim-treesitter instructions for Windows](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support)

## Lua Plugins

+ https://sbulav.github.io/vim/neovim-telescope-github/

