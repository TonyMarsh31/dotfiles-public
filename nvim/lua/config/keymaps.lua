-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
-- 在使用U、D 上下翻半页后，保持当前的指针处于页面的中部
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
-- 同样的，保持search模式中，查找下、上一个时，指针 in the middle
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
