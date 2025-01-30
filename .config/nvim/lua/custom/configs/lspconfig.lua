local base = require("nvchad.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")


lspconfig.clangd.setup {
  on_attach = function(client, buffnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, buffnr)
  end,
  capabilities = capabilities
}

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
  }
  vim.lsp.buf.execute_command(params)
end 

lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    prefrences = {
      disableSuggestions = true,
    }
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    }
  }
}
