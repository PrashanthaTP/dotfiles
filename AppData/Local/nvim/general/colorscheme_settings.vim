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
let g:gruvbox_material_transparent_background = 1
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

colorscheme gruvbox
"endif

" }}}
"

