local M = {
  "cshuaimin/ssr.nvim",
  lazy = "false",
  name = "ssr",
}

function M.config() end
  require("ssr").setup {
    min_width = 50,
    min_height = 5,
    keymaps = {
      close = "q",
      next_match = "n",
      prev_match = "N",
      replace_all = "<leader><cr>",
    },
  }
  local wk = require "which-key"
  wk.register {
    ["<leader>fR"] = { "<cmd>lua require(\"ssr\").open()<CR>", "SSR" },
  }
return M
