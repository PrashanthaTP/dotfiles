# Import-Module posh-git
# Import-Module oh-my-posh
# Set-PoshPrompt -Theme paradox
#Invoke-Expression (oh-my-posh --init --shell pwsh --config "C://Users//Prashanth T P//Documents//WindowsPowerShell//my_custom_config_oh_my_posh.omp.json")
# Invoke-Expression (oh-my-posh --init --shell pwsh --config "$(scoop prefix oh-my-posh)//themes//jandedobbeleer.omp.json")
#nvoke-Expression (oh-my-posh --init --shell pwsh --config "$(scoop prefix oh-my-posh)//themes//paradox.omp.json")

 #Invoke-Expression (oh-my-posh --init --shell pwsh --config "$(scoop prefix oh-my-posh)//themes//avit.omp.json")
Invoke-Expression (oh-my-posh --init --shell pwsh --config "C://Users//Prashanth T P//Documents//WindowsPowerShell//negligible_custom.omp.json")


$env:LC_ALL='C.UTF-8'
#$env:TERM='xterm-256color'
function configfiles_fn{
	git --git-dir=D:/dotfiles/dotfiles --work-tree=$env:LOCALAPPDATA $args
	}
set-alias -name configfiles -value configfiles_fn
##########################################################################
# vi mode
# https://docs.microsoft.com/en-us/powershell/module/psreadline/set-psreadlineoption?view=powershell-5.1
#
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

############################################
function wikifiles_fn{
	git --git-dir=D:/dotfiles/wiki/vimwiki/.git --work-tree=D:/dotfiles/wiki/vimwiki $args
	}

set-alias -name wikifiles -value wikifiles_fn
############################################
# Windows terminal settings
$wtsettings = (Get-ChildItem "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState" -Filter settings.json).FullName