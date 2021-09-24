vim.api.nvim_set_keymap('i','<S-Insert>', '<C-R>+', {silent=true})

-- vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap=true, silent=true})
vim.g.mapleader = ' ' --<SPACE> treba koristiti samo za mapiranja, ne za map leader!

-- resizuje prozore keymappovima u Normal mode-u. "M" je meta key, iliti Alt taster
vim.api.nvim_set_keymap('n', '<M-j>', ':resize -2<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<M-k>', ':resize +2<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<M-h>', ':vertical resize -2<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<M-l>', ':vertical resize +2<CR>', {noremap=true, silent=true})

-- pomeriti selektovanu liniju gore/dole u Visual line mode-u (Shift-V)
vim.api.nvim_set_keymap('x', 'k', ":move '<-2<CR>gv-gv", {noremap=true, silent=true})
vim.api.nvim_set_keymap('x', 'j', ":move '>+1<CR>gv-gv", {noremap=true, silent=true})

--Remap za save
vim.api.nvim_set_keymap('i', '<C-s>', '<cmd>w<cr>', { noremap = true })

