-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Blured Background
vim.g.lazyvim_window_blurred = 1
vim.cmd("highlight Normal guibg=none")
vim.cmd("highlight NonText guibg=none")
