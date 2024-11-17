return {
  "mrjones2014/smart-splits.nvim",
  lazy = false,
  config = function()
    local smart_splits = require("smart-splits")
    smart_splits.setup({
      default_amount = 5,
    })
    local keymap = vim.keymap

    keymap.set("n", "<C-h>", smart_splits.move_cursor_left)
    keymap.set("n", "<C-j>", smart_splits.move_cursor_down)
    keymap.set("n", "<C-k>", smart_splits.move_cursor_up)
    keymap.set("n", "<C-l>", smart_splits.move_cursor_right)

    keymap.set("n", "<C-S-h>", smart_splits.resize_left)
    keymap.set("n", "<C-S-j>", smart_splits.resize_down)
    keymap.set("n", "<C-S-k>", smart_splits.resize_up)
    keymap.set("n", "<C-S-l>", smart_splits.resize_right)
  end,
}
