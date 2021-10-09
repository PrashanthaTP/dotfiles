" also see augroups.vim
" cursor ----- {{{
" Cursor in terminal
" https//vim.fandom.com/wiki/Configuring_the_cursor
" 1 or 0 -> blinking block
" 2 solid block
" 3 -> blinking underscore
" 4 solid underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar
if &term =~ '^xterm'
	" normal mode ||
	" .= means shorthand for appending : see help .=
	let &t_EI .= "\<Esc>[1 q"
	" replace mode _
	let &t_SR .= "\e[4 q"
	" insert mode |
	let &t_SI .= "\<Esc>[6 q"
endif
"
" }}}

