local opt = vim.opt

-- ========== Line Numbers ==========
opt.number = true
opt.relativenumber = true

-- ========== Indentation ==========
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- ========== Search ==========
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- ========== Appearance ==========
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.cursorline = true
opt.wrap = false

-- ========== Split Windows ==========
opt.splitright = true
opt.splitbelow = true

-- ========== Editing ==========
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.backspace = "indent,eol,start"

-- ========== Files ==========
opt.undofile = true
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- ========== Performance ==========
opt.updatetime = 300
opt.timeoutlen = 400
opt.lazyredraw = true

-- ========== Completion Menu ==========
opt.completeopt = "menu,menuone,noselect"
opt.pumheight = 10
