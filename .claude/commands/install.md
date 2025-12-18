Read the Brewfile at `~/.Brewfile` to get the full list of available software.

Present the user with a formatted list of all available software, organized by category (CLI tools, Applications, Fonts, Shell, Config, etc.). Display the list inside a code block for consistent formatting. Start with "0. all" option to install everything. Include Oh My Zsh in the Shell category. Include "Claude Commands" in a Config category at the end.

Ask the user which ones they would like to install. They can select multiple items.

Once they confirm their selection, install the selected software using the appropriate method:
- For "all" (option 0): Run `brew bundle --file=~/.Brewfile` to install all Homebrew packages, then install Oh My Zsh and Claude Commands
- For individual Homebrew packages: `brew install <package>`
- For individual Homebrew casks: `brew install --cask <package>`
- For Oh My Zsh: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended`
- For Claude Commands: Copy the command files from the Mac-Setup repo to `~/.claude/commands/` and copy the Brewfile to `~/.Brewfile`. If the repo is not available locally, inform the user they need to clone it first or run the full mac_setup.sh script.

If $ARGUMENTS is provided, treat it as the software selection and skip the prompting step.

User selection: $ARGUMENTS
