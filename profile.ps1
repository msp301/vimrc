function _goto_dir {
    [CmdletBinding()]
    param(
        [string] $dir,

        [Parameter(Mandatory=$false)]
        [string] $search
    )

    $query = @()
    if ( $search -ne "" ) {
        $query = @("--query", $search)
    }

    fd --glob --type d "*" "$dir" | fzf @query | Set-Location
}

function _global_goto_dir {
    _goto_dir "$HOME" @args
}

New-Alias g _goto_dir
New-Alias gg _global_goto_dir
