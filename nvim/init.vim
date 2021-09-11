let mapleader = "\<Space>"

source $LOCALAPPDATA/nvim/general/augroups.vim

"====================================================="
" plugins ----- {{{
source $LOCALAPPDATA/nvim/plugs/plugins.vim

source $LOCALAPPDATA/nvim/general/colorscheme_settings.vim

source $LOCALAPPDATA/nvim/plugs/ale.vim
source $LOCALAPPDATA/nvim/plugs/coc.vim
source $LOCALAPPDATA/nvim/plugs/firenvim.vim
source $LOCALAPPDATA/nvim/plugs/fzf.vim
source $LOCALAPPDATA/nvim/plugs/goyo.vim
source $LOCALAPPDATA/nvim/plugs/lightline_v1.vim
source $LOCALAPPDATA/nvim/plugs/markdown.vim
source $LOCALAPPDATA/nvim/plugs/nerdtree.vim
source $LOCALAPPDATA/nvim/plugs/telescope_plug.vim
source $LOCALAPPDATA/nvim/plugs/ultisnips.vim
source $LOCALAPPDATA/nvim/plugs/vimwiki.vim
source $LOCALAPPDATA/nvim/plugs/vimstartify.vim
" }}}
"====================================================="
source $LOCALAPPDATA/nvim/general/cursor.vim
source $LOCALAPPDATA/nvim/general/general.vim
source $LOCALAPPDATA/nvim/general/leader.vim
source $LOCALAPPDATA/nvim/general/keybindings.vim

source $LOCALAPPDATA/nvim/languages/languages.vim

source $LOCALAPPDATA/nvim/general/git.vim

source $LOCALAPPDATA/nvim/helpers/commands.vim


"set path+=**
hi Normal ctermbg=none guibg=none
hi Comment gui=italic cterm=italic
hi htmlArg gui=italic cterm=italic
