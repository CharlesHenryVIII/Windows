# Use this file to run your own startup commands

## Prompt Customization
<#
.SYNTAX
    <PrePrompt><CMDER DEFAULT>
    λ <PostPrompt> <repl input>
.EXAMPLE
    <PrePrompt>N:\Documents\src\cmder [master]
    λ <PostPrompt> |
#>

[ScriptBlock]$PrePrompt = {

}

# Replace the cmder prompt entirely with this.
# [ScriptBlock]$CmderPrompt = {}

[ScriptBlock]$PostPrompt = {

}

## <Continue to add your own>

$Host.UI.RawUI.BackgroundColor = 'Black'
$Host.UI.RawUI.ForegroundColor = 'White'
Clear-Host

# Add common paths to console (vim, ls.exe, etc)
$gitBin = Join-Path (Split-Path (Split-Path (Get-Command git).Source)) 'usr\bin'
if ((Test-Path $gitBin) -and ($env:PATH -notlike "*$gitBin*")) {
    $env:PATH = "$env:PATH;$gitBin"
}

# Built-in PowerShell aliases take precedence over functions, so remove the ones that collide
foreach ($a in 'gc','gl') {
    Remove-Item "Alias:$a" -Force -ErrorAction SilentlyContinue
}

function gs     { git status @args }
function gl     { git log --oneline --all --graph --decorate @args }
function gc     { git clone --recurse-submodules -j $env:NUMBER_OF_PROCESSORS --shallow-submodules --progress @args }
function e.     { explorer . }
function vi     { vim @args }
function cmderr { Set-Location $env:CMDER_ROOT }

# ls from Git's unix tools (same as your doskey version)
$global:LsExe = Join-Path (Split-Path (Split-Path (Get-Command git).Source)) 'usr\bin\ls.exe'

if (Test-Path $global:LsExe) {
    Remove-Item Alias:ls -Force -ErrorAction SilentlyContinue
    function ls { & $global:LsExe -AFhl --color --group-directories-first @args }
    function l  { & $global:LsExe --show-control-chars -CFGNhp --color '--ignore=NTUSER.DAT*' '--ignore=ntuser.dat*' @args }
}

# # Delete default powershell aliases that conflict with bash commands
# if (get-command git) {
#     del -force alias:cat
#     del -force alias:clear
#     del -force alias:cp
#     del -force alias:diff
#     del -force alias:echo
#     del -force alias:kill
#     del -force alias:ls
#     del -force alias:mv
#     del -force alias:p#     del -force alias:pwd
#     del -force alias:rm
#     del -force alias:sleep
#     del -force alias:tee
# }
