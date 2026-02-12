return function(use)
  -- ========== Tokyo Night Theme ==========
  use {
    'folke/tokyonight.nvim',
    config = function()
      require("tokyonight").setup({
        style = "moon", -- Available: storm, moon, night, day
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
        },
        sidebars = { "qf", "help" },
        day_brightness = 0.3,
        hide_inactive_statusline = false,
        dim_inactive = false,
        lualine_bold = false,
      })
      vim.cmd[[colorscheme tokyonight]]
    end
  }

  -- ========== Alternative Colorschemes ==========
  -- Catppuccin
  -- use {
  --   'catppuccin/nvim',
  --   as = 'catppuccin',
  --   config = function()
  --     require("catppuccin").setup({
  --       flavour = "mocha", -- latte, frappe, macchiato, mocha
  --     })
  --     vim.cmd[[colorscheme catppuccin]]
  --   end
  -- }

  -- Nightfox
  -- use {
  --   'EdenEast/nightfox.nvim',
  --   config = function()
  --     vim.cmd[[colorscheme nightfox]]
  --   end
  -- }

  -- Kanagawa
  -- use {
  --   'rebelot/kanagawa.nvim',
  --   config = function()
  --     vim.cmd[[colorscheme kanagawa]]
  --   end
  -- }

  -- Gruvbox
  -- use {
  --   'morhetz/gruvbox',
  --   config = function()
  --     vim.cmd[[colorscheme gruvbox]]
  --   end
  -- }

  -- Nord
  -- use {
  --   'shaunsingh/nord.nvim',
  --   config = function()
  --     vim.cmd[[colorscheme nord]]
  --   end
  -- }

end
