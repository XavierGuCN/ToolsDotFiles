local group = vim.api.nvim_create_augroup("user_config", { clear = true })

local function filetype_from_project_path(path)
  local ext = path:match("%.([%w_]+)$")

  if ext == "v" or ext == "vh" or ext == "vp" or ext == "sv" or ext == "svi" or ext == "svh" or ext == "svp" or ext == "sva" then
    return "verilog_systemverilog"
  end

  return vim.filetype.match({ filename = path })
end

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

vim.api.nvim_create_autocmd("BufReadPre", {
  group = group,
  callback = function(args)
    local path = args.file

    if path ~= "" and vim.fn.getftype(path) == "link" then
      vim.b[args.buf].project_symlink_path = vim.fn.fnamemodify(path, ":p")
      vim.b[args.buf].project_symlink_target = vim.fn.resolve(path)
    end
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = group,
  callback = function(args)
    local path = vim.b[args.buf].project_symlink_path

    if not path then
      return
    end

    local ft = filetype_from_project_path(path)

    if ft and ft ~= "" then
      vim.bo[args.buf].filetype = ft
    end
  end,
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
