require "nvchad.options"

-- add yours here!
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/configs/snippets/"})

-- Enable hybrid line numbers
vim.opt.number = true
vim.opt.relativenumber = true


local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!
