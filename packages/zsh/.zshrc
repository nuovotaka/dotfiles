
### Added by Z-shell's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command sh -c "$(curl -fsSL git.io/get-zi)" -- -i skip -b main "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# Preztoのセットアップ
zi snippet PZT::modules/directory/init.zsh
zi snippet PZT::modules/utility/init.zsh

# zi light zsh-users/zsh-autosuggestions
# zi light zdharma/fast-syntax-highlighting


# Customize to your needs...
# if [[ $(command -v exa) ]]; then
#     alias ee='exa --icons'
#     alias ea='exa -aal --header --git --icons'
#     alias eta='exa -T -L 3 -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
# fi
export LANG=ja_JP.UTF-8

alias brew='PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:/usr/local/opt/m4/bin:/usr/local/opt/ncurses/bin:/usr/local/opt/sqlite/bin:/usr/local/opt/openssl@1.1/bin brew' 

. /usr/local/opt/asdf/libexec/asdf.sh

eval "$(starship init zsh)"
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
