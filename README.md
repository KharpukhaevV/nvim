# Nvim Template

## 🛠️ Installation

#### Make a backup of your current nvim config (if exists)
## Windows 
```shell
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
```

## Linux 
```shell
mv ~/.config/nvim ~/.config/nvim.bak

mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```
#### Install 
## Windows 
```shell
git clone --depth 1 https://github.com/KharpukhaevV/nvim $env:LOCALAPPDATA\nvim
```
## Linux 
```shell
git clone --depth 1 https://github.com/KharpukhaevV/nvim ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```
``
