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

    local keymap = vim.keymap.set

    keymap("n", "<A-d><A-b>", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", {desc = "toggle breakpoint", silent = false})
    keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", {desc = "debug continue", silent = false})
    keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", {desc = "step into", silent = false})
    keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", {desc = "step over", silent = false})
    keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", {desc = "step out", silent = false})
    keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", {desc = "toggle debug repl", silent = false})
    keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", {desc = "run last debug", silent = false})
    keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", {desc = "toggle debug ui", silent = false})
    keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", {desc = "terminate debug", silent = false})

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
