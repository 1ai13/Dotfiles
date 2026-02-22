vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.sessionoptions = "blank,buffers,curdir,folds,tabpages,winsize,terminal,options,localoptions,globals"
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#FFFF66" }) -- bright yellow
vim.api.nvim_set_hl(0, "NvimTreeGitStaged", { fg = "#00FF00" })
