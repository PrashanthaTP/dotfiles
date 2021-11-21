" Find files using Telescope command-line sugar.
"https://github.com/nvim-telescope/telescope.nvim/issues/1144
nnoremap <leader>tf :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({previewer=false}))<cr>
nnoremap <leader>tg <cmd>Telescope git_files<cr>
nnoremap <leader>tl <cmd>Telescope live_grep<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>


"lua << EOF
"require('telescope').setup{ defaults = { vimgrep_arguments = { 'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case', '--ignore-file', '.gitignore' }}}
"
"EOF

lua << EOF
--local previewers = require('telescope.previewers')
--local Job = require('plenary.job')
--local new_maker = function(filepath, bufnr, opts)
  --filepath = vim.fn.expand(filepath)
  --Job:new({
    --command = 'file',
    --args = { '--mime-type', '-b', filepath },
    --on_exit = function(j)
      --local mime_type = vim.split(j:result()[1], '/')[1]
      --if mime_type == "text" then
        --previewers.buffer_previewer_maker(filepath, bufnr, opts)
      --else
        ---- maybe we want to write something to the buffer here
        --vim.schedule(function()
          --vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { 'BINARY' })
        --end)
      --end
    --end
  --}):sync()
--end

--require('telescope').setup {
 -- defaults = {
   -- buffer_previewer_maker = new_maker,
	--vimgrep_arguments = { 'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case', '--ignore-file', '.gitignore' }
  --}
--}

EOF
