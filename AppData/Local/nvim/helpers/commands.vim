function GET_DATE()
	" let l:date = system('date | sed 1q')
	" put =l:date
	exe ":normal idate"
	put =strftime(\"%b %d, %Y, %H:%M:%S\")
endfunction

command! InsertDate call GET_DATE()

function s:MD2PDF()
	" use &filetype"
	if expand("%:e")!="md"
		return
	endif
	"silent! :call system("pandoc ")
	execute "!pandoc \"".expand("%:p").
				\"\" -o ".expand("%:r").".pdf"
	echomsg "Pdf conversion successful!"
endfunction

augroup PANDOC
	autocmd!
"	command! Pandoc silent! :!pandoc % -o %:r.pdf
	command! Pandoc  :call <SID>MD2PDF()

augroup end

" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

function! SelectaBuffer()
  let bufnrs = filter(range(1, bufnr("$")), 'buflisted(v:val)')
  let buffers = map(bufnrs, 'bufname(v:val)')
  call FzyCommand('echo "' . join(buffers, "\n") . '"',  ":b")
endfunction

if !has('nvim')
	" Fuzzy select a buffer. Open the selected buffer with :b.
	nnoremap <leader>b :call SelectaBuffer()<cr>
endif
