-- Set LeaderKey as comma (for using vim-easymotion)
vim.g.mapleader = ','

local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
-- keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- vim特性:如果copy的内容直接在已有数据上进行以替换为目的paste，那么寄存器中的内容就发生了变化，成为了被替换的内容
-- 若想保留寄存器中的数据，进行多次数据替换，可以使用leader + p
keymap.set('', '<leader>p', '\"_dp')

-- 在V模式中选中后,使用JK将选中的内容上下移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- 在使用U、D 上下翻半页后，保持当前的指针处于页面的中部
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
-- 同样的，保持search模式中，查找下、上一个时，指针 in the middle
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
