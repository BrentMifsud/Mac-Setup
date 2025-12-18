Read the Brewfile at `~/.Brewfile` to get the full list of available software.

Present the user with a formatted list of all available software, organized by category (CLI tools, Applications, Fonts, Shell, etc.). Display the list inside a code block for consistent formatting. Include Oh My Zsh in the Shell category.

Ask the user which ones they would like to install. They can select multiple items.

Once they confirm their selection, install the selected software using the appropriate method:
- For Homebrew packages: `brew install <package>`
- For Homebrew casks: `brew install --cask <package>`
- For Oh My Zsh: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended`

If $ARGUMENTS is provided, treat it as the software selection and skip the prompting step.

User selection: $ARGUMENTS
