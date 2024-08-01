local Themer = {}
local current_theme = {}

Themer.set_theme = function(name)
    local present, theme = pcall(require, "custom.themer.themes." .. name)
    if not present then
        error("No such theme!")
    end

    current_theme = theme
    Themer.sync_hl_groups()
    Themer.sync_terminal()
end

Themer.sync_hl_groups = function()
    local directory = vim.fn.stdpath("config") .. "/lua/custom/themer/integrations/"
    local files = vim.fn.readdir(directory)
    for _, file in ipairs(files) do
        local settings = dofile(directory .. "/" .. file)
        for key, value in pairs(settings) do
            vim.api.nvim_set_hl(0, key, value)
        end
    end
end

Themer.sync_terminal = function()
    os.execute("printf '\\e]11;" .. current_theme.base_30.black .. "\\e\\\\'")

    local colors = current_theme["base_16"]
    local term = {
        "base01",
        "base08",
        "base0B",
        "base0A",
        "base0D",
        "base0E",
        "base0C",
        "base05",
        "base03",
        "base08",
        "base0B",
        "base0A",
        "base0D",
        "base0E",
        "base0C",
        "base07",
    }

    for i = 0, 15 do
        vim.g["terminal_color_" .. i] = colors[term[i + 1]]
    end
end

Themer.get_theme_tb = function(property)
    return current_theme[property]
end

Themer.merge_tb = function(...)
    return vim.tbl_deep_extend("force", ...)
end

Themer.override_theme = function(theme, name)
    return theme
end

return Themer
