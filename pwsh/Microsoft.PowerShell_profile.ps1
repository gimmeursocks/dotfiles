# aliases
New-Alias cdproj gotoProjectDir
New-Alias conf modifyProfile
New-Alias critty alacrittyProfile
New-Alias neoconf neofetchProfile
New-Alias sudo runAlacrittyAsAdmin
New-Alias uposh updateOhMyPosh
New-Alias aliases listAliases
New-Alias rrouter restartRouter
New-Alias tempc tempCleanup
New-Alias make mingw32-make
New-Alias touch ni
New-Alias neofetch winfetch

# functions
function gotoProjectDir {
    Set-Location D:\dev\UnfinishedWork
}
function modifyProfile {
    code $profile
}
function alacrittyProfile {
    code "C:\Users\bobte\AppData\Roaming\alacritty\alacritty.toml"
}
function neofetchProfile {
    code "C:\Users\bobte\.config\winfetch\config.ps1"
}
function runAlacrittyAsAdmin {
    Start-Process alacritty -verb runas
}
function updateOhMyPosh {
    winget upgrade JanDeDobbeleer.OhMyPosh -s winget
}
function listAliases {
    $profileContent = Get-Content -Path $profile -ErrorAction SilentlyContinue

    if ($null -ne $profileContent) {
        $aliasLines = $profileContent | Where-Object { $_ -match '^New-Alias\s+(\w+)\s+([\w-]+)$' }

        if ($aliasLines.Count -gt 0) {
            $aliases = $aliasLines | ForEach-Object { $_ -replace '^New-Alias\s+(\w+)\s+([\w-]+)$', '$1 -> $2' }

            $aliases
        }
        else {
            Write-Host "No aliases defined in the profile file."
        }
    }
    else {
        Write-Host "Profile file not found."
    }
}

function restartRouter {
    Start-Process "D:\dev\Scripts\restart_router.bat"
}

function tempCleanup {
    Start-Process "D:\dev\Scripts\temp_cleanup.bat"
}

# choco
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}

# ohmyposh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/catppuccin_mocha.omp.json" | Invoke-Expression