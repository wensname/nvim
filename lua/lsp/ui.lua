vim.diagnostic.config({
    virtual_text = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
        },
    },
    update_in_insert = false,
    underline = true,
    show_header = false,
    severity_sort = true,
    float = {
        source = "always",
        border = "rounded",
        style = "minimal",
        header = "",
        -- prefix = " ",
        -- max_width = 100,
        -- width = 60,
        -- height = 20,
    },
})

--local signs = { Error = " ", Warn = " " , Hint = " ", Info = " " }
--for type, icon in pairs(signs) do
  --local hl = "DiagnosticSign" .. type
  --vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
--end
