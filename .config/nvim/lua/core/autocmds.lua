local group = vim.api.nvim_create_augroup("user_config", { clear = true })
local verilog_highlight_provider = vim.g.verilog_highlight_provider or "treesitter"
local use_verilog_vim_syntax = verilog_highlight_provider == "vim"

local function filetype_from_project_path(path)
  local ext = path:match("%.([%w_]+)$")

  if use_verilog_vim_syntax and (ext == "v" or ext == "vh" or ext == "vp" or ext == "sv" or ext == "svi" or ext == "svh" or ext == "svp" or ext == "sva") then
    return "verilog_systemverilog"
  end

  if ext == "v" or ext == "vh" or ext == "vp" then
    return "verilog"
  end

  if ext == "sv" or ext == "svi" or ext == "svh" or ext == "svp" or ext == "sva" then
    return "systemverilog"
  end

  return vim.filetype.match({ filename = path })
end

vim.filetype.add({
  extension = {
    v = use_verilog_vim_syntax and "verilog_systemverilog" or "verilog",
    vh = use_verilog_vim_syntax and "verilog_systemverilog" or "verilog",
    vp = use_verilog_vim_syntax and "verilog_systemverilog" or "verilog",
    sv = use_verilog_vim_syntax and "verilog_systemverilog" or "systemverilog",
    svi = use_verilog_vim_syntax and "verilog_systemverilog" or "systemverilog",
    svh = use_verilog_vim_syntax and "verilog_systemverilog" or "systemverilog",
    svp = use_verilog_vim_syntax and "verilog_systemverilog" or "systemverilog",
    sva = use_verilog_vim_syntax and "verilog_systemverilog" or "systemverilog",
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
  pattern = { "verilog", "systemverilog" },
  callback = function(args)
    vim.bo[args.buf].smartindent = false
    vim.bo[args.buf].autoindent = true
    pcall(vim.treesitter.start, args.buf, "v")
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
