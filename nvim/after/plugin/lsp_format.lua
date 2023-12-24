require("lsp-format").setup {
    typescript = {
        tab_width = function ()
            return vim.opt.shiftwidth:get()
        end,
    }
}
