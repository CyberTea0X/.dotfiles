local lsp = require('lsp-zero')

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local lsp_format_on_save = function(bufnr)
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format()
        end,
    })
end

local lsp_attach = function(_, bufnr)
    local opts = { buffer = bufnr }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set('n', 'go', function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', 'gs', function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end, opts)
    vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
    lsp_format_on_save(bufnr)
end


lsp.extend_lspconfig({
    sign_text = true,
    lsp_attach = lsp_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = {
        "jsonls",        -- json lsp
        "html",          -- html lsp
        "cssls",         -- CSS lsp
        'ts_ls',         -- Typescript lsp
        'jdtls',
        'lua_ls',        -- Lua lsp
        'pyright',       -- Python lsp
        'rust_analyzer', -- Rust lsp
        'gopls',         -- Golang lsp
        'omnisharp',     -- C# lsp
        'yamlls',        -- YAML lsp
        'clangd',        -- C/C++
        --'svelte',
    },
    handlers = {
        lsp.default_setup,
    },
})

require 'lspconfig'.ts_ls.setup {}
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
require 'lspconfig'.clangd.setup {
    cmd = {
        "clangd",
        "--fallback-style=webkit"
    }
}


local cmp = require('cmp')
vim.api.nvim_create_autocmd("BufRead", {
    group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
    pattern = "Cargo.toml",
    callback = function()
        cmp.setup.buffer({ sources = { { name = "crates" } } })
    end,
})

vim.api.nvim_create_autocmd('BufRead', {
    desc = 'set filetype xml for extension .axaml',
    pattern = '*.axaml',
    callback = function()
        vim.bo.filetype = 'xml'
    end,
})
