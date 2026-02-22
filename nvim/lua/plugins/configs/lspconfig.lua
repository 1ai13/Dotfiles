require("nvchad.configs.lspconfig").defaults()

local servers = { "clangd", "html", "cssls", "cmake" }

vim.lsp.enable(servers)
