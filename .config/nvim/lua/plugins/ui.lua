return function(use)
  -- ========== Lualine (Statusbar) ==========
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'tokyonight',
          component_separators = { left = '|', right = '|'},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = true,
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {{
            function()
              return require('what-im-listening').get_lualine_status()
            end,
          },'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      })
    end
  }

  -- ========== Bufferline (Tab bar) ==========
  use {
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup({
        options = {
          mode = "buffers",
          numbers = "none",
          close_command = "bdelete! %d",
          right_mouse_command = "bdelete! %d",
          left_mouse_command = "buffer %d",
          middle_mouse_command = nil,
          indicator = {
            icon = '▎',
            style = 'icon',
          },
          buffer_close_icon = '󰅖',
          modified_icon = '●',
          close_icon = '',
          left_trunc_marker = '',
          right_trunc_marker = '',
          max_name_length = 18,
          max_prefix_length = 15,
          truncate_names = true,
          tab_size = 18,
          diagnostics = "nvim_lsp",
          diagnostics_update_in_insert = false,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "center",
              separator = true
            }
          },
          color_icons = true,
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          show_duplicate_prefix = true,
          persist_buffer_sort = true,
          separator_style = "thin",
          enforce_regular_tabs = false,
          always_show_bufferline = true,
        }
      })
    end
  }

  -- ========== Indent Blankline ==========
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("ibl").setup({
        indent = {
          char = "│",
          tab_char = "│",
        },
        scope = {
          enabled = true,
          show_start = true,
          show_end = false,
        },
        exclude = {
          filetypes = {
            "help",
            "alpha",
            "dashboard",
            "neo-tree",
            "Trouble",
            "lazy",
            "mason",
            "notify",
            "toggleterm",
            "lazyterm",
          },
        },
      })
    end
  }

  -- ========== Notify (Notification manager) ==========
  use {
    'rcarriga/nvim-notify',
    config = function()
      local notify = require("notify")
      notify.setup({
        background_colour = "#000000",
        fps = 30,
        icons = {
          DEBUG = "",
          ERROR = "",
          INFO = "",
          TRACE = "✎",
          WARN = ""
        },
        level = 2,
        minimum_width = 50,
        render = "default",
        stages = "fade_in_slide_out",
        timeout = 3000,
        top_down = true
      })
      vim.notify = notify
    end
  }

    -- ========== Floaterm (Floating Terminal) ==========
  use {
    'voldikss/vim-floaterm',
    config = function()
      vim.g.floaterm_width = 0.8
      vim.g.floaterm_height = 0.8
      vim.g.floaterm_wintype = 'float'
      vim.g.floaterm_position = 'center'
      vim.g.floaterm_borderchars = '─│─│╭╮╯╰'
      vim.g.floaterm_rootmarkers = {'.git', '.hg', '.svn', '.root'}
    end
  }

  -- ========== Web Devicons ==========
  use 'nvim-tree/nvim-web-devicons'

  -- ========== Alternative UI Plugins (Uncomment to use) ==========
  -- Alpha (Dashboard)
  -- use {
  --   'goolord/alpha-nvim',
  --   requires = { 'nvim-tree/nvim-web-devicons' },
  --   config = function()
  --     require('alpha').setup(require('alpha.themes.startify').config)
  --   end
  -- }

  -- Noice (Better UI)
  -- use {
  --   'folke/noice.nvim',
  --   requires = {
  --     'MunifTanjim/nui.nvim',
  --     'rcarriga/nvim-notify',
  --   },
  --   config = function()
  --     require("noice").setup()
  --   end
  -- }

  -- Dressing (Better vim.ui)
  -- use {
  --   'stevearc/dressing.nvim',
  --   config = function()
  --     require('dressing').setup()
  --   end
  -- }

end
