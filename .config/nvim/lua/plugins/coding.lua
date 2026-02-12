return function(use)
  -- ========== nvim-cmp (Autocompletion) ==========
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',     -- LSP completion source
      'hrsh7th/cmp-buffer',       -- Buffer completion source
      'hrsh7th/cmp-path',         -- Path completion source
      'hrsh7th/cmp-cmdline',      -- Cmdline completion source
      'L3MON4D3/LuaSnip',         -- Snippet engine
      'saadparwaiz1/cmp_luasnip', -- LuaSnip completion source
      'rafamadriz/friendly-snippets', -- Predefined snippets
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      -- Load predefined snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
          { name = 'path' },
        }),
        formatting = {
          format = function(entry, vim_item)
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              path = "[Path]",
            })[entry.source.name]
            return vim_item
          end
        },
      })

      -- Cmdline completion for search
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Cmdline completion for commands
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })

      -- Autopairs integration
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end
  }

  -- ========== Alternative Completion Plugins ==========
  -- Copilot
  -- use {
  --   'github/copilot.vim',
  -- }

  -- Tabnine
  -- use {
  --   'codota/tabnine-nvim',
  --   run = './dl_binaries.sh',
  --   config = function()
  --     require('tabnine').setup()
  --   end
  -- }

end
