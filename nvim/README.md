# My Dotfiles ![](https://img.shields.io/badge/config%20for-nvim-blue?style=for-the-badge)

---

My setup for various applications.

## nvim :rocket:

### COC : Conquer of Completion

- `:CocCommand clangd.install ` (make sure clangd path is added to `:CocConfig`)
- `:CocInstall coc-clangd coc-css coc-emmet coc-eslint coc-html coc-java coc-jedi coc-json coc-lua coc-pairs coc-prettier coc-pyright coc-snippets coc-tsserver coc-vimlsp `
- quick tip :
  you can move to floating window using `C-w` commands

### Firenvim

#### Installation

- first follow installation instruction here : https://github.com/glacambre/firenvim
- to setup config jsons run
  ```bash
  $ nvim --headless "+call firenvim#install(0) | q"
  #or inside neovim
  :call firenvim#install(0)
  ```
- to allow only specific websites, follow here : https://github.com/glacambre/firenvim/issues/321
- set shortcut inside chrome://extensions/shortcuts for firenvim on focus
- other troubleshootings : https://github.com/glacambre/firenvim/blob/master/TROUBLESHOOTING.md
