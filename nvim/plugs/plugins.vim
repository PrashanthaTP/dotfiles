" plugins ----- {{{
call plug#begin("$VIM/nvim/plugged")
"https://github.com/junegunn/vim-plug#plug-options
Plug 'morhetz/gruvbox'
"Plug 'sainnhe/gruvbox-material'
" NERD tree will be loaded on the first invocation of NERDTreeToggle command"
Plug 'preservim/nerdtree',{ 'on': 'NERDTreeToggle'}
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
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
"Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'

Plug 'vimwiki/vimwiki'

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
