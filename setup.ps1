function Symlink([string] $target, [string] $link) {
    $file = Get-Item $link -Force -ErrorAction SilentlyContinue
    $exists = [bool]($file.Attributes -band [IO.FileAttributes]::ReparsePoint)

    if($file.PSIsContainer -and !$exists) {
        Remove-Item -Recurse -Force -Path $link
    }

    if(!$exists) {
        Write-Host "Creating link from '$target' to '$link'"
        New-Item -ItemType SymbolicLink -Force -Target "$target"  -Path "$link" > $null
    }
}

function SymlinkDirectory([string] $target, [string] $link) {
    $file = Get-Item $link -Force -ErrorAction SilentlyContinue
    $exists = [bool]($file.Attributes -band [IO.FileAttributes]::ReparsePoint)

    if(!$exists) {
        Write-Host "Creating link from '$target' to '$link'"
        New-Item -ItemType SymbolicLink -Force -Target "$target"  -Path "$link" > $null
    }
}

function ChocoInstall([string] $package, [string] $executable) {
    $has_choco = Get-Command -Name choco.exe -ErrorAction SilentlyContinue
    if(!$has_choco) {
        # Install Chocolatey
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    }

    if($executable -eq '') {
        $executable = $package
    }

    $has_package = Get-Command -Name "$executable" -ErrorAction SilentlyContinue
    if(!$has_package) {
        choco install -y "$package"
    }
}

Symlink "$PSScriptRoot\profile.ps1" "$profile"
Symlink "$PSScriptRoot\nvim" "$env:LOCALAPPDATA\nvim";
Symlink "$PSScriptRoot\ideavimrc" "$env:USERPROFILE\.ideavimrc"

ChocoInstall "7zip" "7z"
ChocoInstall "curl"
ChocoInstall "fd"
ChocoInstall "fzf"
ChocoInstall "git"
ChocoInstall "golang"
ChocoInstall "jetbrainstoolbox"
ChocoInstall "microsoft-windows-terminal" "wt"
ChocoInstall "neovide"
ChocoInstall "nerd-fonts-noto"
ChocoInstall "nodejs" "npm"
ChocoInstall "powertoys"
ChocoInstall "python3-virtualenv" "virtualenv"
ChocoInstall "pwsh"
ChocoInstall "ripgrep" "rg"
ChocoInstall "zig"

Write-Host "Done"

