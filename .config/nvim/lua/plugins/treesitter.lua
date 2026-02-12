return function(use)
  -- ========== Treesitter (Syntax highlighting) ==========
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
    config = function()
      local status_ok, treesitter_configs = pcall(require, 'nvim-treesitter.config')
      if not status_ok then
        vim.notify("nvim-treesitter.configs not found!", vim.log.levels.ERROR)
        return
      end

      treesitter_configs.setup({
        -- Languages to install
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "javascript",
          "typescript",
          "python",
          "html",
          "css",
          "json",
          "yaml",
          "markdown",
          "markdown_inline",
          "bash",
          "c",
          "cpp",
          "rust",
          "go",
        },

        auto_install = true,
        sync_install = false,
        ignore_install = {},
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            scope_incremental = "<S-CR>",
            node_decremental = "<BS>",
          },
        },
      })
    end
  }

  -- ========== Treesitter Text Objects ==========
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
    config = function()
      local status_ok, _ = pcall(require, 'nvim-treesitter.configs')
      if not status_ok then
        return
      end

      require('nvim-treesitter.configs').setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },
        },
      })
    end
  }

  -- ========== Treesitter Context ==========
  use {
    'nvim-treesitter/nvim-treesitter-context',
    after = 'nvim-treesitter',
    config = function()
      local status_ok, treesitter_context = pcall(require, 'treesitter-context')
      if not status_ok then
        return
      end

      treesitter_context.setup({
        enable = true,
        max_lines = 3,
        min_window_height = 0,
        line_numbers = true,
        multiline_threshold = 20,
        trim_scope = 'outer',
        mode = 'cursor',
        separator = nil,
        zindex = 20,
        on_attach = nil,
      })
    end
  }

  -- ========== Alternative Treesitter Plugins ==========
  
  -- Rainbow Delimiters
  -- use {
  --   'HiPhish/rainbow-delimiters.nvim',
  --   after = 'nvim-treesitter',
  --   config = function()
  --     local rainbow_delimiters = require('rainbow-delimiters')
  --     vim.g.rainbow_delimiters = {
  --       strategy = {
  --         [''] = rainbow_delimiters.strategy['global'],
  --         vim = rainbow_delimiters.strategy['local'],
  --       },
  --       query = {
  --         [''] = 'rainbow-delimiters',
  --         lua = 'rainbow-blocks',
  --       },
  --       highlight = {
  --         'RainbowDelimiterRed',
  --         'RainbowDelimiterYellow',
  --         'RainbowDelimiterBlue',
  --         'RainbowDelimiterOrange',
  --         'RainbowDelimiterGreen',
  --         'RainbowDelimiterViolet',
  --         'RainbowDelimiterCyan',
  --       },
  --     }
  --   end
  -- }

  -- Treesitter Playground
  -- use {
  --   'nvim-treesitter/playground',
  --   after = 'nvim-treesitter',
  --   cmd = "TSPlaygroundToggle",
  -- }

  -- Autotagging for HTML, XML, etc.
  -- use {
  --   'windwp/nvim-ts-autotag',
  --   after = 'nvim-treesitter',
  --   config = function()
  --     require('nvim-ts-autotag').setup()
  --   end
  -- }
end
