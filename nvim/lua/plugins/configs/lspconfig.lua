require("nvchad.configs.lspconfig").defaults()

local servers = { "clangd", "html", "cssls", "bashls" }

vim.lsp.enable(servers)
