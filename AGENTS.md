# Codex Project Guidance

## Project Identity

This repository is the Chinese-first Kotlin Multiplatform project for `CyberAtlas` / `資安地圖`.

The current product direction is a free cybersecurity learning app that uses a map structure:

- `大世界`: broad security or computer-science domains.
- `小國家`: smaller concepts inside each domain.
- `概念卡`: short Chinese explanations and small practice tasks.

This is not primarily a quiz bank, paid course app, subscription product, or backend platform.

## Current Technical Direction

- Main stack: Kotlin Multiplatform + Compose Multiplatform.
- First app targets: Android first, iOS shell next.
- First language: Traditional Chinese / Chinese-first content.
- First data strategy: local sample data.
- Avoid adding backend, login, payments, analytics, or cloud sync until explicitly requested.

## Repository Map

- `shared/`: shared Kotlin models, sample content, and future repository/use-case logic.
- `sharedUI/`: Compose Multiplatform UI shared by Android and iOS.
- `androidApp/`: Android app entry point, manifest, and platform wiring.
- `iosApp/`: iOS SwiftUI shell and future KMP framework integration notes.
- `Texuan/` and `Texuan.xcodeproj/`: legacy SwiftUI prototype kept as UI/product reference only.
- `CONTENT_MAP.md`: first-pass content taxonomy.
- `PRODUCT_SPEC.md`: product positioning and MVP scope.
- `KMP_DEVELOPMENT.md`: KMP architecture and development notes.

## Development Priorities

Prefer work that strengthens the KMP product path:

1. Shared data models and sample content in `shared/`.
2. Shared Compose UI in `sharedUI/`.
3. Android execution path in `androidApp/`.
4. iOS shell and KMP framework integration in `iosApp/`.
5. Product/content documents when the direction is still being shaped.

Do not treat the legacy `Texuan/` SwiftUI app as the main implementation unless the user explicitly asks to return to the old SwiftUI prototype.

## Build And Verification

The intended Android build command is:

```sh
./gradlew :androidApp:assembleDebug
```

The repository currently may not include a working Gradle wrapper. If `./gradlew` is unavailable, use an installed Gradle from the IDE or local machine:

```sh
gradle :androidApp:assembleDebug
```

When the local toolchain is missing or network access prevents dependency resolution, say so clearly and use static inspection instead of implying the build passed.

## Coding Conventions

- Keep user-facing UI copy and educational content Chinese-first.
- Keep Kotlin, Swift, Gradle, module, and package names in English.
- Prefer small, understandable app structure over premature abstraction.
- Keep sample content limited and representative until the UI/data flow is stable.
- Do not introduce large frameworks, networking, persistence, authentication, or payments without an explicit product decision.

## Cross-Machine Codex Continuity

This file is the portable project memory for Codex. Keep durable decisions here or in checked-in docs rather than relying on chat history alone.

For two-computer development:

- Use GitHub to sync code and documentation.
- Keep repo-specific Codex guidance in `AGENTS.md`.
- Add repo-specific Codex config under `.codex/config.toml` only when the setting should apply to both computers.
- Keep personal credentials, login state, and machine-specific settings out of the repository.

Do not commit the global `~/.codex/` directory.

## Done Criteria

Before calling work complete:

- Explain what changed and where.
- Run the relevant build/test command when the local toolchain allows it.
- If verification cannot run, state the exact reason.
- Keep changes scoped to the requested product direction.
