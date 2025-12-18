Read the Brewfile at `~/.Brewfile` to get the full list of software that may have been installed by this setup.

Present the user with a formatted list of all software, organized by category (CLI tools, Applications, Fonts, Shell, etc.). Display the list inside a code block for consistent formatting. Include Oh My Zsh in the Shell category. Include an "all" option to update everything at once.

Ask the user which ones they would like to update. They can select multiple items.

Once they confirm their selection, update the selected software using the appropriate method:
- For "all": `brew update && brew upgrade && brew cleanup` then update Oh My Zsh
- For Homebrew packages/casks: `brew upgrade <package>`
- For Oh My Zsh: `ZSH="${ZSH:-$HOME/.oh-my-zsh}" && "$ZSH/tools/upgrade.sh"` (use the direct upgrade script since `omz update` doesn't work in non-interactive shells)

If $ARGUMENTS is provided, treat it as the software selection and skip the prompting step.

User selection: $ARGUMENTS
