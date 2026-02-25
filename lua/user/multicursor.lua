local M = {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    commit = "7fa95668af59d2a01c87390fb2eed8e48600952c",
    event = "VimEnter",
    config = function()
        local mc = require("multicursor-nvim")
        mc.setup()

        local keymap = vim.keymap.set

        -- Add or skip cursor above/below the main cursor.
        keymap({ "n", "x" }, "<A-C-k>", function()
            mc.lineAddCursor(-1)
        end)
        keymap({ "n", "x" }, "<A-C-j>", function()
            mc.lineAddCursor(1)
        end)
        keymap({ "n", "x" }, "<A-s>", function()
            mc.lineSkipCursor(-1)
        end)
        keymap({ "n", "x" }, "<A-S>", function()
            mc.lineSkipCursor(1)
        end)

        -- Add or skip adding a new cursor by matching word/selection
        keymap({ "n", "x" }, "<A-n>", function()
            mc.matchAddCursor(1)
        end)
        keymap({ "n", "x" }, "<A-s>", function()
            mc.matchSkipCursor(1)
        end)
        keymap({ "n", "x" }, "<A-N>", function()
            mc.matchAddCursor(-1)
        end)
        keymap({ "n", "x" }, "<A-S>", function()
            mc.matchSkipCursor(-1)
        end)

        -- Add and remove cursors with control + left click.
        keymap("n", "<c-leftmouse>", mc.handleMouse)
        keymap("n", "<c-leftdrag>", mc.handleMouseDrag)
        keymap("n", "<c-leftrelease>", mc.handleMouseRelease)

        -- Disable and enable cursors.
        keymap({ "n", "x" }, "<Esc>", mc.toggleCursor)

        -- Mappings defined in a keymap layer only apply when there are
        -- multiple cursors. This lets you have overlapping mappings.
        mc.addKeymapLayer(function(layerSet)
            -- Select a different cursor as the main one.
            layerSet({ "n", "x" }, "<left>", mc.prevCursor)
            layerSet({ "n", "x" }, "<right>", mc.nextCursor)

            -- Delete the main cursor.
            layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

            -- Enable and clear cursors using escape.
            layerSet("n", "<esc>", function()
                if not mc.cursorsEnabled() then
                    mc.enableCursors()
                else
                    mc.clearCursors()
                end
            end)
        end)

        -- Customize how cursors look.
        local hl = vim.api.nvim_set_hl
        hl(0, "MultiCursorCursor", { reverse = true })
        hl(0, "MultiCursorVisual", { link = "Visual" })
        hl(0, "MultiCursorSign", { link = "SignColumn" })
        hl(0, "MultiCursorMatchPreview", { link = "Search" })
        hl(0, "MultiCursorDisabledCursor", { reverse = true })
        hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
        hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
    end,
}

return {}
