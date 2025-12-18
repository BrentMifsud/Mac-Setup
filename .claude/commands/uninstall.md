Read the Brewfile at `~/.Brewfile` to get the full list of software that may have been installed by this setup.

Present the user with a formatted list of all software, organized by category (CLI tools, Applications, Fonts, Shell, etc.). Display the list inside a code block for consistent formatting. Include Oh My Zsh in the Shell category.

Ask the user which ones they would like to uninstall. They can select multiple items.

Once they confirm their selection, uninstall the selected software using the appropriate method:
- For Homebrew packages: `brew uninstall <package>`
- For Homebrew casks: `brew uninstall --cask <package>`
- For Oh My Zsh: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/uninstall.sh)"`

If $ARGUMENTS is provided, treat it as the software selection and skip the prompting step.

User selection: $ARGUMENTS
