" python ----- {{{
let g:python3_host_prog = "$PYTHON_HOME/Python/python.exe"
" }}}
" cpp ----- {{{
"autocmd vimEnter *.cpp map <F8> :w <CR> :!clear ; g++ --std=c++17 %; if [ -f a.out ]; then time ./a.out; rm a.out; fi <CR>
"map <F8> :!g++ % -o %:r && \./%:r <CR>
"
augroup languages
	autocmd!
	autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -std=c++11 -O2 -Wall % -o %:r && %:r.exe <CR>
	 autocmd filetype javascript,javascript_react UltiSnipsAddFiletypes javascript.javascript_react.html
"	 autocmd FileType javascript_react UltiSnipsAddFiletypes html
" autocmd FileType javascript,javascriptreact,typescript,typescriptreact
  " \ UltiSnipsAddFiletypes javascript.javascriptreact.typescript.typescriptreact
augroup END
"
" }}}

