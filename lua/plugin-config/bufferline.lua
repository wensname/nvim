---@diagnostic disable: need-check-nil
local bufferline = pRequire("bufferline")
bufferline.setup({
  options = {
    -- 关闭 Tab 的命令，这里使用 moll/vim-bbye 的 :Bdelete 命令
    close_command = "Bdelete! %d",
    right_mouse_command = "bdelete! %d",
    -- 不要斜体
    style_preset = bufferline.style_preset.no_italic,

    -- 指示器indicator
    indicator = {
        icon = '▎', -- this should be omitted if indicator style is not 'icon'
        style = 'underline' ,
    },
    -- 侧边栏配置
    -- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
    -- 颜色
    highlights = {
        indicator_selected = {
          bg = "#fc1605",
          fg = "#ff0000",
        },
        buffer_selected = {
          bg = "#FF0000",
          fg = "#2a49d4"
        },
    },
    -- 使用 nvim 内置 LSP 
    diagnostics = "nvim_lsp",
    -- 可选，显示 LSP 报错图标
    ---@diagnostic disable-next-line: unused-local
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " " or (e == "warning" and " " or "")
        s = s .. n .. sym
      end
      return s
    end,
  },
})
