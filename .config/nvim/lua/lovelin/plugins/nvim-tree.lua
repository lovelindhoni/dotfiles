return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")
    local api = require("nvim-tree.api")
    api.events.subscribe(api.events.Event.FileCreated, function(file)
      vim.cmd("edit " .. file.fname)
    end)
    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    -- local HEIGHT_RATIO = 0.9 -- You can change this
    -- local WIDTH_RATIO = 0.4 -- You can change this too
    nvimtree.setup({
      view = {
        -- float = {
        --   enable = true,
        --   open_win_config = function()
        --     local screen_w = vim.opt.columns:get()
        --     local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        --     local window_w = screen_w * WIDTH_RATIO
        --     local window_h = screen_h * HEIGHT_RATIO
        --     local window_w_int = math.floor(window_w)
        --     local window_h_int = math.floor(window_h)
        --     local center_x = (screen_w - window_w) / 2
        --     local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
        --     return {
        --       border = "rounded",
        --       relative = "editor",
        --       row = center_y,
        --       col = center_x,
        --       width = window_w_int,
        --       height = window_h_int,
        --     }
        --   end,
        -- },
        width = 35,
        relativenumber = true,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })
    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
  end,
}
