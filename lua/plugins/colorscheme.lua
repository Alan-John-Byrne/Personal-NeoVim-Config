return {
  -- Adding the Gruvbox colorscheme.
  { "ellisonleao/gruvbox.nvim" },

  -- Configuring LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
-- IMPORTANT: See above that you can configure more than one plugin within the same plugin.lua file.
