return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_enable = {
        exclude = { "rust_analyzer" }; -- NixOS issue... no FHS dynamically linked executable
      },
      ensure_installed = { 
        "lua_ls", 
        "pyright",
        "pyright",
        "ts_ls",
        "clangd",
      },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lsps = {
        { "lua_ls" },
        { "pyright" },
        { "ts_ls" },
        { "rust-analyzer" },
      }

      for _, lsp in pairs(lsps) do
        local name, config = lsp[1], lsp[2]
        vim.lsp.enable(name)
        if config then
          vim.lsp.config(name, config)
        end
      end
    end
  },
}
