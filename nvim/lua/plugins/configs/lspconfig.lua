require("nvchad.configs.lspconfig").defaults()

local servers = { "clangd", "html", "cssls" }

vim.lsp.enable(servers)
