# Changelog

All notable changes to the Cloud Architect Lab CLI (CAL) will be documented in this file.

## Unreleased

### Added

- Began CAL v1.0 foundation work.
- Added reusable project templates.
- Added user workspace configuration through `~/.cal/config`.

### Changed

- Refactored the CLI into a standard `bin/` directory.
- Removed the hard-coded workspace path from the CLI.

## v0.2.0

### Added

- Modular command architecture
- Reusable documentation template assets
- Standards-aligned project scaffolding
- Git initialization with a default `main` branch
- MIT license generation with author and year placeholders
- `.gitkeep` files for required empty directories

### Changed

- Refactored `bin/cal` into a lightweight command dispatcher
- Moved project creation logic into `lib/commands/new.sh`
- Expanded the generated repository documentation structure
- Improved the default `.gitignore` template
