local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set("n", "<leader>so", "<cmd>source %<CR>")
keymap.set("n", "<leader>e", "<cmd>Explore<CR>")
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
keymap.set("i", "<C-BC>", "<C-w>")

-- saving
keymap.set("n", "<C-s>", "<cmd>w<CR>")
keymap.set("v", "<C-s>", "<Esc><cmd>w<CR>")
keymap.set("i", "<C-s>", "<Esc><cmd>w<CR>gi")

-- quitting
keymap.set({ "n", "i", "v" }, "<C-d>", "<Esc><cmd>q<CR>")
keymap.set({ "n", "i", "v" }, "<C-D>", "<Esc><cmd>q!<CR>")

-- copying
keymap.set("v", "y", "ygv<Esc>", { noremap = true, silent = true })
keymap.set("n", "Y", "<cmd>%y<CR>")

-- new lines
keymap.set("n", "<space>o", "mxo<esc>`x")
keymap.set("n", "<space>O", "mxO<esc>`x")

-- moving vertically through wrapped lines
keymap.set("n", "<down>", "gj")
keymap.set("n", "<up>", "gk")

-- moving lines up and down
keymap.set("n", "<A-e>", "<cmd>m +1<CR>==")
keymap.set("n", "<A-u>", "<cmd>m -2<CR>==")
keymap.set("v", "<A-e>", "<cmd>m '>+1<CR>gv=gv")
keymap.set("v", "<A-u>", "<cmd>m '<-2<CR>gv=gv")
keymap.set("i", "<A-e>", "<Esc><cmd>m +1<CR>==gi")
keymap.set("i", "<A-u>", "<Esc><cmd>m -2<CR>==gi")

-- windows
keymap.set("n", "<leader>wa", "<cmd>vsplit<CR>", { desc = "Split window vertically" })
keymap.set("n", "<leader>we", "<cmd>split<CR>", { desc = "Split window horizontally" })
keymap.set("n", "<leader>wi", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>wk", "<cmd>close<CR>", { desc = "Close current split" })

-- window navigation
keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap.set("n", "<C-a>", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap.set("n", "<C-e>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap.set("n", "<C-u>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tk", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<F1>", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<F3>", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- LSP
keymap.set("n", "lo", "<cmd>LspStop<CR>", { desc = "LSP stop" })
keymap.set("n", "la", "<cmd>LspStart<CR>", { desc = "LSP start" })
keymap.set("n", "<leader>er", "<cmd>lua vim.diagnostic.open_float(0)<CR>", { desc = "Show diagnostics" })

-- TODO: based on language or find a plugin
-- keymap.set("n", "<leader>to", "o--TODO: ", { desc = "TODO comment snippet" })
