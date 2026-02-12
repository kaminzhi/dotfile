local keymap = vim.keymap

-- Clear search highlights
keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })

-- Save and quit
keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Quit' })

-- Split windows
keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' })
keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' })
keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' })

-- Window navigation
keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to left window' })
keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window' })
keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window' })
keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })

-- Window resize
keymap.set('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase window height' })
keymap.set('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease window height' })
keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })
keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase window width' })

-- Buffer management
keymap.set('n', '<Tab>', ':bnext<CR>', { desc = 'Next buffer' })
keymap.set('n', '<S-Tab>', ':bprevious<CR>', { desc = 'Previous buffer' })
keymap.set('n', '<leader>x', ':bdelete<CR>', { desc = 'Close buffer' })
keymap.set('n', '<leader>ba', ':%bd|e#|bd#<CR>', { desc = 'Close all buffers except current' })

-- Move selected lines
keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })

-- Keep visual mode after indenting
keymap.set('v', '<', '<gv', { desc = 'Indent left' })
keymap.set('v', '>', '>gv', { desc = 'Indent right' })

-- ========== File Explorer ==========
keymap.set('n', '<leader>e', '<cmd>Yazi<CR>', { desc = 'Open yazi at current file' })
keymap.set('n', '<leader>E', '<cmd>Yazi cwd<CR>', { desc = 'Open yazi in working directory' })

-- ========== Fuzzy Finder ==========
keymap.set('n', '<leader>ff', '<cmd>FzfLua files<CR>', { desc = 'Find files' })
keymap.set('n', '<leader>fg', '<cmd>FzfLua live_grep<CR>', { desc = 'Live grep' })
keymap.set('n', '<leader>fb', '<cmd>FzfLua buffers<CR>', { desc = 'Find buffers' })
keymap.set('n', '<leader>fh', '<cmd>FzfLua help_tags<CR>', { desc = 'Help tags' })
keymap.set('n', '<leader>fo', '<cmd>FzfLua oldfiles<CR>', { desc = 'Recent files' })
keymap.set('n', '<leader>fc', '<cmd>FzfLua commands<CR>', { desc = 'Commands' })
keymap.set('n', '<leader>fk', '<cmd>FzfLua keymaps<CR>', { desc = 'Keymaps' })
keymap.set('n', '<leader>fs', '<cmd>FzfLua git_status<CR>', { desc = 'Git status' })
keymap.set('n', '<leader>fw', '<cmd>FzfLua grep_cword<CR>', { desc = 'Grep word under cursor' })

-- ========== Terminal (Floaterm) ==========
keymap.set('n', '<leader>tt', '<cmd>FloatermToggle<CR>', { desc = 'Toggle floating terminal' })
keymap.set('n', '<leader>tn', '<cmd>FloatermNew<CR>', { desc = 'New terminal' })
keymap.set('n', '<leader>tp', '<cmd>FloatermPrev<CR>', { desc = 'Previous terminal' })
keymap.set('n', '<leader>tj', '<cmd>FloatermNext<CR>', { desc = 'Next terminal' })
keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- ========== Quick Jump (Hop) ==========
keymap.set('n', '<leader>jw', '<cmd>HopWord<CR>', { desc = 'Jump to word' })
keymap.set('n', '<leader>jl', '<cmd>HopLine<CR>', { desc = 'Jump to line' })
keymap.set('n', '<leader>jc', '<cmd>HopChar1<CR>', { desc = 'Jump to char' })
keymap.set('n', '<leader>jp', '<cmd>HopPattern<CR>', { desc = 'Jump to pattern' })

-- ========== Markdown Preview ==========
keymap.set('n', '<leader>mkp', '<cmd>MarkdownPreview<CR>', { desc = 'Markdown preview' })
keymap.set('n', '<leader>mks', '<cmd>MarkdownPreviewStop<CR>', { desc = 'Stop markdown preview' })
keymap.set('n', '<leader>mkt', '<cmd>MarkdownPreviewToggle<CR>', { desc = 'Toggle markdown preview' })

-- ========== Bufferline ==========
keymap.set('n', '<leader>bp', ':BufferLinePick<CR>', { desc = 'Pick buffer' })
keymap.set('n', '<leader>bc', ':BufferLinePickClose<CR>', { desc = 'Pick buffer to close' })
keymap.set('n', '<leader>bl', ':BufferLineCloseLeft<CR>', { desc = 'Close all left buffers' })
keymap.set('n', '<leader>br', ':BufferLineCloseRight<CR>', { desc = 'Close all right buffers' })
