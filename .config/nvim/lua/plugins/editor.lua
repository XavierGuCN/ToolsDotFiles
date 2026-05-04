local treesitter_languages = {
  "bash",
  "c",
  "cpp",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "query",
  "regex",
  "vim",
  "vimdoc",
}

return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "gruvbox",
        globalstatus = false,
        component_separators = "",
        section_separators = "",
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        separator_style = "thin",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },
    },
    opts = {
      view = {
        width = 32,
      },
      renderer = {
        group_empty = true,
        highlight_git = true,
        icons = {
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = true,
          },
        },
      },
      filters = {
        dotfiles = false,
      },
      git = {
        enable = true,
      },
      actions = {
        open_file = {
          quit_on_open = false,
        },
      },
    },
  },
  {
    "akinsho/toggleterm.nvim",
    lazy = false,
    version = "*",
    keys = {
      { "<leader>tt", "<cmd>ToggleTerm direction=float<CR>", desc = "Floating terminal" },
      { "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "Horizontal terminal" },
      { "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", desc = "Vertical terminal" },
    },
    opts = {
      open_mapping = [[<C-\>]],
      direction = "float",
      shade_terminals = true,
      float_opts = {
        border = "curved",
      },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "│",
      },
      scope = {
        enabled = true,
      },
    },
  },
  {
    "jiangmiao/auto-pairs",
    lazy = false,
    init = function()
      vim.g.AutoPairsShortcutToggle = ""
      vim.g.AutoPairsShortcutFastWrap = ""
      vim.g.AutoPairsShortcutJump = ""
      vim.g.AutoPairsShortcutBackInsert = ""
    end,
  },
  {
    "preservim/nerdcommenter",
    keys = {
      { "<leader>cc", "<plug>NERDCommenterComment", mode = { "n", "x" }, desc = "Comment" },
      { "<leader>cu", "<plug>NERDCommenterUncomment", mode = { "n", "x" }, desc = "Uncomment" },
      { "<leader>ct", "<plug>NERDCommenterToggle", mode = { "n", "x" }, desc = "Toggle comment" },
    },
    init = function()
      vim.g.NERDSpaceDelims = 1
      vim.g.NERDTrimTrailingWhitespace = 1
      vim.g.NERDDefaultAlign = "left"
    end,
  },
  {
    "godlygeek/tabular",
    cmd = "Tabularize",
  },
  {
    "dense-analysis/ale",
    event = { "BufReadPost", "BufNewFile" },
    init = function()
      vim.g.ale_disable_lsp = 1
      vim.g.ale_completion_enabled = 0
      vim.g.ale_fix_on_save = 0
      vim.g.ale_lint_on_text_changed = "normal"
      vim.g.ale_lint_delay = 500
      vim.g.ale_sign_error = "E"
      vim.g.ale_sign_warning = "W"
      vim.g.ale_virtualtext_cursor = 1
      vim.g.ale_echo_msg_format = "[%linter%] %s"
    end,
  },
  {
    "itchyny/vim-cursorword",
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "mg979/vim-visual-multi",
    event = { "BufReadPost", "BufNewFile" },
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<C-n>",
        ["Find Subword Under"] = "<C-n>",
        ["Select All"] = "<Leader>ma",
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = function()
      require("nvim-treesitter").install(treesitter_languages):wait(300000)
    end,
    opts = {
      languages = treesitter_languages,
    },
    config = function(_, opts)
      require("nvim-treesitter").setup()

      vim.api.nvim_create_autocmd("FileType", {
        pattern = opts.languages,
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
