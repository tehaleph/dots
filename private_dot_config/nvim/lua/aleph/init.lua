require("aleph.remap")
require("aleph.lazy")

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.so = 999

vim.opt.list = true

chars = {}
chars.tab = "|  "

vim.opt.listchars:append(chars)
