require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map('n', ',', '<cmd>lua vim.diagnostic.open_float()<CR>')

-- Nvim DAP
map("n", "<F1>", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
map("n", "<F2>", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("n", "<F3>", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("n", "<F4>", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map("n", "<F5>", "<cmd>lua require'dap'.step_back()<CR>", { desc = "Debugger step back" })
map("n", "<F13>", "<cmd>lua require'dap'.restart()<CR>", { desc = "Debugger restart" })
map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
-- map(
-- 	"n",
-- 	"<Leader>dd",
-- 	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
-- 	{ desc = "Debugger set conditional breakpoint" }
-- )
map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- rustaceanvim
map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
--
map("n", "<leader>ra", function()
  vim.lsp.buf.rename()
end, { desc = "LSP rename variable" })

-- The new diagnostic mapping
map("n", "<leader>q", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Floating diagnostic" })
