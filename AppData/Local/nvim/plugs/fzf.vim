" fzf ----- {{{
" put search prompt at the top
 let $FZF_DEFAULT_OPTS ='--reverse'
 nnoremap <leader>fg :GFiles<CR>
 nnoremap <leader>ff :Files<CR>
 nnoremap <leader>fb :Buffers<CR>
let g:fzf_preview_window = []
" let g:fzf_action = {
  " \ 'ctrl-t': 'tab split',
  " \ 'ctrl-s': 'split',
  " \ 'ctrl-v': 'vsplit'
  " \}
" }}}


