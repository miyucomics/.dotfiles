local M = {}

M.base_30 = {
    white = "#c6d0f5",
    darker_black = "#292c3c",
    black = "#303446",
    black2 = "#414559",
    one_bg = "#51576d",
    one_bg2 = "#626880",
    one_bg3 = "#737994",
    grey = "#838ba7",
    grey_fg = "#949cbb",
    grey_fg2 = "#a5adce",
    light_grey = "#b5bfe2",
    red = "#e78284",
    pink = "#f4b8e4",
    line = "#626880",
    green = "#a6d189",
    blue = "#8caaee",
    yellow = "#e5c890",
    purple = "#ca9ee6",
    teal = "#81c8be",
    orange = "#ef9f76",
    cyan = "#81c8be",
    statusline_bg = "#414559",
    lightbg = "#51576d",
    pmenu_bg = "#a6d189",
    folder_bg = "#8caaee",
    lavender = "#babbf1",
}

M.base_16 = {
    base00 = "#303446",
    base01 = "#414559",
    base02 = "#51576d",
    base03 = "#626880",
    base04 = "#737994",
    base05 = "#949cbb",
    base06 = "#a5adce",
    base07 = "#b5bfe2",
    base08 = "#e78284",
    base09 = "#ef9f76",
    base0A = "#e5c890",
    base0B = "#a6d189",
    base0C = "#81c8be",
    base0D = "#8caaee",
    base0E = "#ca9ee6",
    base0F = "#f4b8e4",
}

M.polish_hl = {
    treesitter = {
        ["@variable"] = { fg = M.base_30.lavender },
        ["@property"] = { fg = M.base_30.teal },
        ["@variable.builtin"] = { fg = M.base_30.red },
    },
}

M.type = "dark"

return M
