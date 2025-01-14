local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
  clear = true,
})

local autocmd = vim.api.nvim_create_autocmd

-- nvim-tree 自动关闭
autocmd("BufEnter", {
  nested = true,
  group = myAutoGroup,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd("quit")
    end
  end,
})

-- 自动切换输入法，需要安装 im-select
-- https://github.com/daipeihust/im-select
autocmd("InsertLeave", {
  group = myAutoGroup,
  callback = require("utils.im-select").windowsInsertLeave,
})
autocmd("InsertEnter", {
  group = myAutoGroup,
  callback = require("utils.im-select").windowsInsertEnter,
})

-- 进入Terminal 自动进入插入模式
autocmd("TermOpen", {
  group = myAutoGroup,
  command = "startinsert",
})

-- -- 保存时自动格式化
-- autocmd("BufWritePre", {
--   group = myAutoGroup,
--   pattern = { "*.lua", "*.py", "*.sh" },
--   callback = vim.lsp.buf.formatting_sync,
-- })
--
-- -- 修改lua/plugins.lua 自动更新插件
-- autocmd("BufWritePost", {
--   group = myAutoGroup,
--   -- autocmd BufWritePost lua/plugins.lua source <afile> | PackerSync
--   pattern = { "lua/plugins.lua" },
--   callback = function(event)
--     vim.cmd("source "..event.file)
--     vim.cmd("PackerSync")
--   end,
-- })
--
-- -- Highlight on yank
-- autocmd("TextYankPost", {
--   callback = function()
--     vim.highlight.on_yank()
--   end,
--   group = myAutoGroup,
--   pattern = "*",
-- })
--
-- -- 用o换行不要延续注释
-- autocmd("BufEnter", {
--   group = myAutoGroup,
--   pattern = "*",
--   callback = function()
--     vim.opt.formatoptions = vim.opt.formatoptions
--       - "o" -- O and o, don't continue comments
--       + "r" -- But do continue when pressing enter.
--   end,
-- })
