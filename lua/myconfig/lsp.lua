local lspconf = require("lspconfig")
local servers = { "gopls", "lua_ls", "pylsp" }

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, noremap = true, silent = true }
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>se", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>le", vim.diagnostic.setloclist, opts)
  vim.keymap.set("n", "<leader>ne", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>pe", vim.diagnostic.goto_prev, opts)
end

for _, s in ipairs(servers) do
  lspconf[s].setup {
    on_attach = on_attach,
    init_options = {
      staticcheck = true,
      gofumpt = true,
    }
  }
end

local function formatAndImport()
  vim.lsp.buf.format()
  vim.lsp.buf.code_action({ apply = true})
end

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function(args)
    formatAndImport(3000)
  end,
})
