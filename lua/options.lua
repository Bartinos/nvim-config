require "nvchad.options"

-- Dynamically fetch the current system user's local home folder path
local home = os.getenv("HOME") or vim.fn.expand("~")
vim.opt.runtimepath:append(home .. "/.local/share/nvim/site")

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
vim.opt.clipboard = "unnamedplus"
