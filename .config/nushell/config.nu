alias ls = ls -a
alias bat = bat -p -n --color=always

plugin add (which nu_plugin_query | get path.0)

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
zoxide init --cmd cd nushell | save -f ($nu.data-dir | path join "vendor/autoload/zoxide.nu")

$env.config.show_banner = false

source "~/.config/nushell/catppuccin_mocha.nu"
