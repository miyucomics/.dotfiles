[[ $- != *i* ]] && return

alias ls="ls -A --color=auto --group-directories-first"
alias wttr="curl -s wttr.in/new-york?T | sed -n '3,37p'"

export EDITOR=nvim
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk/"
export PATH="$PATH:$HOME/.cargo/bin:$HOME/.local/share/nvim/mason/bin:$HOME/.TinyTeX/bin/x86_64-linux"
export FZF_DEFAULT_OPTS="--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
export __GL_THREADED_OPTIMIZATIONS=0

function ya() {
       local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
       yazi $@ --cwd-file="$tmp"
       if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
               cd $cwd
       fi
       rm -f $tmp
}

eval "$(starship init bash)"
eval "$(zoxide init --cmd cd bash)"
