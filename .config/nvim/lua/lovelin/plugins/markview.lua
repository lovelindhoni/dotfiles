return {
  "OXY2DEV/markview.nvim",
  ft = "markdown", -- If you decide to lazy-load anyway
  config = function()
    require("markview").setup({
      initial_state = false,
    })
    vim.keymap.set("n", "<leader>md", ":Markview toggle<CR>", {
      noremap = true,
      silent = true,
      desc = "Toggle Markdown Preview",
    })
  end,
}
