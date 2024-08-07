-- NOTE: Every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

return {
  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>ge", false },
    },
  },

  -- Adding the Gruvbox colorscheme.
  { "ellisonleao/gruvbox.nvim" },

  -- Configuring LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },

  -- Adding powershell to treesitter for .ps1, .psm1 and .psd1 file highlights.
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.powershell = {
        install_info = {
          url = "https://github.com/jrsconfitto/tree-sitter-powershell",
          files = { "src/parser.c" },
        },
        filetype = { "ps1", "psm1", "psd1" },
      }
    end,
  },

  -- LSP for PowerShell NOTE: ONLY PROVIDES POSSIBLE PARAMETERS FOR CMDLET ON HOVER.
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.powershell_es.setup({
        filetypes = { "ps1", "psm1", "psd1" },
        bundle_path = "~/AppData/Local/nvim-data/mason/packages/powershell-editor-services",
        settings = { powershell = { codeFormatting = { Preset = "OTBS" } } },
      })
    end,
  },
}
