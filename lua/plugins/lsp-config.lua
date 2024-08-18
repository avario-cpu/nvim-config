return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ltex", "powershell_es" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Set up Lua Language Server
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          -- Disable formatting capabilities
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }, -- Recognize `vim` as a global to avoid warnings
            },
          },
        },
      }) -- Lua and LTeX setups remain the same...

      -- Set up LTeX Language Server for grammar checking
      lspconfig.ltex.setup({
        capabilities = capabilities,
        settings = {
          ltex = {
            language = "en-US",
            additionalRules = {
              enablePickyRules = true,
            },
          },
        },
      })

      -- PowerShell Editor Services setup
      local mason_path = vim.fn.stdpath("data") .. "/mason"
      local powershell_es_path = mason_path
          .. "/packages/powershell-editor-services/PowerShellEditorServices/Start-EditorServices.ps1"
      local bundled_modules_path = mason_path .. "/packages/powershell-editor-services"
      local log_path = vim.fn.stdpath("cache") .. "/powershell_es.log"
      local session_path = vim.fn.stdpath("cache") .. "/powershell_es.session.json"

      lspconfig.powershell_es.setup({
        capabilities = capabilities,
        cmd = {
          "pwsh",
          "-NoLogo",
          "-NoProfile",
          "-Command",
          string.format(
            "& '%s' -BundledModulesPath '%s' -LogPath '%s' -SessionDetailsPath '%s' -FeatureFlags @() -AdditionalModules @() -HostName nvim -HostProfileId 0 -HostVersion 1.0.0 -Stdio -LogLevel Normal",
            powershell_es_path,
            bundled_modules_path,
            log_path,
            session_path
          ),
        },
        settings = {
          powershell = {
            scriptAnalysis = {
              enable = true,
            },
            codeFormatting = {
              preset = "OTBS",
            },
          },
        },
      })
    end,
  },
}
