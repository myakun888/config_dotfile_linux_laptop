

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

#ZSH_THEME="powerlevel10k/powerlevel10k" #jika tidak ingin random, ganti random dengan nama thema nya, jika ingin random, isi dengan random

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "cloud" "fwalch" "re5et" ) #di dalam ini adalah tema tema yang bergantian pada random

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

#jika ini diaktiifkan maka ini mengatur agar semua warna suges nya jadi sama, mengikuti zsh, tidak mengikuti tema, 0-8; bisa juga dengan warna hexa
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=7'

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git sudo docker docker-compose golang node nvm mongocli fzf emoji emoji-clock zsh-autosuggestions zsh-syntax-highlighting)
plugins=(git sudo docker fzf emoji zsh-autosuggestions zsh-syntax-highlighting vi-mode command-not-found extract pass taskwarrior)
# kusus zsh-autosuggestions dan zsh-syntax-highlighting, pastikan selalu di posisi belakang agar optimal

source $ZSH/oh-my-zsh.sh

#bind key untuk plugins vi-mode
#adalah plugins agar zsh bisa meggunakan mode vim
# jk untuk keluar dari insert mode (vi-mode)
bindkey -M viins 'jk' vi-cmd-mode


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


##------ ini config manual, sebagian migrasi dari bash



# PATH

export NVM_DIR="$HOME/.nvm"
# ini path nvm (node version manager)
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm

# ini path PHP dan mysql dari lampp
export PATH="/opt/lampp/bin:$PATH"
alias php-lampp='/opt/lampp/bin/php' #ini php bawaan lampp versi 8.2
alias php8.3='/usr/bin/php'          #ini php8.3-cli yang di install dari apt , kemaren di pake karena install php8.3-readline

#paht go lang
export PATH="/usr/local/go/bin:$PATH"

#ini  path aplikasi bin yang di install oleh golang, semua yang di install dari golang file bin nya ada di home
# agar kita bisa akses semua file bin aplikasi yang di install dari golang, kita ekspor yang berada di path home nya
# boleh menggunakan $HOME atau ~/  , tapi rekomendasi menggunakan $HOME, karena otomatis home bawaan dari linux nya
export PATH="$HOME/go/bin:$PATH"


# fzf (fuzi finder) untuk pencarian folder atau file
export PATH="$HOME/.fzf/bin:$PATH"

# config shell integrasi nya
# set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
alias fzf='fzf --style full   --preview "fzf-preview.sh {}" --bind "focus:transform-header:file --brief {}"'

# path kitty terminal
# export PATH="$HOME/.local/kitty.app/bin:$PATH"

# ALIAS

# alias atau sortcut pemintas, ini untuk umum
# kalau ada alias dari apliski, tempatkan dekat path aplikasi nya
alias ls='lsd'
alias dir='lsd'
#alias dari bat ,
alias cat='batcat' #ini menggunakan bat, yaitu cat yang lebih modern dari bawaan
alias matike='shutdown'
alias dakjadi='shutdown -c && echo "dak jadi dimatike"'
alias nvim-c='nvim -u ~/.config/nvim-custom/init.lua' #ini nvim, config custom tanpa lazyvim
alias zt='zathura'
# ini menggunakan parameter --disable-gpu, karena gpu tidak support
alias brave='brave-browser --disable-gpu'
# membuka keymaps manual
alias key='cat $HOME/keymaps.md'
# dalam penggunaan alias, jika panjang , buat dalam bentuk function
# contoh
# function namaAlias () { perintah nya}


# NOTE: ini alias untuk yazi, karena panjang kita menggunakan function , bukan alias, nama alias ini adalah y, kalau mau ganti ganti nama function nya
# ini sesuai dokumentasi nya
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

## ini completion dari ohmyhsz external thme powerleve 10k



#ini starship, thema untuk teriminal,
#untuk mengaktifkan tema dari ohmyzsh komentari tema dari starship ini,dan buka lagi tema ohmyzah di bagian atas, dengan nama key "ZSH_THEME" 
 eval "$(starship init zsh)"
#ini export path starship config, ini mengubah lokasi default nya, awal nya ~/.config/, ini kita masukan di dalam folder biar rapi
#kalau baris export ini dihapus , starhsip.toml, harus di tarok cukup di dalam folder  ~/.config, jangan di bungkus folder lagi
 export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

#neofetch --kitty $HOME/Gambar/wallpaper1.png
#jika ingin start shell ada tampilan dari neofetch dan gambar, hilangkan komentar nya 


# ini configurasi ai avante untuk lazyvim
# dan juga ada api key dari ai lain 
alias avante='nvim -c "lua vim.defer_fn(function()require(\"avante.api\").zen_mode()end, 100)"'
# kalau mau export, token api key, jangan di push, harus di hapus dlu, karena akan gagal , terindikasi konten privasi
# script nyta harus di hapus dan tidak bisa di commnetari, kalau cuma di komentari akan tetap gagal push
#
