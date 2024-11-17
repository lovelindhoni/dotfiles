return {
  "vyfor/cord.nvim",
  build = "./build || .\\build",
  event = "VeryLazy",
  opts = {}, -- calls require('cord').setup()
  config = function()
    require("cord").setup()
  end,
}
