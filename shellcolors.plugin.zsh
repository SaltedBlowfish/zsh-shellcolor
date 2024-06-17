# Default background color, use environment variable if set
DEFAULT_SHELLCOLOR="${DEFAULT_SHELLCOLOR:-#000000}"

# Function to change the terminal background based on the .shellcolor file in the current directory.
function change_background() {
    local dir=$(pwd)
    local color_file="$dir/.shellcolor"
    local color

    if [[ -f $color_file ]]; then
        color=$(<"$color_file")
    else
        color=$DEFAULT_SHELLCOLOR
    fi

    printf '\033]11;%s\007' "$color"
}

autoload -U add-zsh-hook

function chpwd() {
    change_background
}

add-zsh-hook chpwd change_background

# Set the initial background
change_background
