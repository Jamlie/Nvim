# Custom PDE with NeoVim

A personal neovim configuration for `Go` and `JS`

| Language | LSP      | Formatter                           |
| -------- | -------- | ----------------------------------- |
| Go       | gopls    | gofumpt, goimports_reviser, golines |
| JS/TS    | tsserver | prettierd                           |

## Preview

![Dashboard](https://cdn.discordapp.com/attachments/1135974583896395926/1193961078623850788/image.png?ex=65ae9de7&is=659c28e7&hm=cf5848d15bd152252cb19df07fc630f2b9ee24fb11ffd772e1a0ce9832b32ed4&)

![LSP](https://cdn.discordapp.com/attachments/1135974583896395926/1193962235417088110/image.png?ex=65ae9efb&is=659c29fb&hm=c377b2a600de35f84d651ec304e5a5f7df7a9cbf3bce317df48d020e327f5141&)

![LazyGit](https://cdn.discordapp.com/attachments/1135974583896395926/1193962807985721487/image.png?ex=65ae9f84&is=659c2a84&hm=d8f3e043a76559d85903f8aacaac1a89a303743be9bd597201ab22261fca97db&)

![Telescope](https://cdn.discordapp.com/attachments/1135974583896395926/1193963445587017768/image.png?ex=65aea01c&is=659c2b1c&hm=e190ce8abd29204610453b15989847905b3dadd2bebcaf950eabcac5b055748a&)

## Dependencies

1. fzf
2. ripgrep
3. lazygit
4. gofumpt
5. golines
6. goimports-reviser
7. prettierd

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
