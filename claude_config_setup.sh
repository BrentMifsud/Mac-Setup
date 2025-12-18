#!/bin/zsh

echo "\nInstalling Claude commands and settings..."

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

## Create Claude directories
mkdir -p ~/.claude/commands

## Copy Claude commands
cp "$SCRIPT_DIR/.claude/commands/"*.md ~/.claude/commands/
echo "Claude commands installed to ~/.claude/commands/"

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

echo "\nDone."
