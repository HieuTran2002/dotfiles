local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
--- vim.keymap.set('n', '<leader>pf', builtin.git_files, {})

vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

--- vim.keymap.set('n', '<leader>fg',  function()
---	builtin.grep_string({ search = vim.fn.input("Grep >")});
--- end)
