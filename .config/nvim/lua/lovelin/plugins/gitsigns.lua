return {
  "lewis6991/gitsigns.nvim",
  -- event = { "BufReadPre", "BufNewFile" },
  event = "VeryLazy",
  opts = {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end
      -- Navigation
      map("n", "[c", gs.next_hunk, "Next Hunk")
      map("n", "]c", gs.prev_hunk, "Prev Hunk")

      map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
      map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
      map("n", "<leader>gR", gs.reset_buffer, "Reset buffer")
      map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
      map("n", "<leader>gb", function()
        gs.blame_line({ full = true })
      end, "Blame line")
      map("n", "<leader>gB", gs.toggle_current_line_blame, "Toggle line blame")
      map("n", "<leader>gd", gs.diffthis, "Diff this")
    end,
  },
}
