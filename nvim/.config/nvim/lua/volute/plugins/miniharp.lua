local miniharp = require('miniharp')
miniharp.setup({
  autoload = true,
  autosave = true,
  show_on_autoload = false,
})

vim.keymap.set('n', '<leader>a', miniharp.toggle_file, { desc = 'miniharp: toggle file mark' })
vim.keymap.set('n', '<C-e>', miniharp.show_list,   { desc = 'miniharp: toggle marks list' })

vim.keymap.set('n', '<C-f>', function() miniharp.go_to(1) end, { desc = 'miniharp: go to mark 1' })
vim.keymap.set('n', '<C-g>', function() miniharp.go_to(2) end, { desc = 'miniharp: go to mark 2' })
vim.keymap.set('n', '<C-t>', function() miniharp.go_to(3) end, { desc = 'miniharp: go to mark 3' })
vim.keymap.set('n', '<C-b>', function() miniharp.go_to(4) end, { desc = 'miniharp: go to mark 4' })
