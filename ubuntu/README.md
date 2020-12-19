# Vim Plugin Manager
Vimのプラグインマネージャを導入ください。

- https://github.com/tpope/vim-pathogen

エラーが生じる場合は、以下のパッケージを導入してみる。

``` shell
sudo apt-get install vim-gui-common
sudo apt-get install vim-runtime
```


# textlint

## パッケージインストール

``` shell
cd ~
git clone --recursive https://github.com/sasano8/prh-my-rules

# package.jsonに定義したtextlint依存パッケージをグローバルインストール
cat prh-my-rules/package.json | jq ".devDependencies" | jq "keys[]" | sudo xargs npm install -g

# textlintの設定ファイルの雛形をコピー
cp prh-my-rules/textlintrc/default1.json .textlintrc.json

# .editorconfigをコピー
cp prh-my-rules/.editorconfig .
```


# EditorConfig
EditorConfigの拡張を各エディタに導入する。

## vscode
- EditorConfig for vscode

## vim
- https://github.com/editorconfig/editorconfig-vim

## pycharm
- ???



