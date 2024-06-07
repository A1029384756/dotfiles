return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio'
  },
  config = function()
    local dap, dapui = require('dap'), require('dapui')
    require('dapui').setup()
    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close()
    end

    dap.adapters.gdb = {
      id = 'gdb',
      type = 'executable',
      command = 'gdb',
      args = { '--quiet', '--interpreter=dap' },
    }

    dap.configurations.odin = {
      {
        type = 'gdb',
        name = 'Run executable (GDB)',
        request = 'launch',
        program = function()
          local path = vim.fn.input({
            prompt = 'Path to executable: ',
            default = vim.fn.getcwd() .. '/',
            completion = 'file'
          })
          return (path and path ~= '') and path or dap.ABORT
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
      },
    }
  end
}
