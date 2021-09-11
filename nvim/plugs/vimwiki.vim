let s:vimwiki_root = "D:/dotfiles/wiki"
let g:vimwiki_list = [{
					\ 'path': s:vimwiki_root ."/vimwiki/",
					\ 'path_html': s:vimwiki_root ."/vimwiki_html/content",
					\ 'custom_wiki2html': s:vimwiki_root .'/wiki2html.py',
                    \ 'syntax': 'markdown',
					\ 'ext': '.md',
					\'template_default':'markdown',
					\'template_path':s:vimwiki_root ."/template/"
					\}]
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 1
nmap <leader>wl <Plug>VimwikiFollowLink
nnoremap <leader>wc :VimwikiAll2HTML<CR>
"use this to get back <TAB> functionality in markdown files
let g:vimwiki_key_mappings = { 'table_mappings': 0 }
let g:vimwiki_url_maxsave=0
let g:vimwiki_conceallevel=0
