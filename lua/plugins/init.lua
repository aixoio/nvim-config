return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  -- These are some examples, uncomment them if you want to see them work!
   {
    "neovim/nvim-lspconfig",
     config = function()
     require("nvchad.configs.lspconfig").defaults()
     require "configs.lspconfig"
   end,
},

 {
 	"williamboman/mason.nvim",
 	opts = {
		ensure_installed = {
 			"lua-language-server", "clangd",
 			"html-lsp", "css-lsp" , "gopls",
      "vue-language-server", "astro-language-server",
      "tailwindcss-language-server", "pyright",
        "rust-analyzer", "dockerfile-language-server",
        "templ", "cmake-language-server", "htmx-lsp",
        "kotlin-language-server", "svelte-language-server",
        "typescript-language-server", "prisma-language-server",
 		}
 	},
 },
  --
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
