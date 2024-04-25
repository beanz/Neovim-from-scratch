local M = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/nvim-nio",
    -- general tests
    "vim-test/vim-test",
    "nvim-neotest/neotest-vim-test",
    -- language specific tests
    "marilari88/neotest-vitest",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-plenary",
    "rouge8/neotest-rust",
    "lawrence-laz/neotest-zig",
    "rcasia/neotest-bash",
  },
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>tt"] = { "<cmd>lua require'neotest'.run.run()<cr>", "Test Nearest" },
    ["<leader>tf"] = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Test File" },
    ["<leader>td"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Test" },
    ["<leader>ts"] = { "<cmd>lua require('neotest').run.run(vim.fn.getcwd())<cr>", "Test Suite" },
    ["<leader>tS"] = { "<cmd>lua require('neotest').run.stop()<cr>", "Test Stop" },
    ["<leader>ta"] = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach Test" },
    ["<leader>ti"] = { "<cmd>lua require'neotest'.summary.toggle()<cr>", "Test Summary" },
    ["<leader>to"] = { "<cmd>lua require('neotest').output.open()<cr>", "Output" },
    ["<leader>tO"] = { "<cmd>lua require('neotest').output.open( { enter = true })<cr>", "Output(enter)" },
  }

  ---@diagnostic disable: missing-fields
  require("neotest").setup {
    adapters = {
      require "neotest-python" {
        dap = { justMyCode = false },
      },
      require "neotest-vitest",
      require "neotest-zig",
      require "neotest-go" {
        recursive_run = true,
      },
      require "neotest-rust",
      require "neotest-vim-test" {
        ignore_file_types = { "python", "vim", "lua", "javascript", "typescript" },
      },
    },
    icons = {
      expanded = "",
      child_prefix = "",
      child_indent = "",
      final_child_prefix = "",
      non_collapsible = "",
      collapsed = "",

      passed = "",
      running = "",
      failed = "",
      unknown = ""
    },
  }

  vim.cmd([[
    command! NeotestSummary lua require("neotest").summary.toggle()
    command! NeotestFile lua require("neotest").run.run(vim.fn.expand("%"))
    command! Neotest lua require("neotest").run.run(vim.fn.getcwd())
    command! NeotestNearest lua require("neotest").run.run()
    command! NeotestDebug lua require("neotest").run.run({ strategy = "dap" })
    command! NeotestAttach lua require("neotest").run.attach()
    command! NeotestOutput lua require("neotest").output.open()
  ]])
end

return M
