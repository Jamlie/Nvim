# Custom PDE with NeoVim

A personal neovim configuration for `Go`, `Rust`, `JS`

| Language | LSP           | Formatter                           | Debuggers                              |
| -------- | ------------- | ----------------------------------- | -------------------------------------- |
| Go       | gopls         | gofumpt, goimports_reviser, golines | delve (use dlv command for Powershell) |
| JS/TS    | tsserver      | prettierd                           | js-debug-adapter                       |
| Rust     | rust_analyzer | rustfmt                             | codelldb                               |

## Preview

![Oil](https://github.com/Jamlie/nvim/assets/88511754/b9c3d290-3d50-4f19-802b-7f0c430c636a)

![Lsp_Copilot](https://github.com/Jamlie/nvim/assets/88511754/824628fd-50dd-42b3-97e3-5727728f8d8c)

![LazyGit](https://github.com/Jamlie/nvim/assets/88511754/647bd531-586b-4151-8399-b6e6e3c3ed2c)

![Telescope](https://github.com/Jamlie/nvim/assets/88511754/c8ae5649-c46f-4292-ba2a-5643ef760d32)

![DAP](https://github.com/Jamlie/nvim/assets/88511754/425331a0-929e-4a0c-992c-a6e80d1471d9)

## Dependencies

1. [fzf](https://github.com/junegunn/fzf)
2. [ripgrep](https://github.com/BurntSushi/ripgrep)
3. [lazygit](https://github.com/jesseduffield/lazygit)
4. [gofumpt](https://github.com/mvdan/gofumpt)
5. [golines](https://github.com/segmentio/golines)
6. [goimports-reviser](https://github.com/incu6us/goimports-reviser)
7. [prettierd](https://github.com/MunifTanjim/prettier.nvim)
8. [rustfmt](https://github.com/rust-lang/rustfmtt)
9. [Delve](https://github.com/go-delve/delve)

## Font

- JetBrainsMono Nerd Font

## Installation

### Linux/macOS (Unix)

---

Make a backup of your current nvim and shared folder

```sh
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

Clone the repository

```sh
git clone https://github.com/Jamlie/nvim.git ~/.config/nvim
nvim
```

### Windows (Powershell)

---

```powershell
mv $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak
mv $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
```

Clone the repository

```powershell
git clone https://github.com/Jamlie/nvim.git $env:LOCALAPPDATA\nvim
nvim
```

## Keybindings

### General

|     Key     |                     Description                      | Mode |
| :---------: | :--------------------------------------------------: | :--: |
|   \<C-b>    |       Scroll up a page (Cursor in the middle)        |  n   |
|   \<C-u>    |     Scroll up half a page (Cursor in the middle)     |  n   |
|   \<C-d>    |    Scroll down half a page (Cursor in the middle)    |  n   |
|   \<C-h>    |           Switch to the buffer to the left           |  n   |
|   \<C-l>    |          Switch to the buffer to the right           |  n   |
|   \<C-k>    |           Switch to the buffer to the top            |  n   |
|   \<C-j>    |          Switch to the buffer to the bottom          |  n   |
|   \<C-c>    |                    Copy the file                     |  n   |
|      n      | Search for the next same word (Cursor in the middle) |  n   |
|      N      | Search for the prev same word (Cursor in the middle) |  n   |
|      J      |                  Move the line down                  |  v   |
|      K      |                   Move the line up                   |  v   |
|      p      |     Don't copy over visual selection after paste     |  n   |
| \<leader>\  |               Toggle floating terminal               |  n   |
| \<leader>/  |                    Toggle comment                    | n, v |
| \<leader>x  |                     Close buffer                     |  n   |
| \<leader>ie |                  Go Error Handling                   |  n   |

### LSP

|     Key     |     Description     | Mode |
| :---------: | :-----------------: | :--: |
|     gd      |  Go to definition   |  n   |
|     gD      |  Go to declaration  |  n   |
|     gr      |  Go to references   |  n   |
|     gi      | Go to implemetation |  n   |
|      K      |        Hover        |  n   |
| \<leader>ca |    Code actions     |  n   |
| \<leader>cg |       Format        |  n   |
| \<leader>cd |     Diagnostics     |  n   |
| \<leader>cr |       Rename        |  n   |
| \<leader>ct |       Trouble       |  n   |

### LazyGit

|     Key     |  Description  | Mode |
| :---------: | :-----------: | :--: |
| \<leader>gs | Start lazygit |  n   |

### Telescope

|     Key      |  Description   | Mode |
| :----------: | :------------: | :--: |
| \<leader>fa  | Find all files |  n   |
| \<leader>ff  |   Find files   |  n   |
| \<leader>fw  |   Find word    |  n   |
| \<leader>fb  |    Buffers     |  n   |
| \<leader>fh  |   Old files    |  n   |
| \<leader>th  |   Pick theme   |  n   |
| \<leader>fgb |  Git branches  |  n   |
| \<leader>fgc |  Git commits   |  n   |
| \<leader>fgs |   Git status   |  n   |

### Harpoon

|     Key     |       Description       | Mode |
| :---------: | :---------------------: | :--: |
| \<leader>oh |   Toggle harpoon menu   |  n   |
| \<leader>oa |   Add file to harpoon   |  n   |
| \<leader>oq | Previous harpoon window |  n   |
| \<leader>oe |   Next harpoon window   |  n   |

### Dap

|     Key      |    Description    | Mode |
| :----------: | :---------------: | :--: |
| \<leader>db  | Toggle breakpoint |  n   |
| \<leader>dc  |     Continue      |  n   |
| \<leader>dt  |   Dap Terminate   |  n   |
| \<leader>dus |    Show scopes    |  n   |
| \<leader>dsi |   Dap step into   |  n   |
| \<leader>dsu |   Dap step out    |  n   |
| \<leader>dso |   Dap step over   |  n   |
