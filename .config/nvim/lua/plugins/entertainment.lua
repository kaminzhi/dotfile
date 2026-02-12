return function(use)
  -- ========== Apple Music ==========
    use {
        'kaminzhi/apple-music.nvim',
        config = function()
        require('am').setup({
            use_telescope = true,
            status_icon = "♫ "
        })
        end
    }

  -- ========== Media-Status ==========
    use {
      "kaminzhi/what-im-listening.nvim",
      run = 'bash ./build.sh',
      config = function()
      require('what-im-listening').setup({
        min_display_width = 30,
      })
      end
    }

  -- ========== Spotify ==========
  -- use {
  --  'slapelachie/spotify.nvim',
  --  requires = {
  --      'nvim-telescope/telescope.nvim',
  --      'nvim-lua/plenary.nvim',
  --  },
  --  config = function()
  --      local spotify = require('spotify')
  --      spotify.setup({
  --      -- Spotify configuration
  --          status = {
  --              update_interval = 10000,
  --              format = '%s %t by %a'
  --          },
  --      })
  --  end,
  --  run = 'make'
  -- }

  -- ========== Alternative Entertainment Plugins ==========
  -- Cellular Automaton (Fun animations)
  -- use {
  --   'eandrju/cellular-automaton.nvim',
  -- }

  -- Duck (Pet duck in neovim)
  -- use {
  --   'tamton-aquib/duck.nvim',
  --   config = function()
  --     vim.keymap.set('n', '<leader>dd', function() require("duck").hatch() end, {})
  --     vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
  --   end
  -- }

  -- Zone (Screensaver)
  -- use {
  --   'folke/zone.nvim',
  --   config = function()
  --     require("zone").setup()
  --   end
  -- }

  -- ========== Add your custom entertainment plugins here ==========
end
