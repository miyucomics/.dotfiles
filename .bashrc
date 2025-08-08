alias ls="eza -a --group-directories-first"
alias wttr="curl -s wttr.in/new-york?T | sed -n '3,37p'"
alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"

export EDITOR=nvim
export PATH="$PATH:$HOME/.TinyTeX/bin/x86_64-linux:$HOME/bin:$HOME/.cargo/bin:$HOME/.local/share/nvim/mason/bin"
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
