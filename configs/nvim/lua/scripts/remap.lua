vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- remap chars that are being overwritten
vim.keymap.set("n", "<leader>/", "/")
vim.keymap.set("v", "<leader>/", "/")
vim.keymap.set("n", "<leader>m", "m")
vim.keymap.set("v", "<leader>m", "m")
vim.keymap.set("n", "<leader>.", ".")
vim.keymap.set("v", "<leader>.", ".")
vim.keymap.set("n", "<leader>,", ",")
vim.keymap.set("v", "<leader>,", ",")

vim.keymap.set("n", "<leader>?", "?")
vim.keymap.set("v", "<leader>?", "?")
vim.keymap.set("n", "<leader>M", "M")
vim.keymap.set("v", "<leader>M", "M")
vim.keymap.set("n", "<leader><", "<")
vim.keymap.set("v", "<leader>>", ">")
vim.keymap.set("n", "<leader><", "<")
vim.keymap.set("v", "<leader>>", ">")

-- map new movment keys
vim.keymap.set("n", "m", "h")
vim.keymap.set("v", "m", "h")
vim.keymap.set("n", ",", "j")
vim.keymap.set("v", ",", "j")
vim.keymap.set("n", ".", "k")
vim.keymap.set("v", ".", "k")
vim.keymap.set("n", "/", "l")
vim.keymap.set("v", "/", "l")

vim.keymap.set("n", "M", "H")
vim.keymap.set("v", "M", "H")
vim.keymap.set("n", "<", "J")
vim.keymap.set("v", "<", "J")
vim.keymap.set("n", ">", "K")
vim.keymap.set("v", ">", "K")
vim.keymap.set("n", "?", "L")
vim.keymap.set("v", "?", "L")

-- Keymaps for moving selection
vim.keymap.set("v", "<", ":m '>+1<CR>gv=gv'")
vim.keymap.set("v", ">", ":m '<-2<CR>gv=gv'")

-- Keeps the cursor in place when post pending
vim.keymap.set("n", "<", "mzJ`z")

-- Keep cursor in middle when jumping up or down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep current search in the center of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Allows you to paste without overwritting buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Allows copying and pasting to the sys clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>Y", "\"+Y")

-- Project selection
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- LSP formatter
vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)

-- quick fix navigation
vim.keymap.set("n", "<C-.>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-,>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>.", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>,", "<cmd>lprev<CR>zz")

-- Replace word under cursor
vim.keymap.set("n", "<leader>s",
    ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
