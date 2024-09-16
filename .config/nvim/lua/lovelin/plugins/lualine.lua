return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = require("onedarkpro.helpers").get_colors("onedark_vivid")
    local config = require("onedarkpro.config").config
    local onedarkpro = {}

    onedarkpro.normal = {
      a = { bg = colors.green, fg = colors.bg },
      b = { bg = colors.fg_gutter, fg = colors.green },
      c = { bg = config.options.lualine_transparency and colors.none or colors.bg_statusline, fg = colors.fg },
    }

    onedarkpro.insert = {
      a = { bg = colors.blue, fg = colors.bg },
      b = { bg = colors.fg_gutter, fg = colors.blue },
    }

    onedarkpro.command = {
      a = { bg = colors.purple, fg = colors.bg },
      b = { bg = colors.fg_gutter, fg = colors.purple },
    }

    onedarkpro.visual = {
      a = { bg = colors.yellow, fg = colors.bg },
      b = { bg = colors.fg_gutter, fg = colors.yellow },
    }

    onedarkpro.replace = {
      a = { bg = colors.red, fg = colors.bg },
      b = { bg = colors.fg_gutter, fg = colors.red },
    }

    local inactive_bg = config.options.highlight_inactive_windows and colors.color_column or colors.bg
    onedarkpro.inactive = {
      a = { bg = inactive_bg, fg = colors.blue },
      b = { bg = inactive_bg, fg = colors.fg_gutter_inactive, gui = "bold" },
      c = {
        bg = config.options.lualine_transparency and colors.none or inactive_bg,
        fg = colors.fg_gutter_inactive,
      },
    }
    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = onedarkpro,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}

-- return {
--   "nvim-lualine/lualine.nvim",
--   dependencies = { "nvim-tree/nvim-web-devicons" },
--   config = function()
--     local lualine = require("lualine")
--     local lazy_status = require("lazy.status") -- to configure lazy pending updates count
--
--     local colors = {
--       blue = "#65D1FF",
--       green = "#3EFFDC",
--       violet = "#FF61EF",
--       yellow = "#FFDA7B",
--       red = "#FF4A4A",
--       fg = "#c3ccdc",
--       bg = "#112638",
--       inactive_bg = "#2c3043",
--     }
--
--     local my_lualine_theme = {
--       normal = {
--         a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
--         b = { bg = colors.bg, fg = colors.fg },
--         c = { bg = colors.bg, fg = colors.fg },
--       },
--       insert = {
--         a = { bg = colors.green, fg = colors.bg, gui = "bold" },
--         b = { bg = colors.bg, fg = colors.fg },
--         c = { bg = colors.bg, fg = colors.fg },
--       },
--       visual = {
--         a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
--         b = { bg = colors.bg, fg = colors.fg },
--         c = { bg = colors.bg, fg = colors.fg },
--       },
--       command = {
--         a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
--         b = { bg = colors.bg, fg = colors.fg },
--         c = { bg = colors.bg, fg = colors.fg },
--       },
--       replace = {
--         a = { bg = colors.red, fg = colors.bg, gui = "bold" },
--         b = { bg = colors.bg, fg = colors.fg },
--         c = { bg = colors.bg, fg = colors.fg },
--       },
--       inactive = {
--         a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
--         b = { bg = colors.inactive_bg, fg = colors.semilightgray },
--         c = { bg = colors.inactive_bg, fg = colors.semilightgray },
--       },
--     }
--
--     -- configure lualine with modified theme
--     lualine.setup({
--       options = {
--         theme = my_lualine_theme,
--       },
--       sections = {
--         lualine_x = {
--           {
--             lazy_status.updates,
--             cond = lazy_status.has_updates,
--             color = { fg = "#ff9e64" },
--           },
--           { "encoding" },
--           { "fileformat" },
--           { "filetype" },
--         },
--       },
--     })
--   end,
-- }
