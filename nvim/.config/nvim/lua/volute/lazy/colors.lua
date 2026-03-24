function ColorMyPencils(color)
  color = color or "rose-pine-moon"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   config = function()
  --     require('rose-pine').setup({
  --       disable_background = true,
  --       styles = {
  --         italic = false,
  --       },
  --     })
  --
  --     ColorMyPencils();
  --   end
  -- },

  -- {
  --   "RRethy/base16-nvim",
  --   config = function()
  --     ColorMyPencils("base16-brewer")
  --   end
  -- },
  --
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   config = function()
  --     require("catppuccin").setup({
  --       flavour = "mocha",
  --       background = {
  --         light = "mocha",
  --         dark = "mocha",
  --       },
  --     })
  --     ColorMyPencils("catppuccin")
  --   end
  -- },
  -- {
  --   "xero/miasma.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd("colorscheme miasma")
  --   end,
  -- },
  {
    'dasupradyumna/midnight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      ColorMyPencils("midnight")
    end
  }
}
