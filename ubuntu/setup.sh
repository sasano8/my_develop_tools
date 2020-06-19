

# 事前準備
sudo apt install -y git

# modify git uses text editor
git config --global core.editor 'vi -c "set fenc=utf-8"'

sudo apt install -y curl
git clone https://github.com/sasano8/memo.git

sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

# show in explorer
echo "alias start='xdg-open'" | sudo tee -a /etc/profile

# locate the mouse pointer to push ctrl key
gsettings set org.gnome.desktop.interface locate-pointer true


# install google chrome

## add repository
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee -a /etc/apt/sources.list.d/google.list

## trust signing_key
sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt update

## install
sudo apt install -y google-chrome-stable



# install pip3
sudo apt install -y python3-pip

# install setuptools
# pythonの標準パッケージを拡張し、pythonプロジェクトのパッケージ化を支援する開発用ライブラリ
sudo pip3 install setuptools

# install pipenv
sudo pip3 install pipenv
echo PIPENV_VENV_IN_PROJECT=1 | sudo tee -a /etc/profile

# install poetry
sudo apt install -y python3-distutils
sudo pip3 install poetry
sudo poetry config virtualenvs.create true
sudo poetry config virtualenvs.in-project true
poetry config virtualenvs.create true
poetry config virtualenvs.in-project true


# install poetry-dynamic-versioning
# poetryでpackageをpublishする際に、動的にバージョンを更新する
sudo pip3 install poetry-dynamic-versioning

# install cookiecutter
sudo pip3 install cookiecutter

# 
sudo pip3 install twine

# install docker
sudo apt install -y docker-compose


## 各種ツールからdockerへ接続するために権限を付与する
sudo usermod -aG docker $USER

sudo systemctl enable docker
sudo systemctl start docker


# dockerはipv6を標準で無効化されているためホスト側もipv6を無効化
sudo sysctl net.ipv6.conf.all.disable_ipv6
sudo sysctl net.ipv6.conf.default.disable_ipv6
sudo sysctl net.ipv6.conf.lo.disable_ipv6


/etc/sysctl.conf

sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=1



# install python3.7
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt install -y python3.7

# install circleci
sudo snap install circleci

## circleci cliを利用するにはapiトークンを取得した上でsetupを行う
https://app.circleci.com/settings/user/tokens
circleci setup


# memo

 mozc有効化

torbrowser-launcher





# キーボードショートカット

# tools

# vimの設定(デフォルトで互換モードとなっており、方向キーがABCDに対応していたり扱いにくい)
cat << EOS >> ~/.vimrc
" =============== my vimrc ===============
set encoding=utf-8

" 互換モード（方向キーがABCDになる）解除
set nocompatible
set number

" バックスペース時に前の行をまたぐ
set backspace=indent,eol,start

" 検索時など大小文字を区別しない
set ignorecase

" tabを可視化する
set list listchars=tab:\▸\-

" tabを半角スペースにする
set expandtab
set tabstop=2

EOS


# ==================================================
# GNOMEの設定
# ==================================================

# 設定変更するためのUIアプリケーション
sudo apt install dconf-editor

# マウスホイールの設定
# インストール後に自動起動するアプリケーションに登録すること
sudo apt install imwheel

cat <<EOF | tee ~/.imwheelrc
".*"
None,      Up,   Button4, 5
None,      Down, Button5, 5
EOF

# gnomeのカスタマイズ
sudo apt install -y chrome-gnome-shell



# pycharm
sudo snap install pycharm-professional --classic



# 環境変数などはどこに定義するのか
やりたいこと
システムとして共通の環境変数を定義する
GUIログインしたときに永続的に定義した環境変数が有効化されている

/etc/profile 有効にならなかった
/etc/profile.d/mycustom.sh 有効にならなかった
~/.profile 有効にならなかった
~/.bashrc 有効になった
