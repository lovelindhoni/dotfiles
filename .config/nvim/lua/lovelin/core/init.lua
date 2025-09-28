require("lovelin.core.options")
require("lovelin.core.keymaps")

function Comp()
  local compile_command = "g++ -std=c++17 main.cxx -o .main && ./.main"
  vim.cmd("! " .. compile_command)
end

vim.api.nvim_create_user_command("Comp", Comp, {})
vim.keymap.set("n", "<leader>cp", ":lua Comp()<CR>", { desc = "Compile CXX" })
