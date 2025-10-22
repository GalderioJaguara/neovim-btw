return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "leoluz/nvim-dap-go",
    "nvim-neotest/nvim-nio"
  },
  config = function ()
    local dap = require("dap")
    local dapui = require("dapui")
    require('dap-go').setup()
    dapui.setup()
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
    vim.keymap.set('n', '<F5>', dap.continue, {})
    vim.keymap.set('n', '<F1>', dap.step_into, {})
    vim.keymap.set('n', '<F2>', dap.step_over, {})
    vim.keymap.set('n', '<F3>', dap.step_out, {})
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, {})
    vim.keymap.set('n', '<leader>B', dap.set_breakpoint, {})
  end
}
