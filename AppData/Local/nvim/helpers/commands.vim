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
