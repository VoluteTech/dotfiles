local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

require('telescope').setup({
  extensions = {
    fzf = {}
  },
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "dist/",
      "build/",
      "target/",
    },
    pickers = {
      find_files = {
        find_command = { "rg", "--files", "--glob", "!**/node_modules/*" },
      },
    },
    path_display = { "smart" },
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },
  },
})

vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Telescope Find Files" })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Telescope Git Files" })
vim.keymap.set('n', '<leader>ps', function() 
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Telescope Grep Search" })
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fc', function()
  local word = vim.fn.expand("<cword>")
  builtin.grep_string({ search = word })
end)
vim.keymap.set('n', '<leader>pWs', function()
  local word = vim.fn.expand("<cWORD>")
  builtin.grep_string({ search = word })
end)

