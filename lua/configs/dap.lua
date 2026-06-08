local dap, dapui = require "dap", require "dapui"

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- dap.configurations.rust = {
--   {
--     name = "Pretty",
--     type = "codelldb",
--     request = "launch",
--     program = function()
--       return vim.fn.getcwd() .. "/target/debug/roster-api"
--     end,
--     cwd = "${workspaceFolder}",
--     expressions = "simple",
--     initCommands = {
--       "command script import ~/scripts/rust_prettifier_for_lldb.py",
--     },
--   },
-- }
