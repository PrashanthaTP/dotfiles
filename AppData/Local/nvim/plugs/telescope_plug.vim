" Find files using Telescope command-line sugar.
"https://github.com/nvim-telescope/telescope.nvim/issues/1144
nnoremap <leader>tf <cmd>Telescope find_files<cr>
nnoremap <leader>tg <cmd>Telescope git_files<cr>
nnoremap <leader>tl <cmd>Telescope live_grep<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>

lua << EOF require('telescope').setup{ defaults = { vimgrep_arguments = { 'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case', '--ignore-file', '.gitignore' }}}

