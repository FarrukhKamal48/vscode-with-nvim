local M = {
    "goolord/alpha-nvim",
    event = "VimEnter",
    commit = "a35468cd72645dbd52c0624ceead5f301c566dff",
}

function M.config()
  local alpha = require "alpha"
  local dashboard = require "alpha.themes.dashboard"
    dashboard.section.header.val = {
      [[                               __                ]],
      [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
      [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
      [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
      [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
      [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    }
    dashboard.section.buttons.val = {
        -- dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        -- dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        -- dashboard.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", " " .. " [Config] Nvim", ":e ~/.config/nvim/init.lua <CR>"),
        dashboard.button("n", " " .. " [Config] Niri", ":e ~/.config/niri/config.kdl <CR>"),
        dashboard.button("e", " " .. " Note", ":e ~/vault/notes/ <CR>"),
        dashboard.button("q", " " .. " Quit", ":qa<CR>"),
    }
    local function footer()
      return ""
    end

    dashboard.section.footer.val = footer()

    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
end

return M
