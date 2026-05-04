return {
  {
    "vhda/verilog_systemverilog.vim",
    lazy = false,
    enabled = vim.g.verilog_highlight_provider == "vim",
  },
  {
    "HonkW93/automatic-verilog",
    ft = { "verilog", "systemverilog", "verilog_systemverilog" },
  },
}
