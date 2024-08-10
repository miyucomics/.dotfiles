-- Credits to original https://github.com/arcticicestudio/nord-vim
-- This is modified version of it

local M = {}

M.base_30 = {
    white = "#abb2bf",
    darker_black = "#2a303c",
    black = "#2E3440",
    black2 = "#343a46",
    one_bg = "#373d49",
    one_bg2 = "#464c58",
    one_bg3 = "#494f5b",
    grey = "#4b515d",
    grey_fg = "#565c68",
    grey_fg2 = "#606672",
    light_grey = "#646a76",
    red = "#BF616A",
    pink = "#d57780",
    line = "#414753",
    green = "#A3BE8C",
    blue = "#7797b7",
    yellow = "#EBCB8B",
    purple = "#B48EAD",
    teal = "#6484a4",
    orange = "#e39a83",
    cyan = "#9aafe6",
    statusline_bg = "#333945",
    pmenu_bg = "#A3BE8C",
    folder_bg = "#7797b7",
}

M.base_16 = {
    base00 = "#2E3440",
    base01 = "#3B4252",
    base02 = "#434C5E",
    base03 = "#4C566A",
    base04 = "#D8DEE9",
    base05 = "#E5E9F0",
    base06 = "#ECEFF4",
    base07 = "#8FBCBB",
    base08 = "#88C0D0",
    base09 = "#81A1C1",
    base0A = "#88C0D0",
    base0B = "#A3BE8C",
    base0C = "#81A1C1",
    base0D = "#81A1C1",
    base0E = "#81A1C1",
    base0F = "#B48EAD",
}

M.polish_hl = {
    ["@punctuation.bracket"] = { fg = M.base_30.white },
    ["@punctuation.delimiter"] = { fg = M.base_30.white },
}
M.type = "dark"

return M
