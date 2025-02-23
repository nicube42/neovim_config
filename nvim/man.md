# Neovim Configuration Manual

## 🌈 General Keybindings

| Shortcut | Action |
|----------|--------|
| `<C-n>`  | Toggle File Explorer (NvimTree) |
| `<C-p>`  | Open file search (Telescope) |
| `<C-f>`  | Search within files (Telescope Live Grep) |
| `gd`     | Go to definition (LSP) |
| `K`      | Show hover documentation (LSP) |
| `<leader>rn` | Rename symbol (LSP) |
| `]d`     | Jump to next diagnostic (LSP) |
| `[d`     | Jump to previous diagnostic (LSP) |
| `<leader>ca` | Code actions (LSP) |
| `<leader>f`  | Format code |
| `<leader>gs` | Git status (Gitsigns) |
| `<leader>gb` | Git blame (Gitsigns) |
| `<leader>gc` | Git commit history |
| `<leader>/`  | Toggle comment (Comment.nvim) |
| `<Tab>`   | Select next autocomplete suggestion |
| `<S-Tab>` | Select previous autocomplete suggestion |

## 📁 File Explorer (NvimTree)
- Open with `<C-n>`
- Navigate with arrow keys or `j/k`
- Press `<CR>` to open a file
- Press `a` to create a file/folder
- Press `d` to delete a file
- Press `r` to rename a file

## 🔎 Searching (Telescope)
- `<C-p>`: Find files
- `<C-f>`: Search within files
- `:Telescope help_tags` to search Neovim help

## 🛠 LSP Features
- Use `gd` to jump to a function or variable definition
- Press `K` to see documentation
- Use `<leader>rn` to rename variables
- Use `<leader>ca` to show code actions

## ✨ UI Enhancements
- **Color Theme:** `tokyonight-night`
- **Smooth Scrolling:** Enabled with vim-smoothie
- **Status Line:** Configured with lualine.nvim

## 🛠 Git Integration (Gitsigns)
- `<leader>gs` to see Git status
- `<leader>gb` to see Git blame
- `<leader>gc` to see commit history

## 🔗 Auto Pairs & Tags
- Automatically closes `()` `{}` `[]` `""` `''`
- Auto-closes and renames HTML/JSX tags

## 🚀 Additional Commands
- `:TSInstallInfo` to see available Treesitter parsers
- `:LspInfo` to check active LSPs
- `:Mason` to manage LSP servers
- `:Lazy` to manage plugins
- `ctrl + t` open/close terminal

## 🤖 Copilot 
- `<leader>co` to enable Copilot
- `<leader>cx` to disable Copilot

