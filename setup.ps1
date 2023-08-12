function SymlinkDotfile([string] $target, [string] $link) {
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
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    }

    if($executable -eq '') {
        $executable = $package
    }

    $has_package = Get-Command -Name "$executable" -ErrorAction SilentlyContinue
    if(!$has_package) {
        choco install -y "$package"
    }
}

SymlinkDotfile "$PSScriptRoot\init.vim" "$env:LOCALAPPDATA\nvim\init.vim"
SymlinkDotfile "$PSScriptRoot\ideavimrc" "$env:USERPROFILE\.ideavimrc"

ChocoInstall "fd"
ChocoInstall "git"
ChocoInstall "neovide"
ChocoInstall "python3-virtualenv" "virtualenv"
ChocoInstall "ripgrep" "rg"
ChocoInstall "microsoft-windows-terminal" "wt"

# Install vim-plug
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force > $null

nvim --headless +PlugInstall +qall

Write-Host "Done"

