-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    --     {
    --         "rachartier/tiny-glimmer.nvim",
    --         config = function()
    --             require('tiny-glimmer').setup()
    --         end,
    --         event = "TextYankPost",
    --         opts = {
    --             -- your configuration
    --         },
    --     },

    -- file explorer that lets you edit your filesystem like a normal nvim buffer
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
    },
    -- theme
    {
        "folke/tokyonight.nvim",
    },
    -- auto detecting indent style
    {
        'nmac427/guess-indent.nvim',
        config = function()
            require('guess-indent').setup()
        end
    },
    -- translation
    'uga-rosa/translate.nvim',
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    -- quick navigation and bookmarks across the projects
    {
        "otavioschwanck/arrow.nvim",
        opts = {
            show_icons = true,
            leader_key = '<leader>a',        -- Recommended to be a single key
            buffer_leader_key = '<leader>m', -- Per Buffer Mappings
            global_bookmarks = true,
        }
    },
    'mbbill/undotree',
    'tpope/vim-fugitive',
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    -- lsp signature help
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts) require 'lsp_signature'.setup(opts) end
    },
    -- snippets
    { "rafamadriz/friendly-snippets" },
    { 'saadparwaiz1/cmp_luasnip' },
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
    },
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
    },
    -- lsp
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x' },
    -- autocompletion
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
})
vim.cmd('colorscheme tokyonight')
