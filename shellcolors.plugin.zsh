# Default background color, use environment variable if set.
DEFAULT_SHELLCOLOR="${DEFAULT_SHELLCOLOR:-#000000}"

# Function to find the nearest .shellcolor file in the current or parent directories.
function find_nearest_shellcolor() {
    local dir=$(pwd)
    while [[ "$dir" != "/" ]]; do
        local color_file="$dir/.shellcolor"
        if [[ -f $color_file ]]; then
            cat "$color_file"
            return
        fi
        dir=$(dirname "$dir")
    done
    echo "$DEFAULT_SHELLCOLOR"
}

# Function to change the terminal background based on the .shellcolor file in the current or parent
# directories.
function change_background() {
    local color=$(find_nearest_shellcolor)
    printf '\033]11;%s\007' "$color"
}

autoload -U add-zsh-hook

function chpwd() {
    change_background
}

add-zsh-hook chpwd change_background

# Set the initial background.
change_background
