local nvimTree = pRequire("nvim-tree")
local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', 'cd', api.tree.change_root_to_node,        opts('CD'))
  vim.keymap.set('n', 'sv', api.node.open.vertical,        opts('Open: Vertical Split'))
  vim.keymap.set('n', 'sh', api.node.open.horizontal,        opts('Open: Horizontal Split'))
  vim.keymap.set('n', 'st', api.node.open.tab,        opts('Open: New Tab'))
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end
nvimTree.setup({
  on_attach = my_on_attach
})
