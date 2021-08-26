"Firenvim
"
"if you want to make Firenvim ignore <C-1> and <C-2> in normal mode and <C--> in all modes to let your browser handle them, you should define ignoreKeys like this:ignoreKeys
if exists('g:started_by_firenvim')
		  set laststatus=0
		let g:firenvim_config = {
			\ 'globalSettings': {
				\ 'alt': 'all',
			\  },
			\ 'localSettings': {
				\ '.*': {
					\ 'cmdline': 'neovim',
					\ 'content': 'text',
					\ 'priority': 0,
					\ 'selector': 'textarea',
					\ 'takeover': 'always',
				\ },
			\ }
		\ }
		"https://github.com/glacambre/firenvim/issues/321
		" Setup a shortcut variable to the per site settings array
 		let fc = g:firenvim_config['localSettings']
		"let g:firenvim_config = { 'localSettings': s:fc }

		" Configure all sites
		let fc['.*'] = { 'selector': 'textarea, div[role="textbox"]', 'priority': 0, 'takeover': 'never' }
		let fc['https?://github.com/*'] = { 'selector': 'textarea', 'priority': 1,'takeover':'never' }
		"let fc['.*'] = { 'selector': 'textarea' }
		au BufEnter github.com_*.txt set filetype=markdown
else
	set laststatus=2
endif
