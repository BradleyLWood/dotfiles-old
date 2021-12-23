local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('', '<Space>', '<Nop>', opts)	-- Disable default spacebar
vim.g.mapleader = ' '				-- Set leader key
vim.g.maplocalleader = ' '			-- Set local leader key

-- Numberline controls
map('n', '<C-n><C-n>', ':set number!<CR>', { })
map('n', '<C-m><C-m>', ':set relativenumber!<CR>', { })

-- Only add jumps greater than 5 to jump list
-- Also handle wrapped lines better
map('n', 'j', '(v:count > 5 ? "m\'" . v:count : "") . "gj"',
	{ noremap = true, silent = true, expr = true })
map('n', 'k', '(v:count > 5 ? "m\'" . v:count : "") . "gk"',
	{ noremap = true, silent = true, expr = true })

-- Preview Markdown Files
map('n', '<Leader>md', ':InstantMarkdownPreview<CR>', opts)
map('n', '<Leader>ms', ':InstantMarkdownStop<CR>', opts)

map('n', 'Q', '<Nop>', opts) -- Disable Q ex mode

map('n', '<Leader>u', ':UndotreeShow<CR>', opts) -- UndotreeShow

map('', '<Leader><Space>', ':let @/=""<CR>', opts) -- Clear search highlights

map('n', '<S-C-p', '"0p', opts) -- Paste last yank

map('n', '<Leader>d', '"_d', opts)	-- Delete without yank
map('n', 'x', '"_x', opts)			-- Delete without yank

map('x', '<Leader>p', '"_dP', opts) -- Don't put pasted over content in the paste register

map('n', '+', '<C-a', opts) -- Increment number
map('n', '-', '<C-x', opts) -- Decrement number

-- Buffers
map('n', '<Leader>bj', ':bNext<CR>', opts)
map('n', '<Leader>bk', ':bPrev<CR>', opts)

-- Tabs
map('n', '<Leader>te', ':tabedit', opts)
map('n', '<Leader>tj', ':tabnext<CR>', opts)
map('n', '<Leader>tk', ':tabprev<CR>', opts)
map('n', '<Tab>', ':tabnext<CR>', opts)
map('n', '<S-Tab>', ':tabprev<CR>', opts)

-- Splits
map('n', '<Leader>sv', ':vsplit<CR><C-w>w', opts)
map('n', '<Leader>ss', ':split<CR><C-w>w', opts)
map('n', 'sh', '<C-w>h', opts)
map('n', 'sj', '<C-w>j', opts)
map('n', 'sk', '<C-w>k', opts)
map('n', 'sl', '<C-w>l', opts)

-- Resize splits
map('n', '<C-w><C-h>', '<C-w>5>', opts)
map('n', '<C-w><C-j>', '<C-w>5+', opts)
map('n', '<C-w><C-k>', '<C-w>5-', opts)
map('n', '<C-w><C-l>', '<C-w>5<', opts)
map('n', '<Leader>rp', ':resize 100<CR>', opts)

-- Navigate quick fix list
map('n', '<C-J>', 'cprev<CR>zz', opts)
map('n', '<C-K>', 'cnext<CR>zz', opts)
-- Navigate local list
map('n', '<Leader>j', ':lprev<CR>zz', opts)
map('n', '<Leader>k', ':lnext<CR>zz', opts)

map('v', 'J', ':m \'>+1<CR>gv=gv', opts) -- Move line down
map('v', 'K', ':m \'<-2<CR>gv=gv', opts) -- Move line up

map('n', 'Y', 'y$', opts) -- Make <S-y> yank to end of line to be consistent with <S-d> and <S-c>

-- Keep centered
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)
map('n', 'J', 'mxJ`z', opts)

-- Undo break point
map('i', ',', ',<C-g>u', opts)
map('i', '.', '.<C-g>u', opts)
map('i', '!', '!<C-g>u', opts)
map('i', '?', '?<C-g>u', opts)

-- TODO not working. Look into ttimeoutlen
map('n', 'gV', '`[V`]', opts) -- Select recently pasted

-- Telescope
map('n', '<Leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<Leader>fd', ':Telescope file_browser<CR>', opts)
map('n', '<Leader>fr', ':Telescope oldfiles<CR>', opts)
map('n', '<Leader>fg', ':Telescope live_grep<CR>', opts)
map('n', '<Leader>fb', ':Telescope buffers<CR>', opts)
map('n', '<Leader>fh', ':Telescope help_tags<CR>', opts)

-- Harpoon
map('n', '<Leader>a', ':lua require("harpoon.mark").add_file()<CR>', opts)
map('n', '<Leader>hl', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
map('n', '<Leader>hc', ':lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>', opts)
map('n', '<C-h>', ':lua require("harpoon.ui").nav_file(1)<CR>', opts)
map('n', '<C-j>', ':lua require("harpoon.ui").nav_file(2)<CR>', opts)
map('n', '<C-k>', ':lua require("harpoon.ui").nav_file(3)<CR>', opts)
map('n', '<C-l>', ':lua require("harpoon.ui").nav_file(4)<CR>', opts)

-- NvimTree
map('n', '<Leader>nt', ':NvimTreeToggle<CR>', opts)		-- NvimTree
map('n', '<Leader>nr', ':NvimTreeRefresh<CR>', opts)	-- NvimTree refresh
map('n', '<Leader>nf', ':NvimTreeFindFile<CR>', opts)	-- NvimTree find current file
