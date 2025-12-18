Read the Brewfile at `~/.Brewfile` to get the full list of software that may have been installed by this setup.

Present the user with a formatted list of all software, organized by category (CLI tools, Applications, Fonts, Shell, Config, etc.). Display the list inside a code block for consistent formatting. Start with "0. all" option to uninstall all Brewfile software. Include Oh My Zsh in the Shell category. Include "Claude Commands" in a Config category. Include "Homebrew" as an option at the end of the list.

Ask the user which ones they would like to uninstall. They can select multiple items.

Once they confirm their selection, uninstall the selected software using the appropriate method:
- For "all" (option 0): Run `brew bundle cleanup --force --file=~/.Brewfile` to uninstall all Brewfile software (does not uninstall Oh My Zsh, Claude Commands, or Homebrew itself)
- For individual Homebrew packages: `brew uninstall <package>`
- For individual Homebrew casks: `brew uninstall --cask <package>`
- For Oh My Zsh: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/uninstall.sh)"`
- For Claude Commands: Remove `~/.claude/commands/install.md`, `~/.claude/commands/uninstall.md`, `~/.claude/commands/update.md`, `~/.claude/commands/xcode.md`, and `~/.Brewfile`
- For Homebrew itself: Follow the special Homebrew uninstall process below

## Homebrew Uninstall Process

If the user selects "Homebrew" to uninstall:

1. First, ask the user: "Would you like to uninstall all software from the Brewfile first? This will cleanly remove all packages and casks before removing Homebrew."

2. If YES: Run `brew bundle cleanup --force --file=~/.Brewfile` to remove all Brewfile packages, then proceed to uninstall Homebrew with:
   ```
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
   ```

3. If NO: Warn the user with this message:
   "Warning: Uninstalling Homebrew without first removing installed packages will leave orphaned applications and files on your system. You will need to manually remove them from /Applications and clean up any remaining files in /opt/homebrew."

   Then ask: "Are you sure you want to proceed without cleaning up first?"

   - If they confirm YES: Proceed with Homebrew uninstall
   - If they say NO: Cancel the Homebrew uninstall

If $ARGUMENTS is provided, treat it as the software selection and skip the prompting step (except for the Homebrew confirmation prompts which should always be shown).

User selection: $ARGUMENTS
