-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "onedark",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.mason = {
  ensure_installed = {
    -- LSPs from your config
    "html-lsp",
    "angular-language-server",
    "typescript-language-server",
    "pyright",
    "css-lsp",
    "tailwindcss-language-server",

    -- Formatters / Linters you want Mason to manage
    "stylua",
    "prettierd",
    "black",
  },
}

return M
