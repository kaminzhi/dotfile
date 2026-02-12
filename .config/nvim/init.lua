-- Set leader key (must be set before loading plugins)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Load basic settings
require('config.options')

-- Auto-install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Load plugins
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  
  -- Load plugin configurations
  require('plugins.colorscheme')(use)
  require('plugins.ui')(use)
  require('plugins.editor')(use)
  require('plugins.coding')(use)
  require('plugins.lsp')(use)
  require('plugins.treesitter')(use)
  require('plugins.entertainment')(use)

  -- Auto sync on first install
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Load keymaps
require('config.keymaps')
