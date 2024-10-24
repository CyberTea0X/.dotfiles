vim.g.mapleader = " "


-- open oil nvim file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Oil)
--vim.keymap.set("n", "<leader>pr", vim.cmd.Rex)

-- to move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- to join lines
vim.keymap.set("n", "J", "mzJ`z")

-- to move up and down quickly with cursor staying at the center of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keeps cursor in the middle while searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- pastes over selected text and selected text goes into the void register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- pastes from system buffer
vim.keymap.set("x", "<leader><leader>p", '"*p')
vim.keymap.set("n", "<leader><leader>p", '"*p')

-- allows to yank into the system register
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- deletes into the void register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- just for ctrl+c to work properly
vim.keymap.set("i", "<C-c>", "<Esc>")

-- capital q is the evil
vim.keymap.set("n", "Q", "<nop>")
-- just for linux
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- quicklist navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- rename word in all document
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- makes bash into executable (maybe not only bash, idk)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- show diagnostic
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
