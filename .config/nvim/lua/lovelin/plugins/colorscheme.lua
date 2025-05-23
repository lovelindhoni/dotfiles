local onedarkpro = {
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

local everforest = {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("everforest").setup({
      transparent_background_level = 0,
      background = "hard",
      italics = true,
    })

    vim.cmd("colorscheme everforest")
  end,
}

local tokyonight = {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    local transparent = true -- set to true if you would like to enable transparency
    require("tokyonight").setup({
      style = "night",
      transparent = transparent,
      styles = {
        sidebars = transparent and "transparent" or "dark",
        floats = transparent and "transparent" or "dark",
      },
    })

    vim.cmd("colorscheme tokyonight")
  end,
}

local miasma = {
  "xero/miasma.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme miasma")
  end,
}

local onenord = {
  "rmehri01/onenord.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("onenord").setup()
  end,
}

local gruvbox = {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("gruvbox").setup()
    vim.o.background = "dark"
    vim.cmd([[colorscheme gruvbox]])
  end,
}

local yugen = {
  "bettervim/yugen.nvim",
  config = function()
    vim.cmd.colorscheme("yugen")
  end,
}

return everforest
