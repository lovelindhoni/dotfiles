return {
    "mrjones2014/smart-splits.nvim",
    config = function()
        local smart_splits = require("smart-splits")
        local keymap = vim.keymap
        keymap.set("n", "<C-h>", smart_splits.move_cursor_left)
        keymap.set("n", "<C-j>", smart_splits.move_cursor_down)
        keymap.set("n", "<C-k>", smart_splits.move_cursor_up)
        keymap.set("n", "<C-l>", smart_splits.move_cursor_right)
    end,
}
