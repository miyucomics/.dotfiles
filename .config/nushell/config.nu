alias ls = ls -a

$env.EDITOR = 'nvim'
$env.LANG = "en_US.UTF-8"
$env.LC_ALL = "en_US.UTF-8"
$env.PATH = $env.PATH ++ [
    $"($env.HOME)/bin",
    $"($env.HOME)/.cargo/bin",
    $"($env.HOME)/.local/share/nvim/mason/bin"
]

mkdir ($nu.data-dir | path join "vendor/autoload")
tv init nu | save -f ($nu.data-dir | path join "vendor/autoload/tv.nu")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
zoxide init --cmd cd nushell | save -f ($nu.data-dir | path join "vendor/autoload/zoxide.nu")

$env.config.show_banner = false

source "~/.config/nushell/catppuccin_mocha.nu"
