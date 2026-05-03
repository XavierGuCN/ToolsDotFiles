local group = vim.api.nvim_create_augroup("user_config", { clear = true })

vim.filetype.add({
  extension = {
    v = "verilog_systemverilog",
    vh = "verilog_systemverilog",
    vp = "verilog_systemverilog",
    sv = "verilog_systemverilog",
    svi = "verilog_systemverilog",
    svh = "verilog_systemverilog",
    svp = "verilog_systemverilog",
    sva = "verilog_systemverilog",
  },
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  callback = function()
    vim.highlight.on_yank({ timeout = 150 })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "verilog_systemverilog",
  callback = function(args)
    vim.bo[args.buf].smartindent = false
    vim.bo[args.buf].autoindent = true
  end,
})
