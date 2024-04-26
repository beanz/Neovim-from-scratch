local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
}

function M.config()
  require("nvim-treesitter.configs").setup {
    ensure_installed = {
      "lua",
      "markdown",
      "bash",
      "dockerfile",
      "gitattributes",
      "gitignore",
      "go",
      "gomod",
      "jq",
      "json",
      "make",
      "markdown",
      "nix",
      "markdown_inline",
      "python",
      "rust",
      "yaml",
      "zig",
    },
    highlight = { enable = true },
    indent = { enable = true },
  }
end

return M
