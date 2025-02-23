vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("v", "<Space>", "<Nop>", { noremap = true, silent = true })

require("config") -- Load our config from config.lua
