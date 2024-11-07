# chocolatey のインストール

実行環境：PowerShell（管理者権限）


次を参考に chocolatey をインストールする。

https://chocolatey.org/install


# 開発ツールのインストール

choco install googlechrome
choco install vscode


# WSLをインストールする

実行環境：PowerShell（管理者権限）

`wsl --install`  を実行する。
wsl に必要な Windows コンポーネントの構成と wsl がインストールされる。

```
インストール中：仮想マシンプラットフォーム
インストール中：Linux用Windowsサブシステム
インストール中：Ubuntu
```

再起動する。

```
Restart-Computer
```

Ubuntu がインストールされているので、好みのディストリビューションに変更したい場合は、次の手順を参考にする。

# ディストリビューションを変更する

## ディストリビューションをアンインストールする

```
wsl --unregister Ubuntu
# 加えてアプリもインストールされているのでコントロールパネルのアプリ一覧から削除する。
```

## ディストリビューションを確認する

wsl --list --online

## ディストリビューションをインストールする

wsl --install -d Ubuntu-24.04

## ディストリビューションを規定にする

wsl --set-default Ubuntu-24.04

# ソフトウェアの更新

実行環境：PowerShell（管理者権限）

sudo apt update
sudo apt -y upgrade
sudo apt install -y make


# WSLgの確認

WSLg は Linux の GUI を Windows に連携する仕組みです。

GUI の動作確認にテキストエディタをインストールします。

```
sudo snap install gedit
sudo apt install geany
sudo apt install vim-gtk3
```

動作確認をする。

```
gedit
geany
gvim
```

日本語を使いたい場合は、日本語IMEなどLinux側にインストールする必要があります。


# Windows 側の設定

## Windows の拡張子の表示

・「Win」キーと「E」キーを押し、エクスプローラーを起動
・[表示] をクリックし、[ファイル名拡張子] にチェック

## メモなどの管理場所を作成

```
mkdir -p $HOME/documents/tasks
```

Windows側にショートカットを作成する。

```
\\wsl.localhost\Ubuntu-24.04\home\USERNAME\documents\tasks
```


# TODO

・クラウドストレージと連携する


# Python 環境の構築

次を参考に uv をインストールする。
uv は　rye の後継のような環境マネージャー。Astral社が開発している（uvicornなど）。

https://docs.astral.sh/uv/#getting-started

シェルを再起動しコマンドを確認する。

```
uv --version
```


# uv の使い方

uv は Cargo を目指しており、開発標準ツールがバンドルされている。

## リンターの使用

```
uvx ruff

# 特定のバージョンでチェックする
uvx ruff@0.3.0 check
uvx ruff@latest check
```

## プロジェクトの作成と仮想環境の作成

プロジェクトを初期化する（gitなどを使う場合はスキップ）。

```
uv init my-project
cd my-project
```

パッケージを同期する。

```
uv sync
```


# ネットワーク設定

デフォルトではドメインの解決に失敗することがある。
必要に応じてwsl の構成を変更する。

sudo vim /etc/wsl.conf
[network]
generateResolvConf = false


/etc/resolv.conf

```
nameserver 8.8.8.8
```


```
curl github.com
```


# Git の設定

```
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```
