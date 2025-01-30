local plugins = {
  {
    "olimorris/persisted.nvim",
    config = function()
      require("persisted").setup({
        autoload = true, -- Automatically load session for the current directory
        use_git_branch = true, -- Create session files per branch
      })
      require("telescope").load_extension("persisted")
    end,
    lazy = false
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end

  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd"
      }
    }
  }
}
return plugins

