-- :help options
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.cursorline = true
vim.opt.foldcolumn = '1'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.foldnestmax = 1
vim.opt.autoread = true
vim.opt.compatible = false
vim.opt.path = vim.o.path .. ',**'
vim.opt.wildmenu = true
vim.opt.background = "dark"

vim.cmd("colorscheme tokyonight")

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
    local filename = vim.fn.expand("%:~:.")
    local statusline = ""
    if branch ~= "" then
      statusline = filename .. "       ( " .. branch .. " )"
    else 
      statusline = filename 
    end 
    vim.opt.statusline = statusline
  end
})
