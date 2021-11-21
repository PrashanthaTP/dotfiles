" lightline ----- {{{
" Dependencies:
" + Fugitive
" + Gruvbox Material
" Lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox_material',
      \ 'active': {
		  \   'left': [ [ 'mode', 'paste' ],['readonly', 'modified','fugitive']],
      \   'right' : [['cocstatus', 'currentfunction'],['lineinfo'], ['percent'],['filetype','fileencoding']]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
	  \   'fugitive':'FugitiveGetBranchName'
      \ },
   \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
     \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }

function! FugitiveGetBranchName()
	" return  fugitive#statusline()
	let l:branchname = FugitiveHead()
	return strlen(l:branchname)>0 ? "\uE0A0".FugitiveHead() :  ''
endfunction
" }}}


