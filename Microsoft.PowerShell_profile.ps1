Import-Module -Name Terminal-Icons
Set-PsReadlineOption -PredictionViewStyle ListView
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/bubblesextra.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/tokyonight_storm.omp.json" | Invoke-Expression
$env:VIRTUAL_ENV_DISABLE_PROMPT = 1

# ----------------------
# Aliases
# ----------------------

function o {
    explorer.exe .
}

# ----------------------
# Git Aliases
# ----------------------
function gaa {
    git add .
}

function gitcm {
    param (
        [string]$message
    )
    git commit -m $message
}

function gpsh {
    git push
}

function gss {
    git status -s
}

function gs {
    echo ""
    echo "*********************************************"
    echo "   DO NOT FORGET TO PULL BEFORE COMMITTING"
    echo "*********************************************"
    echo ""
    git status
}

function gpl {
    git pull
}
