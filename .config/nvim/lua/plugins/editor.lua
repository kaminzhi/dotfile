return function(use)
  -- ========== Yazi File Manager ==========
  use {
    'mikavilpas/yazi.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('yazi').setup({
        open_for_directories = false,
        keymaps = {
          show_help = '<f1>',
        },
      })
    end
  }

  -- ========== Discord ==========
  use {
    'kaminzhi/oxicord.nvim',
    config = function()
      require('oxicord').setup({
        binary = "path/to/oxicord", -- path to oxicord
        keys = "<leader>dc"    -- Keybind to open the floating terminal
      })
    end
  }

  -- ========== Telescope Fuzzy Finder ==========
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
    config = function()
      local telescope = require("telescope")
      local lga_actions = require("telescope-live-grep-args.actions")

      telescope.setup({
        defaults = {
          selection_caret = "➤ ",
          path_display = { "truncate" },
          layout_config = {
            horizontal = {
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
        },
        extensions = {
          live_grep_args = {
            auto_quoting = true,
            mappings = {
              i = {
                ["<C-k>"] = lga_actions.quote_prompt(),
                ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              },
            },
          },
        },
      })

      telescope.load_extension("live_grep_args")
    end
  }

  -- ========== FZF Fuzzy Finder ==========
  use {
    'ibhagwan/fzf-lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('fzf-lua').setup({
        winopts = {
          height = 0.85,
          width = 0.80,
          row = 0.35,
          col = 0.50,
          border = 'rounded',
          preview = {
            border = 'border',
            wrap = 'nowrap',
            hidden = 'nohidden',
            vertical = 'down:45%',
            horizontal = 'right:60%',
            layout = 'flex',
            flip_columns = 120,
          },
        },
        files = {
          prompt = 'Files❯ ',
          multiprocess = true,
          git_icons = true,
          file_icons = true,
          color_icons = true,
        },
        grep = {
          prompt = 'Rg❯ ',
          input_prompt = 'Grep For❯ ',
          multiprocess = true,
          git_icons = true,
          file_icons = true,
          color_icons = true,
        },
      })
    end
  }

  -- ========== Markdown Preview ==========
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { 'markdown' },
    cmd = { 'MarkdownPreview', 'MarkdownPreviewStop', 'MarkdownPreviewToggle' },
    config = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_command_for_global = 0
      vim.g.mkdp_open_to_the_world = 0
      vim.g.mkdp_open_ip = ''
      vim.g.mkdp_browser = ''
      vim.g.mkdp_echo_preview_url = 0
      vim.g.mkdp_browserfunc = ''
      
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          vim.keymap.set('n', '<leader>mp', '<cmd>MarkdownPreview<CR>', { buffer = true, desc = 'Markdown preview' })
          vim.keymap.set('n', '<leader>ms', '<cmd>MarkdownPreviewStop<CR>', { buffer = true, desc = 'Stop markdown preview' })
          vim.keymap.set('n', '<leader>mt', '<cmd>MarkdownPreviewToggle<CR>', { buffer = true, desc = 'Toggle markdown preview' })
        end
      })
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml = {},
        maid = {},
        disable_sync_scroll = 0,
        sync_scroll_type = 'middle',
        hide_yaml_meta = 1,
        sequence_diagrams = {},
        flowchart_diagrams = {},
        content_editable = false,
        disable_filename = 0,
        toc = {}
      }
      vim.g.mkdp_markdown_css = ''
      vim.g.mkdp_highlight_css = ''
      vim.g.mkdp_port = ''
      vim.g.mkdp_page_title = '「${name}」'
      vim.g.mkdp_filetypes = {'markdown'}
      vim.g.mkdp_theme = 'dark'
    end
  }

  -- ========== Comment (Comment toggler) ==========
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        padding = true,
        sticky = true,
        ignore = nil,
        toggler = {
          line = 'gcc',
          block = 'gbc',
        },
        opleader = {
          line = 'gc',
          block = 'gb',
        },
        extra = {
          above = 'gcO',
          below = 'gco',
          eol = 'gcA',
        },
        mappings = {
          basic = true,
          extra = true,
        },
      })
    end
  }

  -- ========== Autopairs (Auto close brackets) ==========
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({
        check_ts = true,
        ts_config = {
          lua = { 'string' },
          javascript = { 'template_string' },
        },
        disable_filetype = { "TelescopePrompt", "vim" },
        fast_wrap = {
          map = '<M-e>',
          chars = { '{', '[', '(', '"', "'" },
          pattern = [=[[%'%"%)%>%]%)%}%,]]=],
          end_key = '$',
          keys = 'qwertyuiopzxcvbnmasdfghjkl',
          check_comma = true,
          highlight = 'Search',
          highlight_grey='Comment'
        },
      })
    end
  }

  -- ========== Surround (Surround text objects) ==========
  use {
    'kylechui/nvim-surround',
    tag = "*",
    config = function()
      require("nvim-surround").setup({})
    end
  }

  -- ========== Hop (Quick jump navigation) ==========
  use {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require('hop').setup({
        keys = 'etovxqpdygfblzhckisuran'
      })
    end
  }

  -- ========== Which-key (Keybinding hints) ==========
  use {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        preset = "helix",
      })
    end
  }

  -- ========== Plenary (Utility library) ==========
  use 'nvim-lua/plenary.nvim'

  -- ========== Alternative Editor Plugins (Uncomment to use) ==========

  -- Neo-tree (Alternative file manager)
  -- use {
  --   'nvim-neo-tree/neo-tree.nvim',
  --   branch = "v3.x",
  --   requires = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-tree/nvim-web-devicons',
  --     'MunifTanjim/nui.nvim',
  --   },
  --   config = function()
  --     require("neo-tree").setup()
  --   end
  -- }

  -- Trouble (Better diagnostics list)
  -- use {
  --   'folke/trouble.nvim',
  --   requires = 'nvim-tree/nvim-web-devicons',
  --   config = function()
  --     require("trouble").setup()
  --   end
  -- }

  -- Flash (Alternative to Hop)
  -- use {
  --   'folke/flash.nvim',
  --   config = function()
  --     require("flash").setup()
  --   end
  -- }

  -- ========== Add your custom editor plugins here ==========
end
