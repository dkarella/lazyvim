# Neovim Config

Minimal config designed for dual use: terminal Neovim for quick edits, and [vscode-neovim](https://github.com/vscode-neovim/vscode-neovim) for VS Code.

`vim.g.vscode` guards ensure UI plugins (colorscheme, explorer, undotree, which-key) only load in standalone Neovim. Motions (nvim-spider) and text objects load in both.

## New environment setup

### Terminal Neovim

Just clone this repo to `~/.config/nvim`. Lazy.nvim bootstraps itself on first launch.

### VS Code

1. Install the [vscode-neovim](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim) extension.

2. Add to your VS Code `settings.json` (`Cmd+Shift+P` → "Open User Settings JSON"):

```json
"vscode-neovim.neovimExecutablePaths.darwin": "/opt/homebrew/bin/nvim",
"vscode-neovim.neovimInitVimPaths.darwin": "/Users/<you>/.config/nvim/init.lua"
```

> Adjust the path if nvim is elsewhere (`which nvim`). On Linux use the `.linux` variants of both keys.

3. Add to your VS Code `keybindings.json` (`Cmd+Shift+P` → "Open Keyboard Shortcuts JSON"):

```json
[
    {
        "key": "ctrl+x",
        "command": "workbench.action.terminal.focus",
        "when": "terminalFocus"
    }
]
```

4. Reload VS Code and verify with `:checkhealth` (run from the command palette or Neovim command line inside VS Code).

## Key mappings (VS Code)

| Key | Action |
|-----|--------|
| `\|` | Split editor down |
| `\` | Split editor right |
| `<leader>e` | File explorer |
| `<leader>bp` | Copy relative path |
| `<leader>bP` | Copy absolute path |
| `<leader>bn` | Copy filename |
| `gI` | Go to implementation |
| `gr` | Go to references |
| `K` | Show hover |
| `W` / `E` / `B` | camelCase/snake_case word motions |
