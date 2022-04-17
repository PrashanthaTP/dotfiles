##############################################################################
# THEME Settings
##############################################################################

# Import-Module posh-git
# Import-Module oh-my-posh
# Set-PoshPrompt -Theme paradox
#Invoke-Expression (oh-my-posh --init --shell pwsh --config "C://Users//Prashanth T P//Documents//WindowsPowerShell//my_custom_config_oh_my_posh.omp.json")
# Invoke-Expression (oh-my-posh --init --shell pwsh --config "$(scoop prefix oh-my-posh)//themes//jandedobbeleer.omp.json")
#nvoke-Expression (oh-my-posh --init --shell pwsh --config "$(scoop prefix oh-my-posh)//themes//paradox.omp.json")

 #Invoke-Expression (oh-my-posh --init --shell pwsh --config "$(scoop prefix oh-my-posh)//themes//avit.omp.json")
#Invoke-Expression (oh-my-posh --init --shell pwsh --config "C://Users//Prashanth T P//Documents//WindowsPowerShell//negligible_custom.omp.json")
Invoke-Expression (oh-my-posh --init --shell pwsh --config "C://Users//Prashanth T P//Documents//WindowsPowershell//simple-prompt.omp.json")


##############################################################################
# Path
##############################################################################
# add clangd to path
$env:path+=';D:\Applications\Clangd\clangd_12.0.1\bin'
#add ripgrep to path :
#https://github.com/BurntSushi/ripgrep
$env:path+=';D:\Applications\Unix\ripgrep-13.0.0-x86_64-pc-windows-gnu'
#add bat program
#https://github.com/sharkdp/bat#using-bat-on-windows
$env:path+=';D:\Applications\Unix\bat-v0.18.3-x86_64-pc-windows-gnu\bat-v0.18.3-x86_64-pc-windows-gnu'

#LLVM (Clang)
$env:path+=';D:\Applications\CPP\LLVM\bin'
##############################################################################
# Environment variables
##############################################################################
$env:LC_ALL='C.UTF-8'
$env:LANG='C.UTF-8'
$env:LC_CTYPE='C.UTF-8'
$env:TERM='xterm-256color'

$wtsettings = (Get-ChildItem "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState" -Filter settings.json).FullName

$env:GVIMINIT='let $MYGVIMRC=has("nvim")?$MYGVIMRC:"$HOME/.config/vim/vimrc" | source $MYGVIMRC'

#export VIMINIT='let $MYVIMRC=has("nvim")?$MYVIMRC:"$HOME/.config/vim/vimrc" | source $MYVIMRC'
#$env:VIMINIT='let $MYVIMRC=has("nvim")?"$LOCALAPPDATA/nvim/init.vim":"$HOME/.config/vim/vimrc" | source $MYVIMRC'
$env:VIMINIT='let $MYVIMRC=has("nvim")?"$HOME/.config/nvim/init.lua":"$HOME/.config/vim/vimrc" | source $MYVIMRC'
$env:DEV_DIR='E:/Users/VS_Code_Workspace'

$env:NVIM_CONFIG=$env:LOCALAPPDATA+'/nvim'

##############################################################################
# Aliases
##############################################################################
function configfiles_fn{
	git --git-dir=D:/dotfiles/dotfiles.git --work-tree=$HOME $args
	}

function wikifiles_fn{
	git --git-dir=D:/dotfiles/wiki/vimwiki/.git --work-tree=D:/dotfiles/wiki/vimwiki $args
	}

set-alias -name configfiles -value configfiles_fn
set-alias -name wikifiles -value wikifiles_fn

function get_gitignore{
    echo "Running getignore.sh"
    $local:cmd="C:/Program Files/Git/usr/bin/bash.exe --login --norc  -c "+"./$HOME/.config/scripts/getignore.sh"
    & "$cmd"
}
set-alias -name getignore -value get_gitignore

function cd_dev{
		cd $env:PROJ_DIR
	}
set-alias -name cdpd -value cd_proj_dir
$env:FZF_DEFAULT_COMMAND = 'COLORTERM=truecolor rg --files --hidden --follow --ignore-vcs'
$env:FZF_DEFAULT_OPTS='--height 60% --layout=reverse  --ansi --border --preview "bat --color=always {1}"'

function nvwiki{
    $local:cmd="C:/Program Files/Git/usr/bin/find.exe" 
    $local:dir="D:/dotfiles/wiki"
    
    nvim $(& $cmd $dir -type f -name '\*.md' -not -path '\*/.git/\*' | fzf)
}

function cdp{
    $local:cmd="C:/Program Files/Git/usr/bin/find.exe" 
    $local:args="-maxdepth 4 -type d -not -path '\*/.git/\*' -not -path '\*/node_modules/\*'"
    $local:dir="E:/Users/VS_Code_Workspace"
    #$local:cmd="rg"
   cd $(& $cmd "$dir" -maxdepth 3 -type d  -not -path '\*/.git/\*' -not -path '\*/node_modules/\*' | fzf --no-preview)
#          | fzf --preview='powershell -c \"& $env:ProgramFiles/Git/usr/bin/tree.exe -L 1 {}\"')
    #nvim $(& $cmd $dir -type d -not -path '\*/.git/\*' | fzf)
    #cd $(& "$cmd" --files --no-hidden --max-depth 3 --follow --no-ignore-vcs --glob "!{.git\,.svn\,.hg\,*.*}" --glob "!node_modules" "$dir"| fzf --no-preview)
}

function cclip {
        $PWD.Path | clip
        echo "✅ $($PWD.Path) copied to clipboard."
    }

function cdclip {
    echo "Changing Directory to : $(Get-Clipboard)"
    Set-Location (Get-Clipboard).Split("\n")[0]
    }

function nvp{
    nvim $PROFILE
}
function svp{
    & $PROFILE
    echo "✅ Powershell Profile (Re)loaded."
}

#function cdclip{
#        $pwd.Path | clip
#        echo "✅ Copied current working directory path to clipboard..."
#    }
###########################################################
# FZY
#set-alias -name fzy -value $env:ProgramFiles/Git/usr/bin/fzy.exe
#$env:path+=';D:\Applications\FZF\fzy\usr\bin' # added to system env variables
set-alias -name which -value $env:ProgramFiles/Git/usr/bin/which.exe


#########################################
# Git Bin Utilities
# ######################################

function run_git_utility{
    param($exe_name,$exe_args)
    #Write-Host Running "$exe_name $exe_args"
    $local:git_bin="C:/Program Files/Git/usr/bin"
    & "$git_bin/$exe_name.exe" $exe_args
}

function lsgp{
    #Write-Host Running "$exe_name $exe_args"
    $local:git_bin="C:/Program Files/Git/usr/bin"
    & "$git_bin/ls.exe" --color=auto -ph $args
}
function vim{
    run_git_utility "vim" $Args
}

function lsg{
	run_git_utility "ls"  $args 
}

function head{
	run_git_utility "head" $args
}

function grep{
	run_git_utility "grep" $args
}

function treeg{
	run_git_utility "tree" $args
}
function findg{
	run_git_utility "find" $args
}

function touch{
	run_git_utility "touch" $args
}
#set-alias -name vim -value open_vim
#set-alias -name lsb -value bash_ls

set-alias -name gmake -value mingw32-make.exe

##############################################################################
# vi mode
# https://docs.microsoft.com/en-us/powershell/module/psreadline/set-psreadlineoption?view=powershell-5.1
# # > psreadline 2.2.0 for PredictionViewStyle ListView
##############################################################################
$versionMinimum = [Version]"7.1.999"
$PSReadLineOptions = @{
    EditMode = "Vi"
    HistoryNoDuplicates = $true
    HistorySearchCursorMovesToEnd = $true
    Colors = @{
        "Command" = "#8181f7"
    }
}
Set-PSReadLineOption -Colors @{
  Command            = 'Magenta'
  Number             = 'DarkGray'
  Member             = 'DarkGray'
  Operator           = 'DarkGray'
  Type               = 'DarkGray'
  Variable           = 'DarkGreen'
  Parameter          = 'DarkGreen'
  ContinuationPrompt = 'DarkGray'
  Default            = 'DarkGray'
}
Set-PSReadLineOption @PSReadLineOptions
if(($host.Name -eq 'ConsoleHost') -and ($PSVersionTable.PSVersion -ge $versionMinimum)){
    Set-PSReadLineOption -PredictionSource History #-PredictionViewStyle ListView
}
function OnViModeChange {
    if ($args[0] -eq 'Command') {
        # Set the cursor to a blinking block.
        # Write-Host "`e[1 q"
        Write-Host -NoNewLine "$([char]0x1b)[1 q"
    } else {
        # Set the cursor to a blinking line.
        # Write-Host -NewLine "`e[5 q"
        Write-Host -NoNewLine "$([char]0x1b)[5 q"
    }
}

Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $Function:OnViModeChange
#https://stackoverflow.com/questions/39547321/rebind-escape-in-psreadline-for-vi-mode
# Set-PSReadLineKeyHandler -vimode insert -Chord "k" -ScriptBlock { mapTwoLetterNormal 'k' 'j' }
#Set-PSReadLineKeyHandler -vimode insert -Chord "j" -ScriptBlock { mapTwoLetterNormal 'j' 'k' }
#
##########################################################################3
#
#https://github.com/PowerShell/PSReadLine/issues/759
#this method prevents enabling numlock
Set-PSReadLineKeyHandler -Chord 'j' -ScriptBlock {
  if ([Microsoft.PowerShell.PSConsoleReadLine]::InViInsertMode()) {
    $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    if ($key.Character -eq 'k') {
      [Microsoft.PowerShell.PSConsoleReadLine]::ViCommandMode()
    }
    else {
      [Microsoft.Powershell.PSConsoleReadLine]::Insert('j')
      [Microsoft.Powershell.PSConsoleReadLine]::Insert($key.Character)
    }
  }
}
##########################################################################3
function mapTwoLetterNormal($a, $b){
  mapTwoLetterFunc $a $b -func $function:setViCommandMode
}
function setViCommandMode{
    [Microsoft.PowerShell.PSConsoleReadLine]::ViCommandMode()
}

function mapTwoLetterFunc($a,$b,$func) {
  if ([Microsoft.PowerShell.PSConsoleReadLine]::InViInsertMode()) {
    $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    if ($key.Character -eq $b) {
        &$func
    } else {
      [Microsoft.Powershell.PSConsoleReadLine]::Insert("$a")
      # Representation of modifiers (like shift) when ReadKey uses IncludeKeyDown
      if ($key.Character -eq 0x00) {
        return
      } else {
        # Insert func above converts escape characters to their literals, e.g.
        # converts return to ^M. This doesn't.
        $wshell = New-Object -ComObject wscript.shell
        $wshell.SendKeys("{$($key.Character)}")
      }
    }
  }
}


# Bonus example
function replaceWithExit {
    [Microsoft.PowerShell.PSConsoleReadLine]::BackwardKillLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::KillLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('exit')
}
#Set-PSReadLineKeyHandler -Chord ";" -ScriptBlock { mapTwoLetterFunc ';' 'q' -func $function:replaceWithExit }
##############################################################################

echo "✅ Powershell Profile Loaded."
