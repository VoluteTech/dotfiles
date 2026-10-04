local MiniPick = require("mini.pick")

MiniPick.setup()

vim.keymap.set("n", "<leader>pf", function ()
  MiniPick.builtin.files()
end, { desc = "Open global file picker" } )

vim.keymap.set("n", "<leader>ps", function ()
  MiniPick.builtin.grep({ pattern = vim.fn.expand("<cword>") })
end, { desc = "Word search" } )

vim.keymap.set('n', '<leader>vh', function()
  MiniPick.builtin.help()
end, { desc = "Mini Help"})
