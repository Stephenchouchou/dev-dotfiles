return {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        local ibl = require("ibl")
        ibl.setup ({
            debounce = 100,
            indent = { char = '┆' },
            whitespace = { highlight = { "Whitespace" } },
            scope = { exclude = {language = { "lua" } } },
        })
    end,
}
