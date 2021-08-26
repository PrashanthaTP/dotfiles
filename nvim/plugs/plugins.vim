" plugins ----- {{{
call plug#begin("$VIM/nvim/plugged")
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'

" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'

Plug 'itchyny/lightline.vim'

Plug 'preservim/nerdcommenter'

Plug 'tpope/vim-surround'

"Plug 'mhinz/vim-startify'

"Plug 'jlanzarotta/bufexplorer'
" If you have nodejs and yarn
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
"
" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}


Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

call plug#end()
" }}}

" UltiSnips ----- {{{
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsExpandTrigger = '<f5>' "to aviod overlapping with coc mapping
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" }}}

" gruvbox ----- {{{
if (has("termguicolors"))
 set termguicolors
endif
set background=dark
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
colorscheme gruvbox-material
" }}}

" NERDTree ----- {{{
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 0 " hide helper
let g:NERDTreeIgnore = ['^node_modules$','\.git$', '\.idea$', '\.vscode$', '\.history$'] " ignore node_modules to increase load speed
let g:NERDTreeStatusline = '' " set to empty to use lightline
" " Toggle
"noremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <silent> <leader>t :NERDTreeToggle<CR>
nnoremap <leader>y :NERDTreeFind<bar> :vertical resize 35<CR>
" " Close window if NERDTree is the last one
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" " Map to open current file in NERDTree and set size
"nnoremap <leader>pv :NERDTreeFind<bar> :vertical resize 45<CR>

" NERDTree Syntax Highlight
" " Enables folder icon highlighting using exact match
let g:NERDTreeHighlightFolders = 1
" " Highlights the folder name
let g:NERDTreeHighlightFoldersFullName = 1
" " Color customization
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
" " This line is needed to avoid error
let g:NERDTreeExtensionHighlightColor = {}
" " Sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['css'] = s:blue
" " This line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor = {}
" " Sets the color for .gitignore files
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange
" " This line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor = {}
" " Sets the color for files ending with _spec.rb
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red
" " Sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFolderSymbolColor = s:beige
" " Sets the color for files that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue

" NERDTree Git Plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
" }}}

" SUPPRESS WARNINGS ----- {{{
"autocmd VimEnter * unlet g:NERDTreeUpdateOnCursorHold
"autocmd VimEnter * unlet g:NERDTreeIndicatorMapCustom
" }}}

" fzf ----- {{{
" put search prompt at the top
" let $FZF_DEFAULT_OPTS ='--reverse'
" nnoremap <C-p> :Files<CR>
" let g:fzf_action = {
  " \ 'ctrl-t': 'tab split',
  " \ 'ctrl-s': 'split',
  " \ 'ctrl-v': 'vsplit'
  " \}
" }}}

" Nerd Commenter ----- {{{
" " Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" " Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" " Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" " Map ++ to call NERD Commenter and use iTerm key bindings
" " to bind Ctmd+/ to ++
vmap <C-_> <plug>NERDCommenterToggle
nmap <C-_> <plug>NERDCommenterToggle
" }}}

" ALE ----- {{{
" ALE (Asynchronous Lint Engine)
" let g:ale_fixers = {
 " \ 'javascript': ['eslint']
 " \ }
" let g:ale_sign_error = '❌'
" let g:ale_sign_warning = '⚠️'
" let g:ale_fix_on_save = 1

" }}}

" vim-startify ----- {{{
"let g:startify_custom_header += [
    ""\'████████╗██████╗ ██████╗ ',
    ""\'╚══██╔══╝██╔══██╗██╔══██╗',
    ""\'   ██║   ██████╔╝██████╔╝',
   "" \'   ██║   ██╔═══╝ ██╔═══╝ ',
    """"\'   ██║   ██║     ██║     ',
    ""\'   ╚═╝   ╚═╝     ╚═╝     ',
    ""\]
  ""\ startify#pad(split(system('figlet -w 100 TPP'), \n))
" }}}
