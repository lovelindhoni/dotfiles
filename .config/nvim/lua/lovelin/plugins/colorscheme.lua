-- return {
--   {
--     "olimorris/onedarkpro.nvim",
--     priority = 1000, -- make sure to load this before all the other start plugins
--     config = function()
--       -- load the colorscheme here
--       require("onedarkpro").setup({
--         options = {
--           transparency = true,
--           highlight_inactive_windows = true,
--         },
--       })
--       vim.cmd([[colorscheme onedark]])
--     end,
--   },
-- }

return {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("everforest").setup({
      background = "hard",
      italics = true,
    })
    vim.cmd([[colorscheme everforest]])
  end,
}

-- return {
--   "folke/tokyonight.nvim",
--   priority = 1000,
--   config = function()
--     local transparent = true -- set to true if you would like to enable transparency
--     require("tokyonight").setup({
--       style = "night",
--       transparent = transparent,
--       styles = {
--         sidebars = transparent and "transparent" or "dark",
--         floats = transparent and "transparent" or "dark",
--       },
--     })
--
--     vim.cmd("colorscheme tokyonight")
--   end,
-- }
