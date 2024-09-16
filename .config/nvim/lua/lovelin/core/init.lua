require("lovelin.core.options")
require("lovelin.core.keymaps")

vim.api.nvim_create_user_command("Comp", function()
  local compile_command = "clang++ -std=c++17 -O3 main.cxx -o main && ./main"
  local compile_result = vim.fn.system(compile_command)

  if vim.v.shell_error ~= 0 then
    print("Execution failed:\n" .. compile_result)
    return
  end
end, {})

-- vim.opt.cmdheight = 10
