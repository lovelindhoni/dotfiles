function DiffviewToggle()
  local lib = require("diffview.lib")
  local view = lib.get_current_view()
  if view then
    -- Current tabpage is a Diffview; close it
    vim.cmd(":DiffviewClose")
  else
    -- No open Diffview exists: open a new one
    vim.cmd(":DiffviewOpen")
  end
end

return {
  "sindrets/diffview.nvim",
  event = "VeryLazy",
  config = function()
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<leader>gv", "<cmd>lua DiffviewToggle()<CR>", { desc = "Toggle diff view" })
    keymap.set("n", "<leader>gl", "<cmd>DiffviewFileHistory<CR>", { desc = "Toggle git history" })
    keymap.set("n", "<leader>gc", "<cmd>DiffviewFileHistory %<CR>", { desc = "Toggle git history for current file" })
  end,
}
