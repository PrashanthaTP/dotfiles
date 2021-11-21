"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:colorscheme='default'

" gruvbox ----- {{{
if (has("termguicolors"))
 set termguicolors
endif

set background=dark
set t_Co=256
" colorscheme gruvbox
" au Colorscheme gruvbox :hi Keyword gui=italic cterm=italic
"https://github.com/sainnhe/gruvbox-material/blob/master/doc/gruvbox-material.txt
"soft,medium,hard
"let g:gruvbox_material_background = 'medium'
"let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1
"let g:gruvbox_material_statusline_style = 'original'
let g:gruvbox_material_diagnostic_virtual_text = 'colored'
let g:gruvbox_material_better_performance = 1
"configuration must be dont before applying colorscheme
"
"if &filetype!='gitcommit'
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_bold=1
let g:gruvbox_italic=1

colorscheme gruvbox-material
"endif

" }}}
"

