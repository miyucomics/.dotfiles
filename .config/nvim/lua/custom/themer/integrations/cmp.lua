local base16 = require("custom.themer").query_theme("base_16")
local base30 = require("custom.themer").query_theme("base_30")

local highlights = {
    CmpItemAbbr = { fg = base30.white },
    CmpItemAbbrMatch = { fg = base30.blue, bold = true },
    CmpDoc = { bg = base30.darker_black },
    CmpDocBorder = { fg = base30.darker_black, bg = base30.darker_black },
    CmpPmenu = { bg = base30.black },
    CmpSel = { link = "PmenuSel", bold = true },

    CmpItemKindConstant = { fg = base16.base09 },
    CmpItemKindFunction = { fg = base16.base0D },
    CmpItemKindIdentifier = { fg = base16.base08 },
    CmpItemKindField = { fg = base16.base08 },
    CmpItemKindVariable = { fg = base16.base0E },
    CmpItemKindSnippet = { fg = base30.red },
    CmpItemKindText = { fg = base16.base0B },
    CmpItemKindStructure = { fg = base16.base0E },
    CmpItemKindType = { fg = base16.base0A },
    CmpItemKindKeyword = { fg = base16.base07 },
    CmpItemKindMethod = { fg = base16.base0D },
    CmpItemKindConstructor = { fg = base30.blue },
    CmpItemKindFolder = { fg = base16.base07 },
    CmpItemKindModule = { fg = base16.base0A },
    CmpItemKindProperty = { fg = base16.base08 },
    CmpItemKindEnum = { fg = base30.blue },
    CmpItemKindUnit = { fg = base16.base0E },
    CmpItemKindClass = { fg = base30.teal },
    CmpItemKindFile = { fg = base16.base07 },
    CmpItemKindInterface = { fg = base30.green },
    CmpItemKindColor = { fg = base30.white },
    CmpItemKindReference = { fg = base16.base05 },
    CmpItemKindEnumMember = { fg = base30.purple },
    CmpItemKindStruct = { fg = base16.base0E },
    CmpItemKindValue = { fg = base30.cyan },
    CmpItemKindEvent = { fg = base30.yellow },
    CmpItemKindOperator = { fg = base16.base05 },
    CmpItemKindTypeParameter = { fg = base16.base08 },
}

local styles = {
    default = {
        CmpBorder = { fg = base30.grey_fg },
    },

    atom = {
        CmpItemMenu = { fg = base30.light_grey, italic = true },
        CmpPmenu = {
            bg = base30.black2,
        },

        CmpDoc = { bg = base30.darker_black },
        CmpDocBorder = { fg = base30.darker_black, bg = base30.darker_black },
    },

    atom_colored = {
        CmpItemMenu = { fg = base30.light_grey, italic = true },
        CmpPmenu = {
            bg = base30.black2,
        },

        CmpDoc = { bg = base30.darker_black },
        CmpDocBorder = { fg = base30.darker_black, bg = base30.darker_black },
    },

    flat_light = {
        CmpPmenu = {
            bg = base30.black2,
        },

        CmpBorder = { fg = base30.black2, bg = base30.black2 },
        CmpDocBorder = { fg = base30.darker_black, bg = base30.darker_black },
    },

    flat_dark = {
        CmpPmenu = {
            bg = base30.darker_black,
        },

        CmpBorder = { fg = base30.darker_black, bg = base30.darker_black },
        CmpDocBorder = { fg = base30.black2, bg = base30.black2 },
        CmpDoc = { bg = base30.black2 },
    },
}

local cmp_style = "flat_light"
highlights = vim.tbl_deep_extend("force", highlights, styles[cmp_style] or {})

return highlights
