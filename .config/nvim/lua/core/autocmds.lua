local group = vim.api.nvim_create_augroup("user_config", { clear = true })

vim.filetype.add({
  extension = {
    v = "verilog",
    vh = "verilog",
    vp = "verilog",
    sv = "systemverilog",
    svi = "systemverilog",
    svh = "systemverilog",
    svp = "systemverilog",
    sva = "systemverilog",
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
  pattern = { "verilog", "systemverilog" },
  callback = function(args)
    vim.bo[args.buf].smartindent = false
    vim.bo[args.buf].autoindent = true
    pcall(vim.treesitter.start, args.buf, "v")
  end,
})
