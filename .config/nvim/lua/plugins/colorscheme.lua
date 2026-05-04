return {
  {
    "shaunsingh/nord.nvim",
    lazy = true,
    init = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = false
      vim.g.nord_disable_background = false
      vim.g.nord_italic = true
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "medium",
        transparent_mode = false,
      })
      vim.cmd.colorscheme("gruvbox")
    end,
  },
}
