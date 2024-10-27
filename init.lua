---@diagnostic disable: undefined-global
require('basic')
require("keybindings")
require("plugins")
require("colorscheme")
require("autocmd")
require("utils.global")
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.nvim-treesitter")
require("lsp.setup")
require("lsp.cmp")
-- make background transparent
require("plugin-config.transparent")
-- markdown preview
require("plugin-config.mdp")
