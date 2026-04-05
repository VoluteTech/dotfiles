return {
  {
    dir = "~/personal/projects/manuscript.nvim",
    config = function()
      require("manuscript").setup({
        vault_path = "~/personal/vault",
        border = "rounded",
      })

      vim.keymap.set("n", "<leader>mo", ":ManuscriptToggle<CR>", {})
      vim.keymap.set("n", "<leader>md", ":ManuscriptClear<CR>", {})
    end
  },
}
