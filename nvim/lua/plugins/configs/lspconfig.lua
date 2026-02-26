require("nvchad.configs.lspconfig").defaults()

local servers = { "clangd", "html", "cssls", "cmake", "bashls" }

vim.lsp.enable(servers)
