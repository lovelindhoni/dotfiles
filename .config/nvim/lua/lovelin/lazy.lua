local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { import = "lovelin.plugins" },
}

-- Check if the environment variable 'DISABLE_LSP' is set to 'true'
if os.getenv("DISABLE_LSP") ~= "true" then
  table.insert(plugins, { import = "lovelin.plugins.lsp" })
end

require("lazy").setup(plugins, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
