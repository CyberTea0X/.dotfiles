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

    -- some features for golang
    {
        "olexsmir/gopher.nvim",
        ft = "go",
        config = function(_, opts)
            require("gopher").setup(opts)
        end,
        build = function()
            vim.cmd [[silent! GoInstallDeps]]
        end
    },
    -- file explorer that lets you edit your filesystem like a normal nvim buffer
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
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
    -- game for being good at vim
    'thePrimeagen/vim-be-good',
    -- helps working with cargo.toml
    {
        'saecki/crates.nvim',
        tag = 'stable',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    },
    -- openssl decryption/encryption
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
    -- C sharp
    "Hoffs/omnisharp-extended-lsp.nvim",
    -- just for discord presence, nothing practical
    'andweeb/presence.nvim',
    -- lsp and other for flutter
    -- use {
    -- 'akinsho/flutter-tools.nvim',
    -- requires = {
    -- 'nvim-lua/plenary.nvim',
    -- 'stevearc/dressing.nvim', -- optional for vim.ui.select
    -- },
    -- }
    -- auto install lsp
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
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
    -- leetcode stuff
    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim", -- required by telescope
            "MunifTanjim/nui.nvim",

            -- optional
            "nvim-treesitter/nvim-treesitter",
            "rcarriga/nvim-notify",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {}
    },
    --
})
vim.cmd('colorscheme tokyonight')
