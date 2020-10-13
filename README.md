# MY LINUX SETUP

Hi, welcome to my very own Linux setup guide. I am using Debian with XFCE desktop environment in this one.

**NOTE:** I used `cd /home/syreus/Downloads` instead of`cd $HOME/Downloads` because in superuser mode, ***problems may occur due to directory complexity of Linux***. When you are doing `sudo` or `su`, your `$HOME` become `/root` instead of `/home/username` in some distros.

### package list we are going to be using:

- **git (you must know at least this one)**
- **JetBrainsMono (font)**
- **vim (text editor and ide)**
- **bspwm and sxhkd (window manager and hotkey manager)**
- **alacritty (terminal)**

### GIT (version control system)

---

**First of all we need to install git**

```bash
sudo apt install -y git
```

**Then go ahead and config git to be able to push repositories to git**

```bash
# to store the data and use it again and again use first code
git config --global credential.helper store

# enter your details for git
git config --global user.name "FaikYY"
git config --global user.email "yazilimcifaik@gmail.com"
```

### JETBRAINSMONO (font)

---

```bash
# put your user name instead of 'syreus'
cd /home/syreus/Downloads

# get the zip file for font
wget https://download.jetbrains.com/fonts/JetBrainsMono-1.0.0.zip

unzip JetBrainsMono-1.0.0.zip

# move it to the system file
sudo mv JetBrainsMono-*.ttf /usr/share/fonts/
```

🎉 **Voila, there you have it, reboot and use it anywhere  you wish** 👍🏻

### VIM (text editor and ide)

---

### BSPWM & SXHKD (window manager and hotkey manager)

---

**Now the most significant one**

```bash
# install dependencies
sudo apt-get install -y libxcb-xinerama0-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-util0-dev libxcb-ewmh-dev libxcb-keysyms1-dev libxcb-shape0-dev psmisc dmenu

# get both bspwm and sxhkd and compile it from source (replace syreus with your username)
cd /home/syreus/Downloads
git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git
cd bspwm && make && sudo make install
cd ../sxhkd && make && sudo make install

# create a new directory for config files
mkdir /home/syreus/.config/bspwm && mkdir /home/syreus/.config/sxhkd

# copy config files - !! this part is special to me. Replace directories with your own !!
cp /home/syreus/linuxSetup/configArchive/bspwm/bspwmrc /home/syreus/.config/bspwm
cp /home/syreus/linuxSetup/configArchive/sxhkd/sxhkdrc /home/syreus/.config/sxhkd

# make it autostart after boot
mkdir /home/syreus/.config/autostart
cp /home/syreus/linuxSetup/configArchive/bspwm/bspwm.desktop /home/syreus/.config/autostart/
cp /home/syreus/linuxSetup/configArchive/sxhkd/sxhkd.desktop /home/syreus/.config/autostart/

# remove xfce window manager and panel to be able to use bspwm in fullscreen
sudo apt remove -y xfwm4 xfce4-panel
sudo chmod u+x /home/syreus/.config/
sudo chmod +x /home/syreus/.config/bspwm/
```

### ALACRITTY (terminal)

---

**we need rust the compile alacritty because it was written in rust**

```bash
# install rust first
curl https://sh.rustup.rs -sSf | sh
cd
source .cargo/env

# install dependencies
sudo apt-get install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3

# go to downloads and compile the terminal
cd /home/syreus/Downloads
git clone https://github.com/alacritty/alacritty.git
cd alacritty
cargo build --release

# shell completion
echo "source $(pwd)/extra/completions/alacritty.bash" >> ~/.bashrc

# make it appear in bash and menu 
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
```