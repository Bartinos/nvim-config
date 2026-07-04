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


-- CODE COMPANION
-- Toggle the main chat buffer
map({ "n", "v" }, "<leader>a", "<cmd>CodeCompanionToggle<cr>", { desc = "AI Chat Toggle" })

-- Open the command palette (Inline actions, prompts, etc.)
map({ "n", "v" }, "<leader>ap", "<cmd>CodeCompanionActions<cr>", { desc = "AI Palette/Actions" })

-- Add selected code directly to the chat buffer
map("v", "<leader>aa", "<cmd>CodeCompanionAdd<cr>", { desc = "AI Add to Chat" })

-- Quick inline assistant (creates a ghost-text prompt over your current line/selection)
map({ "n", "v" }, "<leader>ai", "<cmd>CodeCompanion<cr>", { desc = "AI Inline Assistant" })
--
-- Replace your old vim.lsp.buf.rename() with this:
map("n", "<leader>ra", "<cmd>Lspsaga rename<CR>", { desc = "LSP rename variable (Saga)" })

-- The new diagnostic mapping
map("n", "<leader>q", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Floating diagnostic" })


-- Lspsaga (Fixed modern commands)
map("n", "gh", "<cmd>Lspsaga finder<CR>", { desc = "LSP Finder" })
map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "LSP Code Action" })
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "LSP Hover Doc" })

-- Diagnostic navigation
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Go to Prev Diagnostic" })
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Go to Next Diagnostic" })

-- Peek definition / type definition
map("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" })
map("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", { desc = "Peek Type Definition" })

-- File outline sidebar
map("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { desc = "Toggle Outline" })

-- toggle lsp diagnostics
-- Toggle diagnostics on/off manually when the linter panics
map('n', '<leader>td', function()
  local bufnr = vim.api.nvim_get_current_buf()
  if vim.diagnostic.is_enabled({ bufnr = bufnr }) then
    vim.diagnostic.enable(false, { bufnr = bufnr })
    print("Diagnostics Disabled")
  else
    vim.diagnostic.enable(true, { bufnr = bufnr })
    print("Diagnostics Enabled")
  end
end, { desc = "Toggle Diagnostics" })

-- Swap mamba environment
map("n", "<leader>se", function()
  require("swenv.api").pick_venv()
end, { desc = "Switch Python Environment" })


-- osc 52 stuff
map('v', '<leader>y', '"+y', { desc = "Copy to system clipboard" })
