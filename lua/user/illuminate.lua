local M = {
  "RRethy/vim-illuminate",
  commit = "d6ca7f77eeaf61b3e6ce9f0e5a978d606df44298",
  event = "VeryLazy",
}

function M.config()
  local illuminate = require "illuminate"
  vim.g.Illuminate_ftblacklist = { "alpha", "NvimTree" }
  vim.api.nvim_set_keymap(
    "n",
    "<a-b>",
    '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>',
    { noremap = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<a-B>",
    '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>',
    { noremap = true }
  )

  illuminate.configure {
    providers = {
      "lsp",
      "treesitter",
      "regex",
    },
    delay = 200,
    filetypes_denylist = {
      "dirvish",
      "fugitive",
      "alpha",
      "NvimTree",
      "packer",
      "neogitstatus",
      "Trouble",
      "lir",
      "Outline",
      "spectre_panel",
      "toggleterm",
      "DressingSelect",
      "TelescopePrompt",
    },
    filetypes_allowlist = {},
    modes_denylist = {},
    modes_allowlist = {},
    providers_regex_syntax_denylist = {},
    providers_regex_syntax_allowlist = {},
    under_cursor = true,
    large_file_cutoff = 10000,
  }
end

return M
