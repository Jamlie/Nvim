# Custom PDE with NeoVim

A personal neovim configuration for `Go`, `Rust`, `JS`

| Language | LSP           | Formatter                           | Debuggers               |
| -------- | ------------- | ----------------------------------- | ----------------------- |
| Go       | gopls         | gofumpt, goimports_reviser, golines | delve (use dlv command) |
| JS/TS    | tsserver      | prettierd                           | ...                     |
| Rust     | rust_analyzer | rustfmt                             | codelldb                |

## Preview

![Dashboard](https://cdn.discordapp.com/attachments/1135974583896395926/1193961078623850788/image.png?ex=65ae9de7&is=659c28e7&hm=cf5848d15bd152252cb19df07fc630f2b9ee24fb11ffd772e1a0ce9832b32ed4&)

![LSP](https://cdn.discordapp.com/attachments/1135974583896395926/1193962235417088110/image.png?ex=65ae9efb&is=659c29fb&hm=c377b2a600de35f84d651ec304e5a5f7df7a9cbf3bce317df48d020e327f5141&)

![LazyGit](https://cdn.discordapp.com/attachments/1135974583896395926/1193962807985721487/image.png?ex=65ae9f84&is=659c2a84&hm=d8f3e043a76559d85903f8aacaac1a89a303743be9bd597201ab22261fca97db&)

![Telescope](https://cdn.discordapp.com/attachments/1135974583896395926/1193963445587017768/image.png?ex=65aea01c&is=659c2b1c&hm=e190ce8abd29204610453b15989847905b3dadd2bebcaf950eabcac5b055748a&)

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
|      n      | Search for the next same word (Cursor in the middle) |  n   |
|      N      | Search for the prev same word (Cursor in the middle) |  n   |
|      J      |                  Move the line down                  |  v   |
|      K      |                   Move the line up                   |  v   |
|      p      |     Don't copy over visual selection after paste     |  n   |
| \<leader>s  |                         Save                         |  n   |
| \<leader>c  |                    Copy the file                     |  n   |
| \<leader>\  |               Toggle floating terminal               |  n   |
| \<leader>/  |                    Toggle comment                    | n, v |
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

### NvimTree

|  Key   | Description | Mode |
| :----: | :---------: | :--: |
| \<C-n> | Toggle tree |  n   |

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
| \<leader>fgb |  Git branches  |  n   |
| \<leader>fgc |  Git commits   |  n   |
| \<leader>fgs |   Git status   |  n   |

### Bufferline

|     Key     |     Description     | Mode |
| :---------: | :-----------------: | :--: |
|   \<Tab>    |     Next buffer     |  n   |
|  \<S-Tab>   |     Next buffer     |  n   |
| \<leader>bp |     Pick buffer     |  n   |
| \<leader>bx |    Close buffer     |  n   |
| \<leader>bX | Close other buffers |  n   |

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
