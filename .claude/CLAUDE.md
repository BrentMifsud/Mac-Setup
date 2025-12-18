# Global Preferences

These are my global preferences. Project-specific CLAUDE.md files can override these settings.

## Git Tags

Use semantic versioning without the 'v' prefix for tags:
- Correct: `1.0.0`, `2.1.3`, `0.5.0-beta`
- Incorrect: `v1.0.0`, `v2.1.3`

When creating tags in a project:
1. First check if the project's CLAUDE.md specifies a tag format
2. If not, check existing release tags (`git tag -l`) to match the project's convention
3. If no existing tags, use this global preference (no 'v' prefix)
