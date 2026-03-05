---
name: git
description: >
  Use when the user asks to "commit", "create a commit", "make a merge request",
  "create an MR", "create a pull request", "create a PR", "tag a release",
  "generate changelog", "write commit message", or any git workflow that involves
  commits, merge requests, pull requests, or release notes. Also use when reviewing
  commit messages for correctness.
version: 0.1.0
---

# Git Workflow Skill

This skill defines best practices for commits, merge requests / pull requests, and
changelog generation. It covers both **GitLab** and **GitHub** conventions — detect
which platform the project uses and apply the right practices.

## Platform Detection

Before applying conventions, determine the hosting platform:

1. Check for a `glab` remote or GitLab URL in `git remote -v`
2. Check for a `gh` remote or GitHub URL in `git remote -v`
3. Look for `.gitlab-ci.yml` (GitLab) or `.github/` directory (GitHub)
4. Check the project's CLAUDE.md for explicit instructions

## Commit Messages

### Format

```
<summary line — imperative mood, max ~72 chars>

<optional body — explain why, not what>

Co-Authored-By: Claude <model> <noreply@anthropic.com>
<platform-specific trailers>
```

### GitLab: Changelog Trailers

GitLab projects that use the changelog API require a `Changelog` Git trailer as the
**last line** of the commit body. This trailer powers automatic categorized release
note generation.

```
Add merchant search filtering

Users can now filter search results by category and distance.

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
Changelog: added
```

#### Changelog Types

| Type | When to use |
|------|-------------|
| `added` | New feature or capability |
| `fixed` | Bug fix |
| `changed` | Modification to existing behavior |
| `deprecated` | Feature marked for future removal |
| `removed` | Feature or code removed |
| `security` | Security-related fix |
| `performance` | Performance improvement |
| `other` | Refactoring, docs, CI, tooling, or anything that doesn't fit above |

#### Rules

- Choose the type that best describes the **user-facing impact**.
- If a commit touches multiple categories, pick the most significant one.
- Use `other` for internal-only changes (CI, tooling, docs, refactoring).
- The `Changelog` trailer must be the very last line — after `Co-Authored-By`.
- Check the project's CLAUDE.md for whether `Changelog:` trailers are required.

### GitHub: Conventional Commits (when applicable)

Some GitHub projects use [Conventional Commits](https://www.conventionalcommits.org/)
with tools like `release-please` to auto-generate changelogs from commit prefixes.

```
feat: add merchant search filtering

Users can now filter search results by category and distance.

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
```

#### Common Prefixes

| Prefix | When to use |
|--------|-------------|
| `feat:` | New feature |
| `fix:` | Bug fix |
| `docs:` | Documentation only |
| `chore:` | Maintenance, CI, tooling |
| `refactor:` | Code restructuring, no behavior change |
| `perf:` | Performance improvement |
| `test:` | Adding or fixing tests |
| `ci:` | CI/CD changes |

#### Rules

- Only use Conventional Commits if the project already uses them (check existing commits).
- If the project doesn't use Conventional Commits, use plain imperative summaries.
- Breaking changes: add `!` after the prefix (e.g. `feat!: redesign API`) or add a `BREAKING CHANGE:` footer.

## Merge Requests / Pull Requests

### GitLab Merge Requests

Use `glab mr create` for GitLab projects.

#### MR Description Format

```markdown
## Summary
<Concise description of what this MR does and why>

## Changes
<Categorized list derived from commit Changelog trailers>

### Added
- <commits with Changelog: added>

### Fixed
- <commits with Changelog: fixed>

### Changed
- <commits with Changelog: changed>

<... only include sections that have commits>

## Test plan
- [ ] <how to verify the changes>
```

#### Generating the Changes Section

1. Run `git log <base-branch>..HEAD --format="%s%n%(trailers:key=Changelog,valueonly)"` to collect commits and their changelog types.
2. Group commit summaries by their changelog type.
3. Omit empty categories.
4. For single-commit MRs, simplify — no need for categories, just describe the change.

### GitHub Pull Requests

Use `gh pr create` for GitHub projects.

#### PR Description Format

```markdown
## Summary
<Concise description of what this PR does and why>

## Changes
- <bullet list of changes>

## Test plan
- [ ] <how to verify the changes>
```

#### GitHub-Specific Considerations

- **Labels drive changelogs**: GitHub's auto-generated release notes use PR labels
  (e.g. `enhancement`, `bug`, `documentation`) configured in `.github/release.yml`.
  Suggest appropriate labels when creating PRs if the project uses this feature.
- **Linked issues**: Use `Closes #123` or `Fixes #123` in the PR body to auto-close
  issues on merge.
- **Draft PRs**: Use `--draft` flag when the PR isn't ready for review.

### Shared Rules

1. Check the project's CLAUDE.md for the default target/base branch.
2. Keep the title short (under 70 chars), use the description for detail.
3. Include a test plan with actionable verification steps.
4. For multi-commit branches, summarize all commits — don't just describe the latest one.

## Release Notes and Changelogs

### GitLab

GitLab can auto-generate categorized release notes from `Changelog:` trailers via
its changelog API (`/repository/changelog`). Commits without trailers are excluded
from the generated notes.

Projects may also use a custom script (e.g. `generate-release-notes.sh`) that calls
this API and falls back to a git log bullet list.

### GitHub

GitHub offers **automatically generated release notes** configured via
`.github/release.yml`. This groups PRs by label into categories:

```yaml
# .github/release.yml
changelog:
  categories:
    - title: New Features
      labels: [enhancement]
    - title: Bug Fixes
      labels: [bug]
    - title: Other Changes
      labels: ["*"]
```

Alternatively, tools like `release-please` parse Conventional Commit prefixes to
generate `CHANGELOG.md` files and create release PRs automatically.

### Key Difference

| Aspect | GitLab | GitHub |
|--------|--------|--------|
| Changelog source | Commit trailers (`Changelog:`) | PR labels or commit prefixes |
| Configuration | GitLab changelog API (built-in) | `.github/release.yml` or `release-please` |
| Granularity | Per-commit | Per-PR |
| CLI tool | `glab` | `gh` |
