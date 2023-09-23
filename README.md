# ZSH
`$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

# Version Managers
```
$ open https://nodejs.org/en/download/package-manager
$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
$ \curl -sSL https://get.rvm.io | bash -s stable
$ curl https://sh.rustup.rs -sSf | sh
```

# Git
```
$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
$ eval "$(ssh-agent -s)"
$ ssh-add ~/.ssh/id_rsa
$ xclip -sel clip < ~/.ssh/id_rsa.pub
$ git config --global user.email "your_email@example.com"
$ git config --global user.name "YourName"
$ git config --global alias.co checkout
$ git config --global credential.helper store
```

# neovim
```
$ pip install -U pip
$ sudo pip install --upgrade neovim
```

# mpv
```
$ git clone --recursive https://github.com/Argon-/mpv-config mpv
$ cd mpv
$ git submodule update
$ git clone https://github.com/Argon-/mpv-stats scripts/mpv-stats
$ cd scripts
$ rm stats.lua
$ ln -s mpv-stats/stats.lua stats.lua
$ patch -p1 < mpv.patch
```

Edit `is_laptop()` and `is_desktop()` in
`scripts/auto-profiles-functions.lua` accordingly.

# miscs
- https://www.chrisatmachine.com/posts/01-macos-developer-setup
- https://sourabhbajaj.com/mac-setup/
