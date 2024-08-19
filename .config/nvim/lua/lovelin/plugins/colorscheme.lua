return {
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            require("onedarkpro").setup({
                options = {
                    transparency = true,
                    highlight_inactive_windows = true,
                },
            })
            vim.cmd([[colorscheme onedark]])
        end,
    },
}
