#!/bin/zsh

echo "\nInstalling Claude Code configuration..."

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

## Create Claude directories
mkdir -p ~/.claude/commands
mkdir -p ~/.claude/agents
mkdir -p ~/.claude/skills

## Copy Claude commands
cp "$SCRIPT_DIR/.claude/commands/"*.md ~/.claude/commands/
echo "Claude commands installed to ~/.claude/commands/"

## Copy Claude agents
if [ -d "$SCRIPT_DIR/.claude/agents" ] && ls "$SCRIPT_DIR/.claude/agents/"*.md 1>/dev/null 2>&1; then
    cp "$SCRIPT_DIR/.claude/agents/"*.md ~/.claude/agents/
    echo "Claude agents installed to ~/.claude/agents/"
fi

## Copy Claude skills (preserve directory structure)
if [ -d "$SCRIPT_DIR/.claude/skills" ]; then
    cp -R "$SCRIPT_DIR/.claude/skills/"* ~/.claude/skills/
    echo "Claude skills installed to ~/.claude/skills/"
fi

## Merge settings.json (idempotent - adds new permissions without overwriting existing)
if [ -f ~/.claude/settings.json ]; then
    jq --slurpfile new "$SCRIPT_DIR/.claude/settings.json" \
        '. * $new[0] | .permissions.allow = ([.permissions.allow // []] + [$new[0].permissions.allow // []] | add | unique)' \
        ~/.claude/settings.json > ~/.claude/settings.json.tmp \
        && mv ~/.claude/settings.json.tmp ~/.claude/settings.json
    echo "Claude settings merged into ~/.claude/settings.json"
else
    cp "$SCRIPT_DIR/.claude/settings.json" ~/.claude/settings.json
    echo "Claude settings installed to ~/.claude/settings.json"
fi

## Copy global CLAUDE.md (only if it doesn't exist to preserve user customizations)
if [ ! -f ~/.claude/CLAUDE.md ]; then
    cp "$SCRIPT_DIR/.claude/CLAUDE.md" ~/.claude/CLAUDE.md
    echo "Global preferences installed to ~/.claude/CLAUDE.md"
else
    echo "Global preferences already exist at ~/.claude/CLAUDE.md (skipped)"
fi

## Install plugins (if claude CLI is available)
if command -v claude &>/dev/null; then
    echo "\nInstalling Claude Code plugins..."

    # Install marketplace plugins
    claude plugin install swift-lsp@claude-plugins-official 2>/dev/null && \
        echo "Installed swift-lsp plugin" || echo "swift-lsp already installed or unavailable"

    # Install third-party plugins
    claude plugin install swiftui-expert@swiftui-expert-skill 2>/dev/null && \
        echo "Installed swiftui-expert plugin" || echo "swiftui-expert already installed or unavailable"

    claude plugin install swift-concurrency@swift-concurrency-agent-skill 2>/dev/null && \
        echo "Installed swift-concurrency plugin" || echo "swift-concurrency already installed or unavailable"
else
    echo "\nClaude CLI not found — skipping plugin installation."
    echo "Install Claude Code first, then re-run this script to install plugins."
fi

echo "\nDone."
