function GET_DATE()
	" let l:date = system('date | sed 1q')
	" put =l:date
	exe ":normal idate"
	put =strftime(\"%b %d, %Y, %H:%M:%S\")
endfunction

command! InsertDate call GET_DATE()

