---@diagnostic disable: undefined-global
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }

-- 取消 s 默认功能
map("n", "s", "", opt)
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- 改变链接跳转
map("n", "cd", "<C-]>", opt)
-- Alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s.", ":vertical resize +20<CR>", opt)
-- 上下比例
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- 等比例
map("n", "s=", "<c-w>=", opt)
-- Terminal相关
map("n", "<leader>t", ":sp | resize 10 | terminal<CR> ", opt)
-- map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)
-- visual模式下缩进代码
map("v", "<S-Tab>", "<gv", opt)
map("v", "<Tab>", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
-- -- ctrl u / ctrl + d  只移动9行，默认移动半屏
-- map("n", "<C-u>", "9k", opt)
-- map("n", "<C-d>", "9j", opt)
-- 移到最前最后
map("n", "<leader>l", "$", opt)
map("n", "<leader>h", "0", opt)
-- 将ctrl-c改为esc，使其能够触发Event InsertLeave
map("i", "<c-c>", "<Esc>", opt)
-- insert 模式下，跳到行首行尾
map("i", "<c-h>", "<esc>I", opt)
map("i", "<c-l>", "<esc>A", opt)
-- insert 模式下，上下左右移动光标
map("i", "<c-f>", "<RIGHT>", opt)
map("i", "<c-b>", "<left>", opt)
map("i", "<c-p>", "<up>", opt)
map("i", "<c-n>", "<down>", opt)
-- command config
-- map("c", "<c-p>", "<up>", opt)
-- map("c", "<c-n>", "<down>", opt)

-- nvimtree 插件设置toggle --
map("n", "<leader>m", "<CMD>NvimTreeToggle<CR>",opt)
-- bufferline 插件设置 --
map("n", "<c-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<c-l>", ":BufferLineCycleNext<CR>", opt)
map("n", "<c-w>", ":Bdelete!<CR>", opt)

-- comment
vim.cmd('nmap  gcc')
vim.cmd('vmap  gc')
