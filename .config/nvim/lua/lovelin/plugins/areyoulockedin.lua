return {
  "areyoulockedin/areyoulockedin.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  config = function()
    require("areyoulockedin").setup({
      session_key = "942b604b-4609-4410-bc6b-622d69a81a30",
    })
  end,
}
