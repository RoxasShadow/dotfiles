# ZSH
`$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

# vim
`$ git clone https://github.com/meh/vimmeh`

# mpv
```
$ git clone --recursive https://github.com/Argon-/mpv-config
$ git submodule update
$ git clone https://github.com/Argon-/mpv-stats # then move stats.lua to scripts/
$ patch -p1 < mpv.patch
```

Edit `is_laptop()` and `is_desktop()` in
`scripts/auto-profiles-functions.lua` accordingly.
