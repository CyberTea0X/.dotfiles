require("translate").setup({
    default = {
        command = "google",
        output = "replace",
        parse_before = "trim",
    },
})
vim.keymap.set("v", "<leader>te", ':Translate EN<CR>')
vim.keymap.set("n", "<leader>te", ':Translate EN<CR>')
vim.keymap.set("v", "<leader>tr", ':Translate RU<CR>')
vim.keymap.set("n", "<leader>tr", ':Translate RU<CR>')
-- Meow
