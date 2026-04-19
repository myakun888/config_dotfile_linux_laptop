# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt

#kode warna

#  31: Merah
#  32: Hijau
#  33: Kuning
#  34: Biru
#  35: Magenta/Ungu
#  36: Cyan/Biru Muda
#  37: Putih

force_color_prompt=yes # komentari baris ini jika terminal anda tidak support warna banyak
# kalu di hidupke alcartiy dak bisa baco warna dari bash, tapi klau sudah masuk tmux, baca
# maka di buka tanda nya, alacrity bisa baca semua , biar pengaturan ini berjalan juga di alacarty, karena alcrity hanya bisa baca warna hexa

# jika kalian ingin memaksa menggunakna warna custom
# kalian bisa akalin dengan cara
# di config di alacrity.toml
# masukan warna hexa ke warna diatas
# contoh inigin memakai waran hijau neon #49584  -> kode ini hanya fiktif
# maka di alacraity kalian ubah green = #49588
# jadi bash membaca kode 32 menarik green yang sudah kita modif
# karena bash hnya membaca warna kode diatas 31-37
if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  #ini yang satu baris
  #  PS1='${debian_chroot:+($debian_chroot)}\[\033[1;35m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$\[\033[01;32m\] \[\033[00m\] '

  #ini yang ada enter menggunakan notasi n, agar kebawah v1,
  PS1='${debian_chroot:+($debian_chroot)}\[\033[1;32m\]\u@\h\[\033[00m\]:\n\[\033[01;34m\]\w\[\033[00m\]\$\[\033[01;32m\] \[\033[00m\] '

  #ini yang ada enter menggunakan notasi n, agar kebawah v2 , ini hanya menampilkan folder terakhir, W -> folder terkahir , w -> folder lengkap
  #   PS1='${debian_chroot:+($debian_chroot)}\[\033[1;31m\]\u@\h\[\033[00m\]:$\[\033[01;32m\] \[\033[00m\]\n\[\033[01;34m\]\W\[\033[00m\] '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
  PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
  ;;
*) ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias zt='zathura'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# NOTE: ini alias untuk yazi, karena panjang kita menggunakan function , bukan alias, nama alias ini adalah y, kalau mau ganti ganti nama function nya
#-_ ini sesuai dokumentasi nya
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  command yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd <"$tmp"
  [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# ini path PHP dan Mysql dari xampp
export PATH="/opt/lampp/bin:$PATH"
alias php-lampp='/opt/lampp/bin/php' #ini php bawaan lampp versi 8.2
alias php8.3='/usr/bin/php'          #ini php8.3-cli yang di install dari apt , kemaren di pake karena install php8.3-readline
# ini path speedtest

#ini cargo
. "$HOME/.cargo/env"
source ~/.bash_completion/alacritty

#alias s-search dari snapd
#alias s='s-search'

#lvim

#ini setup fzf (fuzi finder), keybindings and fuzy completion
eval "$(fzf --bash)"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
alias fzf='fzf --style full   --preview "fzf-preview.sh {}" --bind "focus:transform-header:file --brief {}"'

#alias tambahan, dari aplikasi lsd , yang berguna menampilkan icon saat ls atau dir
alias ls='lsd'
alias dir='lsd'
#alias dari bat ,
alias cat='batcat' #ini menggunakan bat, yaitu cat yang lebih modern dari bawaan

#path go lang
export PATH="/usr/local/go/bin:$PATH"

#ini  path aplikasi bin yang di install oleh golang, semua yang di install dari golang file bin nya ada di home
# agar kita bisa akses semua file bin aplikasi yang di install dari golang, kita ekspor yang berada di path home nya
# boleh menggunakan $HOME atau ~/  , tapi rekomendasi menggunakan $HOME, karena otomatis home bawaan dari linux nya
export PATH="$HOME/go/bin:$PATH"

#note !!!, segala sesuatu yang diawali dengan eval di taruh di terakhir, karena baik di eksuksi di baris terakhir
#ini auto completion railway
eval "$(railway completion bash)"

#ini starship, thema untuk teriminal
eval "$(starship init bash)"
export STARSHIP_CONFIG=$HOME/.config/starship/starship-bash.toml
