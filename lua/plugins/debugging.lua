return {
  "mfussenegger/nvim-dap",
  dependencies = { "igorlfs/nvim-dap-view",
  "jay-babu/mason-nvim-dap.nvim"
},
  config = function()
    local dap = require("dap")
    local dap_view = require("dap-view")

    dap_view.setup()

    -- 2. Cấu hình TỰ ĐỘNG mở giao diện khi bắt đầu Debug
    dap.listeners.before.attach["dap-view"] = function()
      dap_view.open()
    end
    dap.listeners.before.launch["dap-view"] = function()
      dap_view.open()
    end
    
    dap.listeners.before.event_terminated["dap-view"] = function()
      dap_view.close()
    end
    dap.listeners.before.event_exited["dap-view"] = function()
      dap_view.close()
    end

    vim.keymap.set("n", "<Leader>dv", function() dap_view.toggle() end, { desc = "Toggle Dap View" })

    vim.keymap.set("n", "<Leader>b", function()
      dap.toggle_breakpoint()
    end, { desc = "Toggle breakpoint" })

    vim.keymap.set("n", "<Leader>B", function()
      dap.set_breakpoint()
    end, { desc = "Set breakpoint" })

    vim.keymap.set("n", "<Leader>lp", function()
      dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end, { desc = "Set log point" })

    vim.keymap.set("n", "<F5>", function()
      require("dap").continue()
    end, { desc = "Start/continue debugging" })
    vim.keymap.set("n", "<F10>", function() dap.step_over() end, { desc = "Step over" })
    vim.keymap.set("n", "<F11>", function() dap.step_into() end, { desc = "Step into" })
    vim.keymap.set("n", "<S-F11>", function() dap.step_out() end, { desc = "Step out" })
  end
}
