local dap, dapui = require('dap'), require('dapui')

local dap_vscode = require('dap.ext.vscode')

dapui.setup()

--
-- Listeners
--

-- Load dapui when attaching
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

--
-- Keybinds
--

-- Toggle Breakpoint
vim.keymap.set('n', '<leader>bp', function()
  require('dap').toggle_breakpoint()
end, { silent = true, desc = 'toggle [b]reak[p]oint' })

-- Launch debugger
vim.keymap.set('n', '<F5>', function()
  require('dap').continue()
end, { silent = true, desc = 'Launch debugger' })
