-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

-- 1. REMOVE cssls from this list
local servers = { "html", "angularls", "ts_ls", "pyright" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
  vim.lsp.enable(lsp)
end

-- 2. Configure cssls separately to ignore Tailwind's custom @ rules
vim.lsp.config("cssls", {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    css = {
      lint = {
        unknownAtRules = "ignore",
      },
    },
  },
})
vim.lsp.enable "cssls"

-- 3. Keep your working tailwindcss config
vim.lsp.config("tailwindcss", {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  root_markers = {
    "tailwind.config.js",
    "tailwind.config.ts",
    "tailwind.config.mjs",
    "postcss.config.js",
    "postcss.config.mjs",
    "package.json",
    "node_modules",
    ".git",
  },
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*)\"['`]" },
          { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
        },
      },
    },
  },
})
vim.lsp.enable "tailwindcss"
