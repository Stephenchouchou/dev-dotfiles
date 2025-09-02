return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- 給所有 LSP 用的 completion 能力
    local capabilities = cmp_nvim_lsp.default_capabilities()

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "clangd",
        -- 想自動安裝的 server 加在這裡
      },

      -- ✅ 新版 mason-lspconfig 用法：在 setup 裡放 handlers
      handlers = {
        -- 預設：所有 server 都走這條
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,

        -- ---- 特例 (依你原本設定) ----
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = { globals = { "vim" } },
                completion = { callSnippet = "Replace" },
              },
            },
          })
        end,
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        -- 這裡放 formatter / linter / DAP 等（非 LSP）
        -- 例如 "stylua", "prettier", "eslint_d"
      },
    })
  end,
}

