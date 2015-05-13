typeset -U path cdpath fpath manpath

typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,}/sbin(N-/))


userpath=(./ghc/ghc-7.10.1.app/Contents/bin(N-/))
path=(~/bin(N-/) /usr/local/bin(N-/) ${userpath} ${path})
