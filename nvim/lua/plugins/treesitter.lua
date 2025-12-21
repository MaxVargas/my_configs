return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  version = false, -- last release is way too old and doesn't work on Windows
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      folds = { enable = true },

      highlight = { 
        enable = true,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },

      indent = { enable = true },

      sync_insntall = true,
      auto_install = true,

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          scope_incremental = "<TAB>",
          node_decremental = "<S-TAB>",
        },
      },

      ensure_installed = {
        "bash",
        "bibtex",
        "c",
        "diff",
        "haskell",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "latex",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "nix",
        "printf",
        "python",
        "query",
        "regex",
        "rust",
        "tmux",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
    })
  end
}
