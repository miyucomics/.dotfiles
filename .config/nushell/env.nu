# Clean up the home directory
$env.XDG_CACHE_HOME = $"($env.HOME)/.cache"
$env.XDG_CONFIG_HOME = $"($env.HOME)/.config"
$env.XDG_DATA_HOME = $"($env.HOME)/.local/share"
$env.XDG_STATE_HOME = $"($env.HOME)/.local/state"

$env.HISTFILE = $"($env.XDG_STATE_HOME)/bash/history"

$env.CUDA_CACHE_PATH = $"($env.XDG_CACHE_HOME)/nv"

$env.DOTNET_CLI_HOME = $"($env.XDG_DATA_HOME)/dotnet"

$env.PULSE_COOKIE = $"($env.XDG_CONFIG_HOME)/pulse/cookie"

$env.CARGO_HOME = $"($env.XDG_DATA_HOME)/cargo"
$env.RUSTUP_HOME = $"($env.XDG_DATA_HOME)/rustup"

$env.GNUPGHOME = $"($env.XDG_DATA_HOME)/gnupg"

$env.GRADLE_USER_HOME = $"($env.XDG_DATA_HOME)/gradle"

$env.GTK2_RC_FILES = $"($env.XDG_CONFIG_HOME)/gtk-2.0/gtkrc"

$env._JAVA_OPTIONS = $'-Djava.util.prefs.userRoot="($env.XDG_CONFIG_HOME)/java"'

$env.NPM_CONFIG_INIT_MODULE = $"($env.XDG_CONFIG_HOME)/npm/config/npm-init.js"
$env.NPM_CONFIG_CACHE = $"($env.XDG_CACHE_HOME)/npm"
$env.NPM_CONFIG_TMP = $"($env.XDG_RUNTIME_DIR)/npm"

$env.XCURSOR_PATH = $"($env.XDG_DATA_HOME)/icons"

# Useful environment variables
$env.EDITOR = 'nvim'
$env.LANG = "en_US.UTF-8"
$env.LC_ALL = "en_US.UTF-8"
$env.PATH = $env.PATH ++ [
    $"($env.HOME)/bin",
    $"($env.CARGO_HOME)/bin",
    $"($env.HOME)/.local/bin"
    $"($env.HOME)/.local/share/nvim/mason/bin"
]
