# ZSH
`$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

# vim
`$ git clone --recursive git://github.com/meh/vimmeh.git`

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
