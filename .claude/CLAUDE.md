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

## Documentation Lookup (Context7)

When you need to look up API documentation, verify framework behavior, or reference library usage — **always use Context7 first** via the `mcp__context7__resolve-library-id` and `mcp__context7__get-library-docs` tools before falling back to web search.

### Rules
- Before writing code that uses an unfamiliar or infrequently-used API, look up its documentation via Context7
- When answering questions about framework behavior, verify with Context7 rather than relying on training data alone
- If Context7 doesn't have the library, fall back to web search

### Common Swift Libraries to Query
When working on Swift/iOS/macOS projects, these are high-value documentation sources to look up via Context7:

- **Swift** — Swift standard library, language features
- **SwiftUI** — Apple's declarative UI framework
- **Foundation** — Core Apple framework (networking, data, dates, etc.)
- **Swift Concurrency** — async/await, actors, structured concurrency
- **Combine** — Reactive programming framework
- **UIKit** — UIKit framework for iOS
- **Swift Testing** — Apple's modern test framework
- **Point-Free swift-composable-architecture** — TCA architecture
- **Point-Free swift-dependencies** — Dependency injection
- **Point-Free swift-snapshot-testing** — Snapshot testing
- **Point-Free swift-navigation** — Navigation library
