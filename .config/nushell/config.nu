alias ls = ls -a

$env.LANG = "en_US.UTF-8"
$env.LC_ALL = "en_US.UTF-8"
$env.FZF_DEFAULT_OPTS = '--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8'
$env.__GL_THREADED_OPTIMIZATIONS = '0'
$env.EDITOR = 'nvim'
$env.PATH = $env.PATH ++ [
    $"($env.HOME)/bin",
    $"($env.HOME)/.cargo/bin",
    $"($env.HOME)/.local/share/nvim/mason/bin"
]

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
zoxide init --cmd cd nushell | save -f ($nu.data-dir | path join "vendor/autoload/zoxide.nu")

$env.config.show_banner = false

source "~/.config/nushell/catppuccin_mocha.nu"
