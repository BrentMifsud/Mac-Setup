Read the Brewfile at `~/.Brewfile` to get the full list of available software.

Present the user with a formatted list of all available software, organized by category (CLI tools, Applications, Fonts, Shell, Claude Code, etc.). Display the list inside a code block for consistent formatting. Start with "0. all" option to install everything. Include Oh My Zsh in the Shell category. In the Claude Code category, include these items individually:
- Claude Commands (slash commands: install, uninstall, update, xcode)
- Claude Agents (watch-github-ci)
- Claude Skills (git workflow)
- Claude Plugins (swift-lsp, swiftui-expert, swift-concurrency)

Ask the user which ones they would like to install. They can select multiple items.

Once they confirm their selection, install the selected software using the appropriate method:
- For "all" (option 0): Run `brew bundle --file=~/.Brewfile` to install all Homebrew packages, then install Oh My Zsh and all Claude Code items
- For individual Homebrew packages: `brew install <package>`
- For individual Homebrew casks: `brew install --cask <package>`
- For Oh My Zsh: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended`
- For Claude Commands: Copy `~/.claude/commands/*.md` from the Mac-Setup repo and copy the Brewfile to `~/.Brewfile`
- For Claude Agents: Copy `~/.claude/agents/*.md` from the Mac-Setup repo
- For Claude Skills: Copy `~/.claude/skills/` from the Mac-Setup repo (preserve directory structure)
- For Claude Plugins: Run `claude plugin install <name>` for each plugin:
  - `claude plugin install swift-lsp@claude-plugins-official`
  - `claude plugin install swiftui-expert@swiftui-expert-skill`
  - `claude plugin install swift-concurrency@swift-concurrency-agent-skill`

If the Mac-Setup repo is not available locally, inform the user they need to clone it first or run the full mac_setup.sh script.

If $ARGUMENTS is provided, treat it as the software selection and skip the prompting step.

User selection: $ARGUMENTS
