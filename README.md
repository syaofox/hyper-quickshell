## Quickshell 脚本

本仓库通过 **git submodule** 管理 quickshell 脚本（独立仓库：[syaofox/quickshell](https://github.com/syaofox/quickshell)）。

### 克隆（含子模块）

```bash
git clone --recurse-submodules git@github.com:syaofox/hyper-quickshell.git
```

如果已经克隆了，拉取子模块：

```bash
git submodule update --init --recursive
```

### 更新子模块

```bash
cd dotfiles/.config/quickshell && git pull
cd ../.. && git add dotfiles/.config/quickshell && git commit -m "update quickshell"
```

### 部署

使用 `stow`：

```bash
stow -t ~ dotfiles
```

quickshell 脚本会部署到 `~/.config/quickshell/`。