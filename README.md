# dotfiles-nix

MacOS(M シリーズ)のみに対応しています。

パッケージ管理: [Nix](https://nixos.org/)

1. Xcode Command Line Tools をインストール
2. [nix-installer](https://github.com/DeterminateSystems/nix-installer) を使って Nix をインストール
3. [Homebrew](https://brew.sh/) をインストール
4. このリポジトリをクローン
5. クローンしたディレクトリで `nix run` を実行

---

## システムとパッケージの更新

```
task update
task switch
```
