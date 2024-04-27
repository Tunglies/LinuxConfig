#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

function parse_git_branch {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PKG_CONFIG_PATH=/usr/lib/pkgconfig/ 
export PATH=/usr/lib/ccache/bin/:$PATH
export PATH="$HOME/.cargo/bin":$PATH
export PATH="$HOME/os-env/ninja/release":$PATH
export PATH="$HOME/os-env/qemu-8.2.3/build/":$PATH
export PATH="$HOME/os-env/qemu-8.2.3/build/riscv64-softmmu/:$PATH"
export PATH="$HOME/os-env/qemu-8.2.3/build/linux-user/:$PATH"

export http_proxy=http://127.0.0.1:7890
export https_proxy=http://127.0.0.1:7890

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim=nvim
alias cls=clear

#PS1='\[\033[0;32m\]\u@\h:\[\033[0;34m\]\w\[\033[0;33m\]$(parse_git_branch)\[\033[0m\]\$ '
PS1='\[\033[0;34m\]\w\[\033[0;33m\]$(parse_git_branch)\[\033[0m\]\$ '

. "$HOME/.cargo/env"

if [ -z "$TMUX" ]; then
    tmux
fi

