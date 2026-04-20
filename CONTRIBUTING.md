# Contributing to copilot-lualine

Thank you for considering contributing to copilot-lualine! This document
provides guidelines and information to help you get started.

## Development Setup

### Requirements

- [Neovim](https://neovim.io/) >= 0.9.0
- [StyLua](https://github.com/JohnnyMorganz/StyLua) for code formatting
- [luacheck](https://github.com/mpeterv/luacheck) for linting

### Project Structure

```
copilot-lualine/
├── lua/
│   ├── copilot-lualine/          # Core plugin module
│   │   ├── init.lua              # Status checking functions
│   │   ├── colors.lua            # Color utility functions
│   │   └── spinners.lua          # Spinner animation definitions
│   └── lualine/
│       └── components/
│           └── copilot.lua       # Lualine component implementation
├── tests/                        # Unit tests (busted)
│   ├── minimal_init.lua          # Minimal Neovim config for tests
│   ├── colors_spec.lua           # Tests for color utilities
│   └── spinners_spec.lua         # Tests for spinner definitions
├── doc/
│   └── copilot-lualine.txt       # Vimdoc help file
├── .luacheckrc                   # Luacheck configuration
├── stylua.toml                   # StyLua configuration
└── .editorconfig                 # Editor configuration
```

## Code Style

This project uses [StyLua](https://github.com/JohnnyMorganz/StyLua) for
formatting and [luacheck](https://github.com/mpeterv/luacheck) for linting.

Before submitting changes, please run:

```sh
# Format code
stylua lua/ tests/

# Lint code
luacheck lua/ tests/
```

Both tools are configured via `stylua.toml` and `.luacheckrc` in the project
root. CI will enforce these checks on all pull requests.

## Running Tests

Tests use [busted](https://olivinelabs.com/busted/) via Neovim's built-in
Lua runtime:

```sh
nvim --headless -u tests/minimal_init.lua -c "lua require('busted.runner')({ standalone = false })" -c "qa!" -- tests/
```

## Adding Features

1. Create a topic branch from `main`.
2. Make your changes, following the existing code style.
3. Add or update tests for your changes.
4. Update documentation (`doc/copilot-lualine.txt` and/or `README.md`) as
   needed.
5. Run formatting, linting, and tests.
6. Submit a pull request.

## Reporting Issues

When reporting issues, please include:

- Neovim version (`:version`)
- Plugin manager and configuration
- Steps to reproduce the issue
- Expected vs. actual behavior

## Type Annotations

This project uses [LuaCATS](https://luals.github.io/wiki/annotations/)
annotations (EmmyLua-style) for type documentation. Please add annotations
to any new public functions.
