return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        toml = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
        python = { "isort" },
        cpp = { "clang-format" },
        rust = { "rustfmt" },
      },
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 2500,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>pp", function()
      conform.format({
        lsp_fallback = true,
        timeout_ms = 500,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
