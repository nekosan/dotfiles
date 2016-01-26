typeset -U path cdpath fpath manpath

typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,}/sbin(N-/))


userpath=(~/.cabal/bin(N-/) ~/ghc/ghc-7.8.4.app/Contents/bin(N-/))
path=(~/bin(N-/) /usr/local/bin(N-/) ${userpath} ${path})
