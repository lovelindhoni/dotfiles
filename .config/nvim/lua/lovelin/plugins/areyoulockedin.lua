local areyoulockedin = {
  "voltycodes/areyoulockedin.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  config = function()
    require("areyoulockedin").setup({
      session_key = "c1782861-8902-4bbf-b1b8-f2543ff37134",
    })
  end,
}

return {}
