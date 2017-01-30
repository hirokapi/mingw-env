# MinGW Environment

## How to setup

- Add Windows Environment
    - `setx HOME ^%USERPROFILE^%`
    - `setx CHERE_INVOKING enabled_from_arguments`
    - `setx MSYS2_PATH_TYPE inherit`
    - `setx MSYSTEM MINGW64`
    - `setx WD "C:\git-sdk-64\usr\bin\\"`
    - `setx http_proxy "http://proxy:port" -m`
    - `setx https_proxy "http://proxy:port" -m`
    - `setx no_proxy "localhost" -m`

- Visual C++ Build Tools (for Windows)
    - http://go.microsoft.com/fwlink/?LinkId=691126

- Node.js v4.3.2
    - Download
        - https://nodejs.org/download/release/v4.3.2/node-v4.3.2-x64.msi
    - Install package
        - `npm install -g node-gyp@3.4.0`
        - `npm rebuild -g node-gyp@3.4.0`
        - `npm install -g typescript@2.0.3`
        - `npm install -g tslint@3.15.1`
        - `npm install -g typings@1.4.0`
        - `npm install -g karma-cli@1.0.1`
        - `npm install -g mocha-cli@1.0.1`
        - `npm install -g semistandard`
        - `npm install -g eslint-cli`
        - `npm install -g eslint`
        - `npm install --save-dev eslint`
            - ※ `eslint-cli` をグローバル インストールしておくと `--save-dev` でインストールした ESLint を実行する eslint コマンド が使えるようになる
    - Reference
        - `npm dedupe --no-bin-links --save`
        - `npm install --no-bin-links`

- Git for Windows SDK
    - https://github.com/git-for-windows/build-extra/releases
    - `c-drive/users/hirokapi/.bashrc`

- Add font "Myrica"
    - https://myrica.estable.jp/

- Terminal
    - `c-drive/users/hirokapi/.minttyrc`
    - `c-drive/git-sdk-64/`
        - copy `etc/**/*`
        - copy `usr/**/*`
        - copy `mingw64/**/*`
        - copy `mingw64_shell.exe`
        - copy `mingw64.ico`
        - edit `mingw64.ini`
            - `#MSYS2_PATH_TYPE=inherit` の `#` コメントアウトを外す

- Vim
    - `c-drive/users/hirokapi/`
        - copy `.vimrc`
        - copy `.vim/**/*`
        - copy `.ctags`
        - copy `.tags/**/*`

- Gvim
    - `c-drive/program-files/vim/gvim.exe`
    - `c-drive/git-sdk-64/`
        - copy `gvim.ico`

- Pacman
    - `rm -f /var/lib/pacman/sync/*`
    - `rm -rf /etc/pacman.d/gnupg`
    - `pacman-key --init`
    - `pacman-key --populate msys2`
    - `pacman-key --refresh-keys`
    - `rm -f /var/lib/pacman/sync/*`
    - `pacman -S automake autoconf libevent pkg-config doxygen libtool gettext-devel heimdal-devel libarchive-devel libcurl-devel libgpgme-devel libsqlite-devel`
    - `git clone git@github.com:Alexpux/MSYS2-packages.git`
    - `cd MSYS2-packages/pacman/`
    - `makepkg --skippgpcheck`
    - `pacman -Syy`
    - `pacman -Syu`
    - `pacman -S ctags tmux-git rsync ruby wget man zip unzip mingw-w64-cross-gcc mingw-w64-i686-gcc mingw-w64-i686-glib2 mingw-w64-x86_64-libevent mingw-w64-x86_64-liblas mingw-w64-x86_64-python2-pip mingw-w64-x86_64-iconv sshpass`

- Python v2.7.12 (for Windows)
    - Install
        - https://www.python.org/downloads/
    - Copy DLL
        - `> mingw_shell.exe`
        - `$ cp /c/Windows/SysWOW64/python27.dll /mingw64/lib/`
    - Make Def
        - Download source
            - `$ wget http://sourceforge.mirrorservice.org/m/mi/mingw/MinGW/Extension/pexports/pexports-0.47/pexports-0.47-mingw32-src.tar.xz`
            - `$ tar Jxfv pexports-0.47-mingw32-src.tar.xz`
            - `$ cd pexports-0.47`
        - Install with customize
            - `$ vim /mingw64/lib/python2.7/site-packages/sitecustomize.py`  
                > import sys  
                > sys.setdefaultencoding('utf-8')
            - `$ ./configure`
            - `$ make`
            - `$ make install`
        - Make .def file
            - `$ mkdir /mingw64/libs`
            - `$ pexports.exe /mingw64/lib/python27.dll > /mingw64/libs/python27.def`

- Make `vimproc_cygwin.dll`
    - `> start C:\git-sdk-64\msys2.exe`
    - `$ cd /c/Users/hirokapi/.vim/dein/repos/github.com/Shougo/vimproc/`
    - `$ make -f make_cygwin.mak`
    - `$ ll lib`

- byobu
    - `$ wget https://launchpad.net/byobu/trunk/5.113/+download/byobu_5.113.orig.tar.gz`
    - `$ tar xvfz byobu_5.113.orig.tar.gz`
    - `$ cd byobu-5.113`
    - `$ ./configure`
    - `$ make`
    - `$ make install`
    - `$ cp ${mingw-env}/c-drive/git-sdk-64/mingw64/bin/route /mingw64/bin/`
    - `$ cp ${mingw-env}/c-drive/users/hirokapi/.byoburc ~/`
    - `$ byobu-disable`

- tmux
    - `c-drive/users/hirokapi/.tmux.conf`

- nkf コマンドを入れる
    - `wget https://ja.osdn.net/projects/nkf/downloads/64158/nkf-2.1.4.tar.gz`
    - `tar zxvf nkf-2.1.4.tar.gz`
    - `cd nkf-2.1.4`
    - `make`
    - `mkdir /usr/local/bin`
    - `make install`

- Python (2.7)
    - `mv /usr/bin/python.exe /usr/bin/python.exe.${yyyymmdd}`
    - `$ cp -p /usr/bin/python2.7.exe /usr/bin/python.exe`
    - `$ python -m pip install --upgrade pip`

- SSH, SCP
    - MinGW64 から ssh コマンドで VM に接続できるようにする
        - 概要
             - VM の IP をホストマシンと同じにすることはできない
             - ポートフォワーディングで、 Windows にアクセスしてると見せかける
        - ゲストマシンで ssh を起動する設定
            - ホストマシン側で確認
                - `ping %HOST_NAME% | nkf`
            - VM
                - `# apt-get install ssh`
                - `# sysv-rc-conf --level 2345 ssh on`
                - `# sysv-rc-conf --level 016 ssh off`
                - `# sysv-rc-conf --list ssh`
                - `# /etc/init.d/ssh start`
                - `# ps -ef | grep sshd`
        - ネットワーク設定を NAT にして、ポートフォワーディングすると OK
            - TCP でホスト側を 2222、ゲスト側を 22 に設定を追加
            - %USERPROFILE%/.ssh/config から * の設定を削除
                - host *
                    - proxycommand ssh -w %h:%p proxy:port
                    - tcpkeepalive yes
        - 動作確認
            - ssh コマンドで接続して mysql を操作する
                - `ssh -p 2222 username@localhost`
            - scp コマンドの確認
                - `scp -p 2222 /c/users/username/desktop/fuga.txt username@localhost:/mnt/host-os/`

- Google 日本語入力
    - インストール
        - https://www.google.co.jp/ime/
    - プロパティから下記のファイルをインポートする
        - `c-drive/users/hirokapi/desktop/google-japanese-keymap.txt`

## How to use

- Terminal
    - `c-drive/git-sdk-64/mingw64_shell.exe`

- Byobu
    - 基本操作
        - `byobu` ・・・ byobu を起動
        - `<F5>` ・・・ 設定をリロードする
        - `<F6>` ・・・ セッションを維持したままウィンドウを閉じる
    - ウィンドウ分割
        - `<Ctrl> + <F2>` ・・・ ウィンドウを縦に分割
        - `<Shift> + <F2>` ・・・ ウィンドウを横に分割
        - `<Shift> + <F3>` ・・・ 分割したウィンドウの「前」へ移動する
        - `<Shift> + <F4>` ・・・ 分割したウィンドウの「次」へ移動する
    - ウィンドウ作成
        - `<F2>` ・・・ 新規でウィンドウを作成する
        - `<F3>` ・・・ 作成したウィンドウの「前」へ移動する
        - `<F4>` ・・・ 作成したウィンドウの「次」へ移動する
        - `<F8>` ・・・ 作成したウィンドウ名前を変更する
    - コピーモード
        - `<Shift>` キーを押しながらドラッグ＆ドロップでクリップボードにコピー
        - `<F7>` byobu のコピーモードに意向する
        - コピーモード中は vi のキーバインドで選択可能
        - `<Enter>` キーを押すと byobu のバッファにコピーされる
    - 参考URL
        - http://qiita.com/kayama0fa@github/items/82d3ebab8bb297bdfd23

- (Deprecated) tmux
    - 基本操作
        - `tmux` ・・・ tmux を起動
        - `<Ctrl-b> + <%>` ・・・ ウィンドウを縦に分割
        - `<Ctrl-b> + <">` ・・・ ウィンドウを横に分割
        - `<Ctrl-b> + <;>` ・・・ 分割したウィンドウを行き来する
        - `<Ctrl-b> + <&>` ・・・ tmux のセッションを kill する
        - `<Ctrl-b> + <h, j, k, l>` ・・・ 分割画面への移動をviライクに割当
    - マウス操作
        - 分割したウインドウをクリックして、そのウィンドウをアクティブにする
        - `<Shift>` 押下中に左クリック範囲選択でクリップボードにコピー
        - 上記に加え、 `<Alt>` も同時押下で短形選択ができる
        - `<Shift>` 押下中に右クリックでペースト
    - コピーモード
        - `<[>` ・・・ コピーモードの開始（カーソルキーで自由に移動）
        - `<Space>` ・・・ コピー開始位置決定（viモード）
        - `<Enter>` ・・・ コピー終了位置決定（viモード）
        - `<]>` ・・・ コピーした内容を貼り付け
    - 参考URL
        - http://qiita.com/nmrmsys/items/03f97f5eabec18a3a18b

- Vim
    - `$ vim`

- Gvim
    - `c-drive/program-files/vim/gvim.exe`

- Ctags (Vim)
    - `ctags --list-maps`
    - `cd ${workspace}/${project}`
    - `ctags --languages=javascript -f ~/.tags/js.tags pwd`
    - `vim xxxxxxxx.js`
    - `:TagsGenerate`

- Markdown Preview (Vim)
    - Install
        - `mkdir ~/.vim/dein/.dein/autoload/`
        - `cp ${mingw-env}/c-drive/users/hirokapi/.vim/dein/.dein/autoload/openbrowser.vim ~/.vim/dein/.dein/autoload/`
        - `cp ${mingw-env}/c-drive/users/hirokapi/.vim/dein/.dein/autoload/openbrowser.vim ~/.vim/dein/repos/github.com/tyru/open-browser.vim/autoload/`
        - `cp ${mingw-env}/c-drive/users/hirokapi/.vim/dein/.dein/autoload/openbrowser.vim ~/.vim/dein/.cache/.vimrc/.dein/autoload/`
    - How to
        - `:PrevimOpen` or `<F5>`

- VirtualBox Login
    - `$ ssh -p 2222 username@localhost`
    - `$ mysql -u hirokapi -p`

- Windows Application
    - [Example] `$ start mysql -u root -p`

## コンテキストメニューに追加

- `regedit`
    - `HKEY_CLASSES_ROOT/*/shell/GVimで開く/command/(既定)`
        - `"%VIM_HOME%\gvim.exe" "%1"`
    - `HKEY_CLASSES_ROOT/Directory/shell/MinGW64 ウィンドウをここで開く/command/(既定)`
        - `"C:\git-sdk-64\mingw64_shell.exe" "%1"`

## VirtualBox

- Windows サービス化
    - 参考サイト
        - https://sourceforge.net/projects/vboxvmservice/files/
        - http://kiririmode.hatenablog.jp/entry/20151001/1443625200
    - 手順
        - $ vim C:/vms/VBoxVmService.ini  
          > [Settings]  
          > VBOX_USER_HOME=%USERPROFILE%/.VirtualBox  
          > RunWebService=no  
          > PauseShutdown=5000  
          >
          > [Vm0]  
          > VmName=Ubuntu  
          > ShutdownMethod=savestate  
          > AutoStart=yes
        - `C:\vms> VmServiceControl.exe -u`
        - `C:\vms> VmServiceControl.exe -i`
- ランレベルを 3 に変更してCUI モードにする
    - `$ sudo su -`
    - `# init 3`
    - `# runlevel → "2 3"`
    - `# vim /etc/init/rc-sysinit.conf → "env DEFAULT_RUNLEVEL=3"`
    - `# vim /etc/default/grub`
    - `# GRUB_CMDLINE_LINUX_DEFAULT="quiet text"`
    - `# update-grub`
    - `# init 6`
- 共有フォルダの作成
    - ホストマシンの VirtualBox の設定で共有フォルダ `${USERPROFILE}/Desktop/vbox/${USERNAME}/` を `${USERNAME}` で作成する
    - ホストOS側の共有フォルダの自動マウント設定を OFF にして仮想マシンを再起動する
    - `$ sudo su -`
    - `# mkdir /mnt/vbox`
    - `# chmod 777 /mnt/vbox`
    - `# exit`
    - `$ mkdir /mnt/vbox/${USERNAME}`
    - `$ sudo su -`
    - `# vim /etc/fstab`  
      > # VirtualBox  
      > ${USERNAME}  /mnt/vbox/${USERNAME}  vboxsf  fmode=0644,dmode=0755,uid=${UID},gid=${GID}  0  0
    - `# vim /etc/modules`  
      > vboxsf
    - `# init 6`
- MySQL 5.6 ( ≒ AWS Aurora )
    - Install
        - `# cd /usr/local/src/`
        - `# wget http://dev.mysql.com/get/mysql-apt-config_0.8.0-1_all.deb`
        - `# dpkg -i mysql-apt-config_0.8.0-1_all.deb`
        - `# apt-get update`
        - `# apt-get install mysql-server-5.6`
        - `# apt-get install mysql-server-5.6`
        - `# sysv-rc-conf --level 2345 mysql on`
        - `# sysv-rc-conf --level 016 mysql off`
        - `# sysv-rc-conf --list mysql`
        - `# ps -ef | grep mysqld`
        - `# netstat -ant | grep 3306`
    - Grant
        - `# cat /etc/mysql/debian.cnf`
        - `# mysql -u root -p`
        - `mysql> select user,host from mysql.user;`
        - `mysql> GRANT ALL ON *.* TO 'debian-sys-maint'@'localhost' IDENTIFIED BY 'XXXXXXXXXXXXXXXX';`
        - `mysql> GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'root';`
        - `mysql> FLUSH PRIVILEGES;`
        - `mysql> select user,host from mysql.user;`
        - `mysql> exit;`
    - Home
        - `# cat /etc/passwd | grep mysql`
        - `# mkdir /home/mysql`
        - `# chown mysql:mysql /home/mysql`
        - `# ll /home/`
        - `# usermod -d /home/mysql/ mysql`
        - `# cat /etc/passwd | grep mysql`
    - Config
        - `# netstat -ant | grep 3306`  
            > tcp    0    0    127.0.0.1:3306    0.0.0.0:*    LISTEN
        - `# vim /etc/mysql/my.cnf`  
            > [client]  
            >  :  :  :  
            > default-character-set = utf8mb4  
            >  
            > [mysqld]  
            >  :  :  :  
            > \#bind-address = 127.0.0.1  
            >  :  :  :  
            > character-set-server = utf8mb4  
            > lower_case_table_names = 1
    - Stop
        - `# killall mysqld`
        - `# /etc/init.d/mysql stop`
    - Start
        - `# /etc/init.d/mysql start`  
    - ホスト OS の MySQL ワークベンチ から VM の MySQL に接続できるようにする
        - `# netstat -ant | grep 3306`  
            > tcp6    0    0    :::3306    :::*    LISTEN
        - `# apt-get remove iptables;`
        - `# init 0`
        - ネットワーク設定の NAT のポートフォワーディングを設定する
            - TCP でホスト側を 3306 、ゲスト側を 3306 に設定追加
            - UDP でホスト側を 3306 、ゲスト側を 3306 に設定追加
        - ホストから User:root, Password:****, localhost:3306 で接続可能になる

## (Deprecated) Ubuntu に tmux-2.2 をインストール

- root になる
    - `$ sudo su -`

- ビルドに必要なパッケージをインストール
    - `# apt-get build-dep tmux`
    - `# apt-get install autoconf libtool pkg-config`

- gitで最新のソースをダウンロード
    - `# wget https://github.com/tmux/tmux/archive/2.2.zip`
    - `# unzip tmux-2.2.zip`
    - `# rm tmux-2.2.zip`
    - `# cd tmux-2.2/`

- ビルドしてインストール
    - `# ./autogen.sh`
    - `# ./configure --prefix=/usr/local`
    - `# make`
    - `# make install`

## 起動スクリプトが無いミドルウェアのデーモン化（VM上のUbuntuを想定）

- `$ sudo apt-get install supervisor`
- `$ sudo vim /etc/supervisor/conf.d/${MIDDLEWARE_NAME}.conf`  
    > [program:${MIDDLEWARE_NAME}]  
    > directory=${USER_HOME}  
    > command=${MIDDLEWARE_COMMAND}  
    > numprocs=1  
    > autostart=true  
    > autorestart=true  
    > user=${USER_NAME}  
    > redirect_stderr=true  
    > stdout_logfile=/var/log/supervisor/${MIDDLEWARE_NAME}.log
- `sudo /etc/init.d/supervisor restart`
- `sudo ps -ef | grep ${MIDDLEWARE_NAME}`

## Tools

- ERD (BurntSushi)
    - 本家 URL
        - https://github.com/burntsushi/erd
    - Install
        - Haskell Platform
            - https://www.haskell.org/platform/windows.html
                - haskellplatform-8.0.1-full-x86_64-setup-a.exe
        - Graphviz
            - Windows Installer
                - http://www.graphviz.org/download_windows.php
                    - `graphviz-2.38.msi`
            - Add Environment
                - `set GRAPHVIZ_HOME="C:\program files (x86)\graphviz2.38"`
                - `set PATH=%PATH%;%GRAPHVIZ_HOME%\bin`
        - ERD
            - `mingw64_shell.exe`
            - `$ git clone https://github.com/burntsushi/erd.git`
            - `cmd.exe`
            - `> cd erd`
            - `> cabal update`
            - `> cabal install graphviz`
            - `> cabal configure`
            - `> cabal build`
            - `exit`
    - Test
        - `mingw64_shell.exe`
        - `$ mv erd/dist/build/erd/erd.exe /usr/bin/`
        - `$ wget -o - "https://raw.github.com/burntsushi/erd/master/examples/simple.er" > simple.er`
        - `$ cat simple.er`
        - `$ erd -i simple.er -o simple.pdf`

- PlantUML
    - 本家 URL
        - http://plantuml.com/
    - Test
        - 本家サイトを参考に、vim エディタで PlantUML を記載する
        - ファイルの拡張子を ".pu" にして保存する
        - ファイルを開いた状態で、 ＜F5＞ キーを押下する
        - 同じフォルダに、%ファイル名%.png というファイルが生成される

## Tips

- Vim ショートカット
    - `:sp` で横分割
    - `:vsp` で縦分割
    - `:NERDTree` で Tree 表示  
    - 選択範囲を `=` でコードフォーマッタ適応
    - Insert モード時に ＜Ctrl+N＞ でコード補完ができる

- `.gitconfig`  
    > [core]  
    > autoCRLF = false  
    > editor = vim -c \"set fenc=utf-8\"
