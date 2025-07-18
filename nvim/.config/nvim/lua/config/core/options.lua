vim.opt.swapfile = false
vim.opt.undofile = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.iskeyword:append("-")

-- TODO: per ft (.md)
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

-- vim.opt.spell = true

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.cursorline = true
vim.opt.scrolloff = 4

vim.opt.inccommand = "split"
vim.opt.signcolumn = "yes:1"
vim.opt.statuscolumn = "%s%3l  "
vim.opt.fillchars:append { eob = " " }

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.g.have_nerd_font = true
vim.opt.laststatus = 3
-- vim.opt.winborder = "rounded"

vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)

vim.diagnostic.config({
    virtual_text = false,
    signs = false,
    float = { border = "rounded" },
})

vim.filetype.add({
    extension = {
        rasi = "rasi",
    },
    pattern = {
        [".*/hypr/.*%.conf"] = "hyprlang",
    },
})

vim.api.nvim_create_autocmd("BufEnter", {
    desc = "Disable New Line Comment",
    callback = function()
        vim.opt.formatoptions:remove({ "c", "r", "o" })
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Hightlight selection on yank",
    group = vim.api.nvim_create_augroup("highlight_yank", {}),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 125 })
    end,
})
