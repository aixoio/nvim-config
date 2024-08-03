local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "templ", "cmake" }

local util = require 'lspconfig.util'
vim.filetype.add({ extension = { templ = "templ" } })

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach, on_init = on_init,
    capabilities = capabilities,
  }
end
local mason_registry = require('mason-registry')
local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'


-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
    init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'vue' },
      },
    },
    preferences = {
      disableSuggestions = true,
    },
      hostInfo = "neovim",
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', "vue" },
}

lspconfig.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"go", "gomod","gowork", "gotmpl"},
  cmd = {"gopls"},
  settings = {
    gopls = {
      completeUnimported = true,
    },
  },
})


lspconfig.clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"c", "cpp","h", "hpp"},
  cmd = {"clangd"},
})

-- lspconfig.volar.setup {}
-- lspconfig.vue_language_server.setup {}
-- require'lspconfig'.volar.setup{
  -- filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
-- }

-- lspconfig.volar.setup {
  -- cmd = { "vue-language-server", "--stdio" }
-- }
local function get_typescript_server_path(root_dir)

  -- Alternative location if installed as root:
  local global_ts = '/opt/homebrew/lib/node_modules/typescript/lib'
  local found_ts = ''
  local function check_dir(path)
    found_ts =  util.path.join(path, 'node_modules', 'typescript', 'lib')
    if util.path.exists(found_ts) then
      return path
    end
  end
  if util.search_ancestors(root_dir, check_dir) then
    return found_ts
  else
    return global_ts
  end
end

require'lspconfig'.volar.setup{
  on_new_config = function(new_config, new_root_dir)
    new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
  end,
  filetypes = {"vue"},
}
require'lspconfig'.astro.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"astro"},
  cmd = {"astro-ls", "--stdio"},
  init_options = {
    typescript = {}
  },
}
lspconfig.htmx.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "html", "templ" },
})

require'lspconfig'.tailwindcss.setup{
      on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      tailwindCSS = {
        includeLanguages = {
          templ = "html",
        },
      },
    },
}


require'lspconfig'.pyright.setup{}

require'lspconfig'.rust_analyzer.setup{}

require'lspconfig'.dockerls.setup{}

require'lspconfig'.kotlin_language_server.setup{}

require'lspconfig'.svelte.setup{
  cmd = { "svelteserver", "--stdio" },
  filetypes = { "svelte" },
}

require'lspconfig'.prismals.setup{}



