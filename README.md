

## 使用方法

### プロジェクトの取り込み

### ビルドのみ実行

`Ctrl + Shift + B` でビルド実行

### デバイスへの書き込み＆デバッグ

1. 書き込みデバイスの接続
    
    ```bash
    usbipd.exe wsl list 2>/dev/null | awk '{if($0 ~ /Picoprobe/){print $0}}'
    ```
    
    上のコマンドを実行すると行の先頭に 1-1 のような番号が振られる
    
    これが bus id となるので、<bus_id> と置き換える
    
    ```bash
    usbipd.exe wsl attach -b <bus_id>
    ```
    
2. 左のサイドバーにあるデバッグボタンをクリック


1. 

## 開発環境準備

### WSL セットアップ

ubuntu 22.04 を使用

```bash
sudo apt update
sudo apt upgrade
```

### VScode セットアップ

C develop

- ms-vscode.cpptools-extension-pack

wsl

- ms-vscode-remote.vscode-remote-extensionpack

cmake 

- twxs.cmake
- ms-vscode.cmake-tools

debug

- marus25.cortex-debug
    - mcu-debug.memory-view
    - mcu-debug.peripheral-viewer
    - mcu-debug.rtos-views

git

- mhutchie.git-graph
- donjayamanne.githistory
- eamodio.gitlens
- waderyan.gitblame

### build 環境

build 用 toolchain の install

```bash
$ sudo apt install cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential
```

### gdb 環境

gdb の install

```bash
$ sudo apt install gdb-multiarch
```

### OpenOCD 環境

1. OpenOCD の依存 package install
    
    ```bash
    $ sudo apt install automake autoconf build-essential texinfo libtool libftdi-dev libusb-1.0-0-dev pkg-config
    ```
    
2. Raspberry pi pico 向け OpenOCD の download
    
    ```bash
    $ git clone https://github.com/raspberrypi/openocd.git --branch rp2040 --recursive --depth=1
    ```
    
3. OpenOCD を picoprobe 向けに設定して build, install
    
    ```bash
    $ cd openocd
    
    #config
    $ ./bootstrap
    $ ./configure --enable-picoprobe
    
    #build
    $ make -j4
    
    # install
    $ sudo make install
    ```
    
4. `openocd/contrib/` 内の `60-openocd.rules` を `/etc/udev/rules.d/` にコピー
    
    ```bash
    #copy rules file to /etc/udev/rules.d/
    $ sudo cp 60-openocd.rules /etc/udev/rules.d/
    
    #reload
    $ sudo udevadm control --reload
    ```
    

### USBIP 設定

- windows 10 側設定

https://github.com/dorssel/usbipd-win/releases

- WSL 側設定

```bash
sudo apt install linux-tools-generic hwdata
sudo update-alternatives --install /usr/local/bin/usbip usbip /usr/lib/linux-tools/*-generic/usbip 20
```

- 初回のみ管理者権限で手動接続(powershell)

```bash
usbipd wsl list
//picoprobe の busid 確認
usbipd wsl attach --busid <busid>
```

- 接続を確認(wsl)

```bash
lsusb
```
