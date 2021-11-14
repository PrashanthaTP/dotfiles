"set path+=**

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
"
source $LOCALAPPDATA/nvim/plugs/ultisnips.vim
source $LOCALAPPDATA/nvim/plugs/vimwiki.vim
source $LOCALAPPDATA/nvim/plugs/vimstartify.vim
" }}}
"
"====================================================="
source $LOCALAPPDATA/nvim/general/cursor.vim
source $LOCALAPPDATA/nvim/general/general.vim
source $LOCALAPPDATA/nvim/general/leader.vim
source $LOCALAPPDATA/nvim/general/keybindings.vim

source $LOCALAPPDATA/nvim/languages/languages.vim

source $LOCALAPPDATA/nvim/general/git.vim

source $LOCALAPPDATA/nvim/helpers/commands.vim

"hi Normal ctermbg=NONE guibg=NONE
"
hi Comment gui=italic cterm=italic
hi htmlArg gui=italic cterm=italic

let g:netrw_banner = 0
"let g:netrw_liststyle=3
let g:netrw_winsize=30
let g:netrw_list_hide = '^\.\.\=/\=$,.DS_Store,.idea,.git,__pycache__,venv,node_modules/,*\.o,*\.pyc,.*\.swp'
"let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
"let g:netrw_hide = 1
"let g:netrw_browse_split=2
"let g:netrw_list_hide= netrw_gitignore#Hide()
			""\.',.*\.swp$'
			""\.',*\.git'
			""\.',*\node_modules'
"
"let g:netrw_list_hide= '.*\.swp$'
"let g:netrw_list_hide= netrw_gitignore#Hide().'.*\.swp$'
