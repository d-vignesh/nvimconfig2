local cmp = require('cmp')
cmp.setup {
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({select = true}),
  },
   sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  },
}
