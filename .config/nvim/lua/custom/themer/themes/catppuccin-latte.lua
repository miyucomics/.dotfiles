local M = {}

M.base_30 = {
    white = "#4c4f69",
    darker_black = "#e6e9ef",
    black = "#eff1f5", --  nvim bg
    black2 = "#ccd0da",
    one_bg = "#bcc0cc", -- real bg of onedark
    one_bg2 = "#acb0be",
    one_bg3 = "#9ca0b0",
    grey = "#8c8fa1",
    grey_fg = "#7c7f93",
    grey_fg2 = "#6c6f85",
    light_grey = "#5c5f77",
    red = "#d20f39",
    pink = "#ea76cb",
    line = "#9ca0b0", -- for lines like vertsplit
    green = "#40a02b",
    blue = "#1e66f5",
    yellow = "#df8e1d",
    purple = "#8839ef",
    teal = "#179299",
    orange = "#fe640b",
    cyan = "#209fb5",
    statusline_bg = "#bcc0cc",
    lightbg = "#9ca0b0",
    pmenu_bg = "#40a02b",
    folder_bg = "#1e66f5",
    lavender = "#7287fd",
}

M.base_16 = {
    base00 = "#eff1f5",
    base01 = "#e6e9ef",
    base02 = "#ccd0da",
    base03 = "#bcc0cc",
    base04 = "#acb0be",
    base05 = "#4c4f69",
    base06 = "#5c5f77",
    base07 = "#6c6f85",
    base08 = "#d20f39",
    base09 = "#fe640b",
    base0A = "#df8e1d",
    base0B = "#40a02b",
    base0C = "#179299",
    base0D = "#1e66f5",
    base0E = "#8839ef",
    base0F = "#e64553",
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
