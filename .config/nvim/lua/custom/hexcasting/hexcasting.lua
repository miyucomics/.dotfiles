local source = {}
local items = require("custom.hexcasting.data")

source.new = function()
	return setmetatable({}, { __index = source })
end

source.get_trigger_characters = function()
	return { "." }
end

source.is_available = function()
    local extension = vim.fn.expand("%:t"):sub(-11)
    return extension == ".hexcasting" or extension == ".hexpattern"
end

function source:complete(_, callback)
	callback({ items = items })
end

require("cmp").register_source("hexcasting", source.new())
