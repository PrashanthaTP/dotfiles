" plugins ----- {{{
call plug#begin("$VIM/nvim/plugged")
	"https://github.com/junegunn/vim-plug#plug-options
	Plug 'morhetz/gruvbox'
	"Plug 'sainnhe/gruvbox-material'
	" NERD tree will be loaded on the first invocation of NERDTreeToggle command"
	Plug 'preservim/nerdtree',{ 'on': 'NERDTreeToggle'}
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-commentary'
	Plug 'ryanoasis/vim-devicons'
	" Track the engine.
	Plug 'SirVer/ultisnips'
	" Snippets are separated from the engine. Add this if you want them:
	Plug 'honza/vim-snippets'
	"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	"Plug 'junegunn/fzf.vim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	"Plug 'w0rp/ale'
	Plug 'sheerun/vim-polyglot'
	Plug 'itchyny/lightline.vim'
	"Plug 'preservim/nerdcommenter'
	Plug 'tpope/vim-surround'

	Plug 'vimwiki/vimwiki'

	Plug 'mhinz/vim-startify'

	"Plug 'jlanzarotta/bufexplorer'
	" If you have nodejs and yarn
	"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
	"
	" If you don't have nodejs and yarn
	" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
	" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

	Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
	Plug 'junegunn/goyo.vim'

call plug#end()
" }}}
