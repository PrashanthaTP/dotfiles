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
Invoke-Expression (oh-my-posh --init --shell pwsh --config "C://Users//Prashanth T P//Documents//WindowsPowerShell//negligible_custom.omp.json")


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
	git --git-dir=D:/dotfiles/dotfiles --work-tree=$HOME $args
	}

function wikifiles_fn{
	git --git-dir=D:/dotfiles/wiki/vimwiki/.git --work-tree=D:/dotfiles/wiki/vimwiki $args
	}

set-alias -name configfiles -value configfiles_fn
set-alias -name wikifiles -value wikifiles_fn
function cd_proj_dir{
		cd $env:PROJ_DIR
	}
set-alias -name cdp -value cd_proj_dir

<#
# TRUE colors with COLORTERM option for bat
# Discussions related to True colors
# - https://github.com/junegunn/fzf.vim/issues/1179
# - https://github.com/macvim-dev/macvim/issues/1177
# - https://github.com/sharkdp/bat/issues/634
##>
$env:FZF_DEFAULT_COMMAND = 'COLORTERM=truecolor rg --files --hidden --follow --ignore-vcs'

$env:FZF_DEFAULT_OPTS='--height 40% --layout=reverse  --ansi --border --preview "bat --color=always {1}"'

function open_wiki{
    $local:cmd="C:/Program Files/Git/usr/bin/find.exe" 
    $local:dir="D:/dotfiles/wiki"
    
        nvim $(& $cmd $dir -type f -name '\*.md' -not -path '\*/.git/\*'| fzf)
    }
function nvp{
    nvim $PROFILE
}
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
        Write-Host Running "$exe_name $exe_args"
        $local:git_bin="C:/Program Files/Git/usr/bin"
		& "$git_bin/$exe_name.exe" $exe_args
}

function vim{
    run_git_utility "vim" $Args
}

function lsg{
	run_git_utility "ls" $args
}

function head{
	run_git_utility "head" $args
}

function grep{
	run_git_utility "grep" $args
}
#set-alias -name vim -value open_vim
#set-alias -name lsb -value bash_ls

##############################################################################
# vi mode
# https://docs.microsoft.com/en-us/powershell/module/psreadline/set-psreadlineoption?view=powershell-5.1
##############################################################################
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
