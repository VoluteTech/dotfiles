require("oil").setup({
  default_file_explorer = true,
  skip_confirm_for_simple_edits = true,
  view_options = {
    show_hidden = true
  }
})
vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>")


