require("manuscript").setup({
  vault_path = "~/personal/vault", -- Pass your preferences here
  border = "rounded", -- The default border is a custom one
})

vim.keymap.set("n", "<leader>mo", ":ManuscriptToggle<CR>", {})
