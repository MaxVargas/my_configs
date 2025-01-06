return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {"lua", "vim", "rust", "python", "latex", "python", "tmux", "haskell", "bibtex", "bash", "markdown_inline"},
      auto_install = true,
      sync_install = false,
      highlight = {enable = true},
      indent = {enable = true},
    })
  end
}
