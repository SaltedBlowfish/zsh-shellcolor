# Default background color; use environment variable if set.
: "${DEFAULT_SHELLCOLOR:=#000000}"

# Locate the nearest .shellcolor file in the current or parent directories.
find_nearest_shellcolor() {
    local dir color_file
    dir=$(pwd)
    while [[ "$dir" != "/" ]]; do
        color_file="$dir/.shellcolor"
        if [[ -f "$color_file" ]]; then
            cat "$color_file"
            return
        fi
        dir=$(dirname "$dir")
    done
    echo "$DEFAULT_SHELLCOLOR"
}

# Update the terminal background using the nearest .shellcolor value.
change_background() {
    local color
    color=$(find_nearest_shellcolor)
    printf '\033]11;%s\007' "$color"
}

# Generate a random RGB color with low saturation.
generate_color() {
    # Reseed the random generator using /dev/urandom.
    RANDOM=$(( $(od -An -N2 -tu2 </dev/urandom) ))
    local base r g b
    base=$((RANDOM % 150))
    r=$(( base + RANDOM % 50 - 25 ))
    g=$(( base + RANDOM % 50 - 25 ))
    b=$(( base + RANDOM % 50 - 25 ))

    (( r < 0 )) && r=0
    (( r > 255 )) && r=255
    (( g < 0 )) && g=0
    (( g > 255 )) && g=255
    (( b < 0 )) && b=0
    (( b > 255 )) && b=255

    printf "#%02x%02x%02x" "$r" "$g" "$b"
}

# Command interface for shellcolor.
shellcolor() {
    case "$1" in
        set)
            if [[ "$2" = "random" ]]; then
                local color
                color=$(generate_color)
                echo "---> Generated random color: $color"
                echo "$color" > .shellcolor
                echo "Set .shellcolor to random color $color"
            elif [[ "$2" =~ ^#[A-Fa-f0-9]{6}$ ]]; then
                echo "$2" > .shellcolor
                echo "Set .shellcolor to $2"
            else
                echo "Usage: shellcolor set [random|#RRGGBB]"
                return 1
            fi
            ;;
        unset)
            rm -f .shellcolor
            echo "Unset .shellcolor"
            ;;
        gitignore)
            echo ".shellcolor" >> .gitignore
            echo "Added .shellcolor to .gitignore"
            ;;
        reshim)
            echo "Reshimming shellcolor..."
            ;;
        *)
            cat <<'EOF'
Usage:
  shellcolor set random        # Set a random shell color
  shellcolor set #RRGGBB       # Set a specific shell color
  shellcolor unset             # Remove .shellcolor
  shellcolor gitignore         # Add .shellcolor to .gitignore
  shellcolor reshim            # Refresh background color
EOF
            return 1
            ;;
    esac

    change_background
}

# Hook initialization.
autoload -U add-zsh-hook

chpwd() {
    change_background
}

add-zsh-hook chpwd change_background

# Initialize terminal background.
change_background
