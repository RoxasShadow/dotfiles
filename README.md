# ZSH
`$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

# n?vim
```
$ git clone --recursive git://github.com/meh/vimmeh.git .vimmeh`
$ ln -s ~/.vimmeh ~/.vim`
$ ln -s ~/.vimmeh/vimrc ~/.vimrc`
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
$ ln -s ~/.vimrc ~/.config/nvim/init.vim`
```

```
$ cd ~/.vim/bundle/YouCompleteMe
$ sudo apt-get install build-essential cmake python-dev python3-dev
$ ./install.py --js-completer --rust-completer --clang-completer
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
