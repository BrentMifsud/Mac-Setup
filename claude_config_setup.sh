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

    # Install MCP servers
    echo "\nInstalling Claude Code MCP servers..."

    # Proxyman - network debugging (requires MCP enabled in Proxyman: Settings → MCP)
    PROXYMAN_MCP=""
    while IFS= read -r app_path; do
        if [ -x "$app_path/Contents/MacOS/mcp-server" ]; then
            PROXYMAN_MCP="$app_path/Contents/MacOS/mcp-server"
            break
        fi
    done <<< "$(mdfind 'kMDItemFSName == "Proxyman.app"' 2>/dev/null)"

    if [ -n "$PROXYMAN_MCP" ]; then
        claude mcp add proxyman -s user -- "$PROXYMAN_MCP" 2>/dev/null && \
            echo "Installed Proxyman MCP server ($PROXYMAN_MCP)" || echo "Proxyman MCP already configured"
        echo "Note: Enable MCP in Proxyman → Settings → MCP if not already enabled"
    else
        echo "Proxyman with MCP support not found — install it via Setapp or https://proxyman.com"
    fi
else
    echo "\nClaude CLI not found — skipping plugin and MCP installation."
    echo "Install Claude Code first, then re-run this script to install plugins."
fi

echo "\nDone."
