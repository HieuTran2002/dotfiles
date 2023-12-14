print("loaded dap")
require("nvim-dap-virtual-text").setup()
require("dapui").setup()
vim.api.nvim_set_keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>dc", ":DapContinue<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>dq", ":require('dapui').close()<CR>", {noremap=true})