require("lovelin.core.options")
require("lovelin.core.keymaps")

vim.api.nvim_create_user_command("Comp", function()
  -- Compile the C++ program
  local compile_command = "g++ -std=c++17  main.cxx -o main && ./main"
  vim.cmd("! " .. compile_command)
end, {})
