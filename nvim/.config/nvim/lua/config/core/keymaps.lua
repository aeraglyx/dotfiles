local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set("n", ";s", ":source %<CR>")
keymap.set("v", "y", "ygv<Esc>", { noremap = true, silent = true })
keymap.set("n", "Y", ":%y<CR>")
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- saving
keymap.set("n", "<C-s>", ":w<CR>")
keymap.set("v", "<C-s>", "<Esc>:w<CR>gv")
keymap.set("i", "<C-s>", "<Esc>:w<CR>gi")

-- moving lines up and down
keymap.set("n", "<C-j>", ":m +1<CR>==")
keymap.set("n", "<C-k>", ":m -2<CR>==")
keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")
keymap.set("i", "<C-j>", "<Esc>:m +1<CR>==gi")
keymap.set("i", "<C-k>", "<Esc>:m -2<CR>==gi")

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>h", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- TODO: based on language or find a plugin
-- keymap.set("n", "<leader>to", "o--TODO: ", { desc = "TODO comment snippet" })

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", {}),
    desc = "Hightlight selection on yank",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 100 })
        -- vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
    end,
})
