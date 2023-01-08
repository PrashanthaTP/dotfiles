export GVIMINIT='let $MYGVIMRC=has("nvim")?$MYGVIMRC:"$HOME/.config/vim/vimrc" | source $MYGVIMRC'
#export VIMINIT='let $MYVIMRC=has("nvim")?$MYVIMRC:"$HOME/.config/vim/vimrc" | source $MYVIMRC'
#export VIMINIT='let $MYVIMRC=has("nvim")?"$LOCALAPPDATA/nvim/init.vim":"$HOME/.config/vim/vimrc" | source $MYVIMRC'
export VIMINIT='let $MYVIMRC=has("nvim")?"$HOME/.config/nvim-0.7.0/init.lua":"$HOME/.config/vim/vimrc" | source $MYVIMRC'
export ZDOTDIR=$HOME/.config/zsh
export GOROOT="/d/Applications/Golang/installation"

add_to_path(){
    export PATH+=:"$1"
}
#add bat program
#https://github.com/sharkdp/bat#using-bat-on-windows
add_to_path '/d/Applications/Unix/bat-v0.18.3-x86_64-pc-windows-gnu/bat-v0.18.3-x86_64-pc-windows-gnu'
add_to_path '/d/Applications/Unix/Git/usr/bin'
add_to_path '/d/Applications/Emacs/emacs-27.2-x86_64/bin'

add_to_path "$HOME/.config/scripts"

# Golang
add_to_path "/d/Applications/Golang/installation/bin"
add_to_path "D:/Applications/Golang/gopath/bin"

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

export PROJ_DIR="/E/Users/VS_Code_Workspace/"
export DIARY_DIR="/D/Studies/diary"

export VIMINIT='let $MYVIMRC=has("nvim")?"$HOME/.config/nvim-0.7.0/init.lua":"$HOME/.config/vim/vimrc" | source $MYVIMRC'

export WT_SETTINGS="$HOME/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json"

export MANPATH="$MANPATH:/d/Applications/Git Cli/git-manpages-2.37.1.tar:/d/Applications/Unix/manpages/man-pages-5.13:/d/Applications/Unix/manpages/man-pages-posix-2017-a.tar/man-pages-posix-2017"
