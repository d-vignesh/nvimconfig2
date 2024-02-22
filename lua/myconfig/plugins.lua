require("packer").init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "folke/tokyonight.nvim"

  -- lsp
  use "neovim/nvim-lspconfig"

  -- syntax highlighting
  use "nvim-treesitter/nvim-treesitter"

  -- completion
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
end)
