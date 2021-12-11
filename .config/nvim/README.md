# Neovim Config

> Requires [Neovim Version 0.5.1](https://github.com/neovim/neovim/releases/tag/v0.5.1)

> ✓ ➜ nvim --version
> NVIM v0.5.1
> Build type: RelWithDebInfo
> LuaJIT 2.1.0-beta3
> Compilation: C:/Program Files (x86)/Microsoft Visual
> Studio/2017/Enterprise/VC/Tools/MSVC/14.16.27023/bin/Hostx86/x64/cl.exe
> /DWIN32 /D_WINDOWS /W3 -DNVIM_TS_HAS_SET_MATCH_LIMIT /MD /Zi /O2 /Ob1
> /DNDEBUG /W3 -D_CRT_SECURE_NO_WARNINGS -D_CRT_NONSTDC_NO_DEPRECATE -DWIN32
> -D_WIN32_WINNT=0x0600 -DINCLUDE_GENERATED_DECLARATIONS
> -DNVIM_MSGPACK_HAS_FLOAT32 -DNVIM_UNIBI_HAS_VAR_FROM -DMIN_LOG_LEVEL=3
> -ID:/a/neovim/neovim/build/config -ID:/a/neovim/neovim/src
> -ID:/a/neovim/neovim/nvim-deps/usr/include
> -ID:/a/neovim/neovim/build/src/nvim/auto -ID:/a/neovim/neovim/build/include
> Compiled by runneradmin@fv-az152-633
>
> Features: -acl +iconv +tui
> See ":help feature-compile"
>
>  system vimrc file: "$VIM\sysinit.vim"
>  fall-back for $VIM: "C:/Program Files/nvim/share/nvim"
>
> Run :checkhealth for more info

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

