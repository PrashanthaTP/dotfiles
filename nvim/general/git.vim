function Set_git_settings()
	"colorscheme gruvbox
	"below line is important : gruvbox-material doesn't work
	let g:lightline.colorscheme='gruvbox'
endfunction

if &diff
	set nornu
	"https://stackoverflow.com/questions/2019281/load-different-colorscheme-when-using-vimdiff
	highlight! DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
	highlight! DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
	highlight! DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
	highlight! DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
	" Fix the difficult-to-read default setting for diff text highlighting.  The
	" bang (!) is required since we are overwriting the DiffText setting. The highlighting
	" for \"Todo" also looks nice (yellow) if you don't like the \"MatchParen" colors.
	highlight! link DiffText MatchParen
	"no transperant bg : set to default colors from gruvbox"
	"found out using :hi Normal
	highlight! Normal ctermfg=223 ctermbg=235 guifg=#ebdbb2 guibg=#282828
	:call Set_git_settings()
endif


augroup GITCOMMIT_SETTINGS
	"https://vi.stackexchange.com/questions/4343/can-i-detect-whether-current-vim-instance-is-launched-by-git
	autocmd!
	autocmd FileType gitcommit,gitrebase silent :call Set_git_settings()
augroup END
