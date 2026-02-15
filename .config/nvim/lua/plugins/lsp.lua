return function(use)
  -- ========== Mason (LSP installer) ==========
  use {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end
  }

  -- ========== Mason LSP Config ==========
  use {
    'williamboman/mason-lspconfig.nvim',
    after = 'mason.nvim',
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls", 
          "pyright",
          "html",
          "cssls",
          "tailwindcss",
        },
        automatic_installation = true,
      })

      -- ========== LSP Config using vim.lsp.config ==========
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local has_cmp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
      if has_cmp then
        capabilities = cmp_nvim_lsp.default_capabilities()
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        end,
      })

      local servers = { "ts_ls", "pyright", "html", "cssls", "tailwindcss", "lua_ls" }

      for _, name in ipairs(servers) do
        if name == "lua_ls" then
          vim.lsp.config[name] = {
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = { globals = { 'vim' } },
                workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
              }
            }
          }
        else
          vim.lsp.config[name] = { capabilities = capabilities }
        end
      end
    end
  }

  -- ========== Alternative/Additional LSP Plugins ==========

  -- null-ls (Formatting and linting)
  -- use {
  --   'jose-elias-alvarez/null-ls.nvim',
  --   requires = { 'nvim-lua/plenary.nvim' },
  --   config = function()
  --     local null_ls = require("null-ls")
  --     null_ls.setup({
  --       sources = {
  --         null_ls.builtins.formatting.prettier,
  --         null_ls.builtins.formatting.stylua,
  --         null_ls.builtins.diagnostics.eslint,
  --       },
  --     })
  --   end
  -- }

end
