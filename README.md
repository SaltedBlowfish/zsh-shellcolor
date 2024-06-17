# zsh-shellcolors

ShellColors is an Oh My Zsh plugin that changes the terminal background color based on the presence of a `.shellcolor` file in the current directory. This can help visually distinguish different projects or directories.

## Installation

1. Clone the repository into the custom plugins directory of Oh My Zsh:

    ```sh
    git clone https://github.com/SaltedBlowfish/zsh-shellcolor.git ~/.oh-my-zsh/custom/plugins/shellcolors
    ```

2. Add `shellcolors` to the list of plugins in your `.zshrc` file:

    ```sh
    plugins=(... shellcolors)
    ```

3. Reload your Zsh configuration or restart your terminal session:

    ```sh
    source ~/.zshrc
    ```

## Usage

1. Create a `.shellcolor` file in any directory where you want a custom background color. The file should contain a single line with the color code in the format `#RRGGBB`.

    ```sh
    echo "#1a1a2e" > /path/to/your/project/.shellcolor
    ```

2. Navigate to the directory, and the terminal background color will change accordingly. When you navigate out of the directory, the background color will revert to the default color specified in the plugin.

## Configuration

By default, the plugin uses black (`#000000`) as the default background color when no `.shellcolor` file is found. You can change this default color by setting the `DEFAULT_SHELLCOLOR` environment variable in your `.zshrc` file.

1. Open your `.zshrc` file:

    ```sh
    nano ~/.zshrc
    ```

2. Add the following line to set your desired default background color:

    ```sh
    export DEFAULT_SHELLCOLOR="#yourdefaultcolor"
    ```

3. Save the file and reload your Zsh configuration:

    ```sh
    source ~/.zshrc
    ```

## Example

Create a `.shellcolor` file in your project directory:

```sh
echo "#1a1a2e" > ~/Projects/my-project/.shellcolor
