# aliases
New-Alias make mingw32-make
New-Alias touch ni
New-Alias neofetch winfetch
New-Alias cdproj cdproj_f
New-Alias prof prof_f
New-Alias critty critty_f
New-Alias neoconf neoconf_f
New-Alias sudo sudo_f

# functions
function cdproj_f{
    cd D:\dev\UnfinishedWork
}
function prof_f{
    notepad $profile
}
function critty_f{
    notepad "C:\Users\bobte\AppData\Roaming\alacritty\alacritty.toml"
}
function neoconf_f{
    notepad "C:\Users\bobte\.config\winfetch\config.ps1"
}
function sudo_f{
    start alacritty -verb runas
}


# choco
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/catppuccin_mocha.omp.json" | Invoke-Expression