local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath .. "/lua/lazy/init.lua") then
  vim.fn.delete(lazypath, "rf")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins.colorscheme" },
  { import = "plugins.editor" },
  { import = "plugins.search" },
  { import = "plugins.verilog" },
}, {
  change_detection = {
    notify = false,
  },
  checker = {
    enabled = true,
    notify = false,
  },
  ui = {
    border = "rounded",
  },
})
