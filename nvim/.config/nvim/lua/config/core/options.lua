vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.opt.breakindent = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.scrolloff = 8
vim.opt.inccommand = "split"
vim.opt.wrap = true
vim.opt.signcolumn = "yes:1"

vim.opt.cursorline = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.g.have_nerd_font = false

vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        vim.opt.formatoptions:remove { "c", "r", "o" }
    end,
    desc = "Disable New Line Comment",
})

vim.filetype.add({
    extension = {
        rasi = "rasi",
    },
    pattern = {
        [".*/hypr/.*%.conf"] = "hyprlang",
    },
})
