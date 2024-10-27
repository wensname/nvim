local mason = pRequire("mason")
local mason_config = pRequire("mason-lspconfig")
local lspconfig = pRequire("lspconfig")

if not mason or not mason_config or not lspconfig then
    return
end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
mason_config.setup({
    ensure_installed = { "clangd", "pyright", "lua_ls","vimls" }
})
lspconfig.pyright.setup {}
lspconfig.clangd.setup {}
lspconfig.lua_ls.setup {}
lspconfig.vimls.setup {}
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local opt = { buffer = args.buf, noremap = true, silent = true }
        --vim.api.nvim_buf_set_keymap(args.buf, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opt)
        vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
        -- code action
        vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
        -- go xx
        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
        vim.keymap.set("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
        vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
        vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
        -- diagnostic
        vim.keymap.set("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
        vim.keymap.set("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
        vim.keymap.set("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
        vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
        --mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
        -- Unset 'formatexpr'
        -- vim.bo[args.buf].formatexpr = nil
        -- Unset 'omnifunc'
        --vim.bo[args.buf].omnifunc = nil
        -- Unmap K
        --vim.keymap.del('n', 'K', { buffer = args.buf })
    end,
})
require("lsp.ui")
