local M = {}
require("configs.options")
require("configs.mappings")
require("configs.autocmds")
M.base46 = { theme = "onedark" }
M.ui = { telescope = { style = "bordered" } }
M.lsp = { signature = false }
return M
