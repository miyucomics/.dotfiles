local base30 = require("custom.themer").query_theme("base_30")

return {
    lualine_a_insert = { fg = base30.black, bg = base30.green },
    lualine_a_normal = { fg = base30.black, bg = base30.blue },
    lualine_a_visual = { fg = base30.black, bg = base30.purple },
    lualine_a_command = { fg = base30.black, bg = base30.red },
    lualine_a_replace = { fg = base30.black, bg = base30.orange },
    lualine_a_inactive = { fg = base30.black, bg = base30.grey },
    lualine_a_terminal = { fg = base30.black, bg = base30.lavender },

    lualine_b_insert = { fg = base30.green, bg = base30.darker_black },
    lualine_b_normal = { fg = base30.blue, bg = base30.darker_black },
    lualine_b_visual = { fg = base30.purple, bg = base30.darker_black },
    lualine_b_command = { fg = base30.red, bg = base30.darker_black },
    lualine_b_replace = { fg = base30.orange, bg = base30.darker_black },
    lualine_b_inactive = { fg = base30.grey, bg = base30.darker_black },
    lualine_b_terminal = { fg = base30.lavender, bg = base30.darker_black },

    lualine_c_insert = { fg = base30.green, bg = base30.darker_black },
    lualine_c_normal = { fg = base30.blue, bg = base30.darker_black },
    lualine_c_visual = { fg = base30.purple, bg = base30.darker_black },
    lualine_c_command = { fg = base30.red, bg = base30.darker_black },
    lualine_c_replace = { fg = base30.orange, bg = base30.darker_black },
    lualine_c_inactive = { fg = base30.grey, bg = base30.darker_black },
    lualine_c_terminal = { fg = base30.lavender, bg = base30.darker_black },
}
