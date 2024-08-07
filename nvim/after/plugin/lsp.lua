local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, buffer)
    local opts = { buffer = buffer, remap = false }
    if client.supports_method('textDocument/formatting') then
        require('lsp-format').on_attach(client)
    end

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("v", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

vim.keymap.set("n", "<leader>vf", function() end, opts)

require 'lspconfig'.tsserver.setup {}
-- require('flutter-tools').setup({
-- lsp = {
-- capabilities = lsp.get_capabilities()
-- }
-- })

require 'lspconfig'.omnisharp.setup({
    cmd = { vim.fn.stdpath("data") .. "/mason/packages/omnisharp/omnisharp" },
    handlers = {
        ["textDocument/definition"] = require("omnisharp_extended").handler,
    },
    enable_editorconfig_support = true,
    enable_ms_build_load_projects_on_demand = false,
    enable_roslyn_analyzers = true,
    organize_imports_on_format = true,
    enable_import_completion = true,
    sdk_include_prereleases = true,
    analyze_open_documents_only = true,
})

require 'lspconfig'.rust_analyzer.setup {}


require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = {
        "jsonls",        -- json lsp
        "html",          -- html lsp
        "cssls",         -- CSS lsp
        'tsserver',      -- Typescript lsp
        'lua_ls',        -- Lua lsp
        'pyright',       -- Python lsp
        'rust_analyzer', -- Rust lsp
        'gopls',         -- Golang lsp
        'omnisharp',     -- C# lsp
        'yamlls',        -- YAML lsp
        --'svelte',
    },
    handlers = {
        lsp.default_setup,
    },
})

local cmp = require('cmp')
vim.api.nvim_create_autocmd("BufRead", {
    group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
    pattern = "Cargo.toml",
    callback = function()
        cmp.setup.buffer({ sources = { { name = "crates" } } })
    end,
})

lsp.setup()
