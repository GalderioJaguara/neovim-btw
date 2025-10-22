return {
  { 
    "mason-org/mason.nvim",
      opts = {
      }
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "ts_ls" }
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
     dependencies = { 'saghen/blink.cmp' },
      config = function()
        local capabilities = require('blink.cmp').get_lsp_capabilities()
        local lspconfig = require("lspconfig")
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      

        lspconfig['lua_ls'].setup({ capabilities = capabilities })
        lspconfig['ts_ls'].setup({ capabilities = capabilities })
      end

  } 

}
