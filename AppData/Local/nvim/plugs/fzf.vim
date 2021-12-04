" fzf ----- {{{
"https://github.com/junegunn/fzf.vim#example-customizing-files-command
" put search prompt at the top
let $FZF_DEFAULT_COMMAND="rg --files --hidden --follow --no-ignore-vcs --glob \!{.git,.svn,.hg} --glob \!node_modules"
let $FZF_DEFAULT_OPTS='--ansi --reverse --bind ctrl-a:select-all --preview="bat --color=always {1}"'
set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow\ --ignore-vcs

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--preview', 'bat --color=always {1}']}, <bang>0)
"let g:fzf_preview_window = []
" let g:fzf_action = {
  " \ 'ctrl-t': 'tab split',
  " \ 'ctrl-s': 'split',
  " \ 'ctrl-v': 'vsplit'
  " \}
" }}}

" CTRL-A CTRL-Q to select all and build quickfix list

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

function! s:format_qf_line(line)
  let parts = split(a:line, ':')
  return { 'filename': parts[0]
         \,'lnum': parts[1]
         \,'col': parts[2]
         \,'text': join(parts[3:], ':')
         \ }
endfunction

function! s:qf_to_fzf(key, line) abort
  let l:filepath = expand('#' . a:line.bufnr . ':p')
  return l:filepath . ':' . a:line.lnum . ':' . a:line.col . ':' . a:line.text
endfunction

function! s:fzf_to_qf(filtered_list) abort
  let list = map(a:filtered_list, 's:format_qf_line(v:val)')
  if len(list) > 0
    call setqflist(list)
    copen
  endif
endfunction

command! FzfQF call fzf#run({
      \ 'source': map(getqflist(), function('<sid>qf_to_fzf')),
      \ 'down':   '20',
      \ 'sink*':   function('<sid>fzf_to_qf'),
      \ 'options': '--reverse --multi --bind=ctrl-a:select-all,ctrl-d:deselect-all --prompt "quickfix> "',
      \ })

 nnoremap <leader>fg :GFiles<CR>
 nnoremap <leader>ff :Files<CR>
 nnoremap <leader>fb :Buffers<CR>
 nnoremap <leader>fq :FzfQF<CR>
