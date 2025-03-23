# zsh-shellcolors

ShellColors is an Oh My Zsh plugin that automatically updates your terminal background color based
on the presence of a `.shellcolor` file in the current directory or one of its parent directories.
The plugin also provides a command interface to set, unset, and manage the `.shellcolor` file.

![2024-06-17 16 18 23](https://github.com/SaltedBlowfish/zsh-shellcolor/assets/6200478/33c1cf81-8e9c-423c-94e8-2d78fc0cb366)

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

The plugin automatically updates the terminal background when you change directories. It searches
for a `.shellcolor` file in the current directory and its parent directories; if none is found, it
uses the default color.

A command interface is provided via the `shellcolor` command:

- **Set a random color:**

    ```sh
    shellcolor set random
    ```

    This command generates a random low-saturation color, writes it to `.shellcolor`, and updates
    the background.

- **Set a specific color:**

    ```sh
    shellcolor set #RRGGBB
    ```

    Replace `#RRGGBB` with your desired hexadecimal color code.

- **Unset the custom color:**

    ```sh
    shellcolor unset
    ```

    This command removes the `.shellcolor` file and reverts to the default background.

- **Add `.shellcolor` to .gitignore:**

    ```sh
    shellcolor gitignore
    ```

- **Reshim (refresh) the background:**

    ```sh
    shellcolor reshim
    ```

## Configuration

By default, the plugin uses black (`#000000`) as the default background color if no `.shellcolor`
file is found. To change this, set the `DEFAULT_SHELLCOLOR` environment variable in your `.zshrc`
file:

1. Open your `.zshrc` file:

    ```sh
    vim ~/.zshrc
    ```

2. Add the following line with your desired default color:

    ```sh
    export DEFAULT_SHELLCOLOR="#yourdefaultcolor"
    ```

3. Save the file and reload your Zsh configuration:

    ```sh
    source ~/.zshrc
    ```
