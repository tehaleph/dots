require("aleph.remap")
require("aleph.lazy")

vim.cmd "colorscheme catppuccin"
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.so = 999

vim.opt.list = true

chars = {}
chars.tab = "|->"
chars.space = "."

vim.opt.listchars:append(chars)
