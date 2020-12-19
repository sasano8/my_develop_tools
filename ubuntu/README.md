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
