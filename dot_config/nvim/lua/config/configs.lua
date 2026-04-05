vim.g.mapleader = " "

vim.opt.cmdheight = 0
vim.opt.laststatus = 0
vim.opt.splitkeep = "screen"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99

-- vim.api.nvim_create_autocmd("BufReadPost", {
--     pattern = "*.py",
--     desc = "Apply code folds after reading Python file into buffer (uses vim.schedule)",
--     callback = function()
--         vim.schedule(function()
--             vim.cmd("normal! zx")
--         end)
--     end,
-- })

vim.opt.cursorline = true
vim.opt.wrap = false
vim.wo.linebreak = true
vim.opt.termguicolors = true

vim.opt.updatetime = 100
vim.opt.undofile = true
vim.opt.swapfile = true
vim.opt.encoding = "utf-8"
vim.opt.fileformat = "unix"
vim.opt.shell = "/bin/fish"

vim.opt.ignorecase = false
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.so = 10
vim.opt.siso = 10

vim.opt.number = true
vim.opt.relativenumber = true
vim.wo.number = true
vim.wo.signcolumn = "yes"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.smarttab = true

vim.opt.clipboard = "unnamedplus"
vim.opt.virtualedit = "block"

vim.opt.mouse = "a"
vim.opt.mousefocus = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
