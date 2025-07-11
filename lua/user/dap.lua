local M = {
    "mfussenegger/nvim-dap",
--    commit = "6b12294a57001d994022df8acbe2ef7327d30587",
    event = "VeryLazy",
    -- dependencies = {
    --     {
    --         "ldelossa/nvim-dap-projects",
    --         event = "VeryLazy",
--    --         commit = "f319ffd99c6c8a0b930bcfc4bee0c751ffbf5808",
    --     },
    -- }
}

function M.config()
    local dap_ui_status_ok, dapui = pcall(require, "dapui")
    if not dap_ui_status_ok then
        return
    end
    local dap_ok, dap = pcall(require, "dap")
    if not (dap_ok) then
      print("nvim-dap not installed!")
      return
    end

    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
    end

end

M = {
  "ravenxrz/DAPInstall.nvim",
--  commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de",
  config = function()
    require("dap_install").setup {}
    require("dap_install").config("python", {})
    -- require("dap_install").config("ccppr_lldb", {})
  end,
}

return {}
