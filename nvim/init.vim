let mapleader = "\<Space>"

source $LOCALAPPDATA/nvim/general/augroups.vim
source $LOCALAPPDATA/nvim/plugs/plugins.vim
source $LOCALAPPDATA/nvim/plugs/coc.vim
source $LOCALAPPDATA/nvim/plugs/lightline_v1.vim
source $LOCALAPPDATA/nvim/plugs/telescope_plug.vim
source $LOCALAPPDATA/nvim/plugs/firenvim.vim
source $LOCALAPPDATA/nvim/plugs/markdown.vim
source $LOCALAPPDATA/nvim/general/general.vim
source $LOCALAPPDATA/nvim/general/leader.vim
source $LOCALAPPDATA/nvim/general/keybindings.vim
source $LOCALAPPDATA/nvim/languages/languages.vim
"set path+=**
hi Normal ctermbg=none guibg=none
"wrap backspace
set backspace=indent,eol,start
hi Comment gui=italic cterm=italic
hi htmlArg gui=italic cterm=italic
" cursor ----- {{{
" Cursor in terminal
" https//vim.fandom.com/wiki/Configuring_the_cursor
" 1 or 0 -> blinking block
" 2 solid block
" 3 -> blinking underscore
" 4 solid underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar
if &term =~ '^xterm'
" normal mode ||
let &t_EI .= "\<Esc>[1 q"
" replace mode _
let &t_SR.="\e[4 q"
" insert mode |
let &t_SI .= "\<Esc>[6 q"
endif
"
" }}}


