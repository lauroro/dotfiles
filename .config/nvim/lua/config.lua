-- Generals
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 0
vim.opt.tabstop = 2
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.clipboard = 'unnamedplus'



-- Catppuccin
require("catppuccin").setup({
  flavour = "mocha",   -- latte, frappe, macchiato, mocha
  background = {
    light = "latte",
    dark = "mocha",
  },
  transparent_background = false,
  color_overrides = {
    mocha = {
      base = "#0f0f0f",
      mantle = "#0c0c0c",
    },
  }
})
vim.cmd.colorscheme "catppuccin"



-- Nvim-tree
vim.opt.termguicolors = true
require("nvim-tree").setup()



-- Lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  }
}



-- Bufferline
require 'bufferline'.setup {
  auto_hide = true
}



-- Colorizer
require 'colorizer'.setup()



-- Telescope
require('telescope').setup {
  defaults = {
    -- config_key = value,
    mappings = {
      i = {
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {},
  extensions = {}
}



-- Which-key
vim.o.timeout = true
vim.o.timeoutlen = 300
require("which-key").setup {}



-- Autopairs
require("nvim-autopairs").setup {}



-- Luasnip, friendly snippet
require("luasnip.loaders.from_vscode").lazy_load()



-- Nvim-cmp
local cmp = require("cmp")
cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
        end,
    },
  mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }),
  sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    }, {
      { name = 'buffer' },
    })
})
local capabilities = require("cmp_nvim_lsp").default_capabilities()



-- Meson, Lspconfig
require("mason").setup()
local mlspc = require'mason-lspconfig'
mlspc.setup{
  ensure_installed = {
    -- check new lsp names with :LspInstall
    "lua_ls",
    "rust_analyzer",
    "pyright",
    "bashls",
    "html"
  },
}
mlspc.setup_handlers {
  function(server)
    require('lspconfig')[server].setup{
      capabilities = capabilities
    }
  end
}



-- Tree-sitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  -- ensure_installed = { "c", "lua", "vim", "help", "query" },
  ensure_installed = {},
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  auto_install = true,
  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },
  highlight = {
    enable = true,
    disable = { "javascript" },
  },
}
