local M = {
  "linrongbin16/gitlinker.nvim",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  event = "VeryLazy",
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>gy"] = { "<cmd>GitLink<cr>", "Git link" },
    ["<leader>gY"] = { "<cmd>GitLink blam<cr>", "Git link blame" },
  }

  require("gitlinker").setup {
    message = false,
    console_log = false,
    action_callback = require"gitlinker.actions".copy_to_clipboard,
    router = {
      browse = {
        ["^github%.ibm%.com"] = "https://github.ibm.com/"
          .. "{_A.ORG}/"
          .. "{_A.REPO}/blob/"
          .. "{_A.REV}/"
          .. "{_A.FILE}?plain=1" -- '?plain=1'
          .. "#L{_A.LSTART}"
          .. "{(_A.LEND > _A.LSTART and ('-L' .. _A.LEND) or '')}",
      }
    },
  }
end

return M
